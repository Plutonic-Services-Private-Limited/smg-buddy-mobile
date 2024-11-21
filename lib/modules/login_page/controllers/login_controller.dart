import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  var phNumber="".obs;
  var countryCode="+91".obs;
  var isEnabled=false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void login(){
  }
}
