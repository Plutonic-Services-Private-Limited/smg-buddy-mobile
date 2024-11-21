import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smg_buddy_app/data/models/verify_user_model.dart';
import 'package:smg_buddy_app/data/repositories/auth_repository.dart';

class LoginController extends GetxController {
  var phNumber = "".obs;
  var userId = "".obs;
  var countryCode = "+91".obs;
  var isEnabled = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthRepository authRepo = AuthRepository();

  verifyUser() async {
    EasyLoading.show();
    VerifyUserModel user = await authRepo.verifyUser(phNumber.value);
    if (user.userType == "buddy"){
      isEnabled(true);
      userId(user.buddyId.toString());
    }
    else if(user.userType == "warehouse_manager") {
      isEnabled(true);
      userId(user.warehouseManagerId.toString());
    }
    EasyLoading.dismiss();
  }

  getOtp() async {
    EasyLoading.show();
    bool status = await authRepo.sendOtp(phNumber.value, userId.value);
    EasyLoading.dismiss();
    return status;
  }
}
