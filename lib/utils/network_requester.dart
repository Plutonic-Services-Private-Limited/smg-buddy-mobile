import 'dart:developer';

import 'package:smg_buddy_app/constants/constants.dart';
import 'package:smg_buddy_app/utils/app_logger.dart';
import 'package:smg_buddy_app/utils/exception_handler.dart';
import 'package:smg_buddy_app/utils/flavor_utils.dart';
import 'package:dio/dio.dart';

class NetworkRequester {
  Dio? _dio;

  NetworkRequester._privateConstructor() {
    prepareRequest();
  }

  static final NetworkRequester shared = NetworkRequester._privateConstructor();

  void prepareRequest({Map<String, dynamic>? headers}) {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: const Duration(milliseconds: Timeouts.connectTimeout),
      receiveTimeout: const Duration(milliseconds: Timeouts.connectTimeout),
      baseUrl: Env.baseURL,
      // contentType: Headers.formUrlEncodedContentType,
      responseType: ResponseType.json,
      headers: {
        'Accept': Headers.jsonContentType,
        'Content-Type': 'application/json',
        'auth-token':
            'eyJ0eXAiOiJqd3QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6NTIsIm5hbWUiOiJQcmFuamFsIiwiZW1haWwiOiJhY2NvdW50czFAc3RvcmVteWdvb2RzLmluIiwicm9sZSI6IlBheW1lbnQgRGFzaGJvYXJkIiwibW9kdWxlcyI6InBheW1lbnRfZGFzaGJvYXJkcyIsImlzc3VlZEF0IjoiMjAyNC0wOS0xMFQxMTo1Nzo0MSswNTMwIn0.2DRPENbMRfDIXbprVG7xlri6OM8uQehf3aHLRI0_6Ac',
        'Authorization': 'Bearer kldaklshIIyo1ioy(0290hKLHKL!NbklhlHSKHKlg1gfu',
        ...?headers
      },
    );
    // AppLogger.print(AppUtils.isLoggedIn());
    // if (AppUtils.isLoggedIn()) {
    //   dioOptions.headers['Authorization'] = 'Token ${Storage.token}';
    // }

    _dio = Dio(dioOptions);

    _dio?.interceptors.clear();

    _dio?.interceptors.addAll([
      LogInterceptor(
          error: true,
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          logPrint: printLog)
    ]);
  }

  static printLog(Object object) {
    log(object.toString());
  }

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio?.get(path, queryParameters: query);
      return response?.data;
    } on DioException catch (dioError) {
      ExceptionHandler.handleDioError(dioError);
    } on Exception catch (error) {
      ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio?.post(
        path,
        queryParameters: query,
        data: data,
      );
      return response?.data;
    } on DioException catch (dioError) {
      return ExceptionHandler.handleDioError(dioError);
    } on Exception catch (error) {
      AppLogger.print(error);
      ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> postList({
    required String path,
    Map<String, dynamic>? query,
    List<Map<String, dynamic>>? data,
  }) async {
    try {
      final response =
          await _dio?.post(path, queryParameters: query, data: data);
      return response?.data;
    } on DioException catch (dioError) {
      ExceptionHandler.handleDioError(dioError);
    } on Exception catch (error) {
      ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
          await _dio?.put(path, queryParameters: query, data: data);
      return response?.data;
    } on DioException catch (dioError) {
      ExceptionHandler.handleDioError(dioError);
    } on Exception catch (error) {
      ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> postFormData({
    required String path,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    try {
      final response =
          await _dio?.post(path, queryParameters: query, data: data);
      return response?.data;
    } on DioException catch (dioError) {
      ExceptionHandler.handleDioError(dioError);
    } on Exception catch (error) {
      ExceptionHandler.handleError(error);
    }
  }
}
