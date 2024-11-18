import 'package:smg_buddy_app/constants/assets.dart';
import 'package:smg_buddy_app/modules/splash/controllers/splash_controller.dart';
import 'package:smg_buddy_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: Center(

              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Image.asset(Assets.appLogo),
              ),
            ),
          );
        });
  }
}
