import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smg_buddy_app/modules/login_page/controllers/login_controller.dart';
import 'package:smg_buddy_app/routes/app_pages.dart';
import 'package:smg_buddy_app/theme/app_colors.dart';
import 'package:smg_buddy_app/theme/app_styles.dart';
import 'package:smg_buddy_app/widgets/data-field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginView extends StatelessWidget {

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return SafeArea(
              child: Scaffold(
                  body: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Column(children: [
                        Expanded(
                          child: Form(
                              key: controller.formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Login",
                                      textAlign: TextAlign.left,
                                      style: Styles.headerLarge28),
                                  Text("Welcome to store my goods!",style: Styles.bodyMedium16,),
                                  SizedBox(height: 40,),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 70,
                                        child: DropdownButtonFormField(
                                          value: "+91",
                                          items: const [
                                            DropdownMenuItem(
                                              value: "+91",
                                              child: Text('+91'),
                                            ),
                                          ],
                                          decoration: InputDecoration(
                                              focusedBorder:
                                              UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: AppColors
                                                          .dataColour,
                                                      width: 2))),
                                          onChanged: (value) {
                                            controller.countryCode.value = value!;

                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: DataField(
                                          hintText: "Mobile Number",
                                          textInputType: TextInputType.number,
                                          validator: (v) {
                                            if (v == null || v == "") {
                                              return 'Please enter a valid Mobile numbers';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            controller.phNumber.value = value;
                                            if(controller.phNumber.value.length==10){
                                              controller.verifyUser();
                                            }else{
                                              controller.isEnabled(false);
                                            }
                                          },
                                        ),
                                      ),

                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Obx(()=>FilledButton(


                                      onPressed: controller.isEnabled.value?() async {
                                        var status = await controller.getOtp();
                                        if(status) {
                                          Get.offNamed(Routes.otpverify,arguments: {"phNumber":controller.phNumber.value,"countryCode":controller.countryCode.value,"id":controller.userId.value});
                                        } else {
                                          EasyLoading.showError("OTP not sent");
                                        }
                                      }:null,
                                      style: ButtonStyle(
                                        backgroundColor: controller.isEnabled.value?MaterialStateProperty.all(AppColors.primaryColor):MaterialStateProperty.all(AppColors.secondaryText30)
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 15),
                                        width: double.infinity,
                                        child: Text("Get OTP",textAlign: TextAlign.center,style: Styles.buttonText,),
                                      )
                                  ))
                                ],
                              )
                          ),
                        ),
                        RichText(

                            text: TextSpan(
                                style: TextStyle(
                                    color: AppColors.black,
                                  fontFamily: "Cabin"
                                ),
                                children: [
                                  const TextSpan(
                                      text: "By continuing you agree to our "),
                                  TextSpan(
                                    text: "Terms & conditions",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        var _url = Uri.parse('https://storemygoods.in/terms-condition.html');
                                        if (!await launchUrl(_url)) {
                                          throw Exception('Could not launch $_url');
                                        }
                                      },
                                  ),
                                  const TextSpan(text: " and "),
                                  TextSpan(text: "Privacy Policy",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = ()  async {
                                        var _url = Uri.parse('https://storemygoods.in/privacy-policy.html');
                                        if (!await launchUrl(_url)) {
                                          throw Exception('Could not launch $_url');
                                        }
                                      },
                                  )
                                ]),
                            textAlign: TextAlign.center)
                      ]))));
        });
  }
}