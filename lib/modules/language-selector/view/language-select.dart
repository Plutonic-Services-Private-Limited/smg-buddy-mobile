import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:smg_buddy_app/modules/language-selector/controller/language-controller.dart';
import "package:get/get.dart";
import 'package:smg_buddy_app/routes/app_pages.dart';
import 'package:smg_buddy_app/theme/app_colors.dart';
import 'package:smg_buddy_app/theme/app_styles.dart';
import 'package:smg_buddy_app/utils/storage.dart';

class LanguageSelect extends StatelessWidget {
  const LanguageSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        init: LanguageController(),
        builder: (controller) {
          return SafeArea(
              child: Scaffold(
                appBar: AppBar(

                  leading: IconButton(onPressed: () { Get.offNamed(Routes.otpverify); }, icon: Icon(Icons.chevron_left),),
                  backgroundColor: AppColors.white,
                ),
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40,),
                        Text("laSelect".tr,style: Styles.headerLarge28),

                        SizedBox(height: 40,),
                        RadioListTile<int>(
                          activeColor: AppColors.primaryColor,
                          value: 0,
                          title: Text(
                            "${controller.languageOptions[0]["name"]!} (${controller.languageOptions[0]["code"]!})",
                          ),
                          groupValue: controller.selectedLanguage,
                          onChanged: (value) {
                            controller.selectedLanguage = value!;
                            controller.update();
                          },
                        ),
                        RadioListTile<int>(
                          activeColor: AppColors.primaryColor,
                          value: 1,
                          title: Text(
                            "${controller.languageOptions[1]["name"]!} (${controller.languageOptions[1]["code"]!})",
                          ),
                          groupValue: controller.selectedLanguage,
                          onChanged: (value) {
                            controller.selectedLanguage = value!;
                            controller.update();
                          },
                        )
                      ],
                    ),
                  ),
                  FilledButton(
                      onPressed: () {
                        Storage.language = controller.languageOptions[controller.selectedLanguage]["code"];
                        Get.updateLocale(
                            Locale(controller.languageOptions[controller.selectedLanguage]["code"]!, ""));
                        controller.update();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                        child: Text(
                          "continue".tr,
                          textAlign: TextAlign.center,
                          style: Styles.buttonText,
                        ),
                        width: double.infinity,
                      ))
                ])),
          ));
        });
  }
}
