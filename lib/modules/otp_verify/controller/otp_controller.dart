import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smg_buddy_app/data/repositories/auth_repository.dart';

class OtpController extends GetxController {
  AuthRepository authRepo = AuthRepository();
  var otp = "";
  var isEnabled = false.obs;
  Timer? _timer;
  int remaningSeconds = 0;
  final time = "00:30".obs;
  var phNumber = "".obs;
  var countryCode = "".obs;
  var id = "";
  @override
  void onReady() {
    phNumber.value = Get.arguments["phNumber"];
    countryCode.value = Get.arguments["countryCode"];
    id = Get.arguments["id"];
    _startTimer(30);
    super.onReady();
  }

  verifyOtp() async {
    EasyLoading.show();
    var status = await authRepo.verifyOtp(id, otp);
    EasyLoading.dismiss();
    return status;
  }
  resendOtp() async{
    EasyLoading.show();
    var status=await authRepo.resendOtp(phNumber.value, id);
    _startTimer(30);
    EasyLoading.dismiss();
    return status;
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remaningSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remaningSeconds == 0) {
        timer.cancel();
      } else {
        int min = remaningSeconds ~/ 60;
        int sec = remaningSeconds % 60;
        time.value = min.toString().padLeft(2, "0") +
            ":" +
            sec.toString().padLeft(2, "0");
        remaningSeconds--;
      }
    });
  }
}
