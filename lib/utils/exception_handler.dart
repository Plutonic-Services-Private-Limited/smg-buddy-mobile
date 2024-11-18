import 'package:smg_buddy_app/constants/constants.dart';
import 'package:smg_buddy_app/routes/app_pages.dart';
import 'package:smg_buddy_app/utils/app_logger.dart';
import 'package:smg_buddy_app/utils/app_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class APIExceptionString implements Exception {
  String? detail;

  APIExceptionString({this.detail});

  APIExceptionString.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['detail'] = detail;
    return data;
  }
}

class ExceptionHandler {
  static handleDioError(DioException error) {
    AppLogger.print(error);
    switch (error.type) {
      case DioExceptionType.unknown:
        EasyLoading.showError(ErrorMessages.noInternet);
        break;
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        EasyLoading.showError(ErrorMessages.connectionTimeout);
        break;
      case DioExceptionType.badResponse:
        if(error.response?.statusCode == 401 || error.response?.statusCode == 403){
          try {
            var apiException =
            APIExceptionString.fromJson(error.response?.data);
            EasyLoading.showError(
                apiException.detail ?? ErrorMessages.networkGeneral);
          } catch (e) {
            EasyLoading.showError(ErrorMessages.networkGeneral);
          }
          AppUtils.logout();
          Get.toNamed(Routes.login);
        }
        if (error.response != null && error.response?.data != null) {
          try {
            var apiException =
                APIExceptionString.fromJson(error.response?.data);
            EasyLoading.showError(
                apiException.detail ?? ErrorMessages.networkGeneral);
          } catch (e) {
            EasyLoading.showError(ErrorMessages.networkGeneral);
          }
        }
        break;
      default:
        EasyLoading.showError(ErrorMessages.networkGeneral);
        break;
    }
  }

  static handleError(Exception error) {
    EasyLoading.showError(ErrorMessages.networkGeneral);
  }
}
