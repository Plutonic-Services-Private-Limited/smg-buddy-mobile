import 'package:smg_buddy_app/constants/api_paths.dart';
import 'package:smg_buddy_app/data/models/verify_user_model.dart';
import 'package:smg_buddy_app/utils/network_requester.dart';

class AuthRepository {
  Future<VerifyUserModel> verifyUser(String? phone) async {
    var body = {"phone": phone};
    var response = await NetworkRequester.shared
        .post(path: ApiPaths.verifyUser, data: body);
    return response != null
        ? VerifyUserModel.fromJson(response)
        : VerifyUserModel.fromJson({});
  }
  Future<bool> sendOtp(String? phone, String? userId) async {
    var body = {"phone": phone, "id": userId};
    var response = await NetworkRequester.shared
        .post(path: ApiPaths.sendOtp, data: body);
    return response?["status"] == "Success";
  }
  Future<bool> resendOtp(String? phone, String? userId) async {
    var body = {"phone": phone, "id": userId};
    var response = await NetworkRequester.shared
        .post(path: ApiPaths.resendOtp, data: body);
    return response?["status"];
  }
  Future<bool> verifyOtp(String? id, String? otp) async {
    var body = {"otp": otp, "id": id};
    var response = await NetworkRequester.shared
        .post(path: ApiPaths.verifyOtp, data: body);
    return response?["status"] ;
  }
}
