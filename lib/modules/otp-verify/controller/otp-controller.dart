import 'dart:async';

import 'package:get/get.dart';

class OtpController extends GetxController{
  var otp="";
  var isEnabled=false.obs;
  Timer? _timer;
  int remaningSeconds=0;
  final time = "00:30".obs;
  @override
  void onReady(){
    _startTimer(30);
    super.onReady();
  }
  @override
  void onClose(){
    if(_timer!=null){
      _timer!.cancel();
    }
    super.onClose();
  }
  _startTimer(int seconds){
    const duration=Duration(seconds: 1);
    remaningSeconds=seconds;
    _timer=Timer.periodic(duration, (Timer timer){
      if( remaningSeconds==0){
        timer.cancel();
      }else{
        int min =remaningSeconds~/60;
        int sec=remaningSeconds%60;
        time.value=min.toString().padLeft(2,"0")+
            ":"+sec.toString().padLeft(2,"0");
        remaningSeconds--;
      }
    });
  }
}