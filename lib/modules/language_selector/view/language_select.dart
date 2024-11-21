import 'package:flutter/material.dart';
import 'package:smg_buddy_app/modules/language_selector/controller/language_controller.dart';
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
              leading: IconButton(
                onPressed: () {
                  Get.offNamed(Routes.dashboard);
                },
                icon: Icon(Icons.chevron_left),
              ),
              backgroundColor: AppColors.white,
            ),
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text("laSelect".tr, style: Styles.headerLarge28),

                      SizedBox(
                        height: 40,
                      ),
                      Expanded(
                        child: ListView.builder(

                            itemCount: controller.languageOptions.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                                decoration:
                                    BoxDecoration(
                                        border: Border.all(width: 1, color: index==controller.selectedLanguage?AppColors.primaryColor:Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                        color: index==controller.selectedLanguage?AppColors.primaryText10:AppColors.secondaryText10
                                    ),
                                child: RadioListTile<int>(
                                  activeColor: AppColors.primaryColor,
                                  value: index,
                                  title: Text(
                                    "${controller.languageOptions[index]["name"]!} (${controller.languageOptions[index]["code"]!})",
                                  ),
                                  groupValue: controller.selectedLanguage,
                                  onChanged: (value) {
                                    controller.selectedLanguage = value!;
                                    controller.update();
                                  },
                                ),
                              );
                            }),
                      ),
                      
                      FilledButton(
                          onPressed: () {
                            Storage.language = controller.languageOptions[
                                controller.selectedLanguage]["code"];
                            Get.updateLocale(Locale(
                                controller.languageOptions[
                                    controller.selectedLanguage]["code"]!,
                                ""));
                            controller.update();
                            Get.offNamed(Routes.dashboard);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 15),
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
