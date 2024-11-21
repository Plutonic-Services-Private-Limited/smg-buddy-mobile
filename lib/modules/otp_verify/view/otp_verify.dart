import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:smg_buddy_app/modules/otp_verify/controller/otp_controller.dart';
import 'package:smg_buddy_app/routes/app_pages.dart';
import 'package:smg_buddy_app/theme/app_colors.dart';
import 'package:smg_buddy_app/theme/app_styles.dart';
import 'package:smg_buddy_app/utils/storage.dart';
class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      init: OtpController(),
        builder: (controller){
        return SafeArea(
            child: Scaffold(
              appBar: AppBar(

                leading: IconButton(onPressed: () { Get.offNamed(Routes.login); }, icon: Icon(Icons.chevron_left),),
                backgroundColor: AppColors.white,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Verify your phone number",textAlign: TextAlign.left,style: Styles.headerMedium25,),
                    SizedBox(height: 20,),
                    Text("Please enter the code we sent to",textAlign: TextAlign.left,style: Styles.bodyMedium16,),
                    Obx(()=>Text("${controller.countryCode.value}${controller.phNumber.value}",textAlign: TextAlign.left,style: Styles.bodyMedium16,),),
                    SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       Obx(()=> Pinput(
                          onChanged: (value) {
                            controller.otp=value;
                            controller.otp.length==4?controller.isEnabled.value=true:controller.isEnabled.value=false;

                          },
                          defaultPinTheme: PinTheme(
                            width: 56,
                            height: 56,
                            textStyle: const TextStyle(
                              fontSize: 22,
                              color: Color.fromRGBO(30, 60, 87, 1),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              border: Border.all(color: controller.isEnabled.value? AppColors.secondaryColor:AppColors.secondaryText20),
                            ),
                          ),
                      ))
                      ],
                    ),
                    SizedBox(height: 40,),
                    Obx(()=>controller.time.value=="00:01"?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Didn't get the code ? ",style: Styles.bodyMedium16,),
                        InkWell(
                          onTap: () async {
                            await controller.resendOtp();
                          },
                          child: Text("Resend it.",style: Styles.bodyMedium16.copyWith(
                            color: AppColors.primaryColor
                          ),),
                        )
                      ],
                    ):Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Resend in ",style: Styles.bodyMedium16,),
                        Text(controller.time.value+"s",style: Styles.bodyMedium16.copyWith(color: AppColors.primaryColor),)
                      ],
                    ),),
                    SizedBox(height: 20,),
                    Obx(()=>FilledButton(
                        onPressed: controller.isEnabled.value?() async {
                          var status= await controller.verifyOtp();
                          if(status){
                            Get.offNamed(Routes.language);
                          }
                        }:null,
                        style: ButtonStyle(
                          backgroundColor: controller.isEnabled.value?MaterialStateProperty.all(AppColors.primaryColor):MaterialStateProperty.all(AppColors.secondaryText30)
                        ),

                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 0,vertical: 15),
                          child: Text("Continue",textAlign: TextAlign.center,style: Styles.buttonText,),
                          width: double.infinity,
                        )
                    ))


                  ],
                ),
              ),
            )
        );
        }
    );
  }
}
