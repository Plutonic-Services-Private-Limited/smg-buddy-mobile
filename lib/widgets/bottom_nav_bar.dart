import 'package:flutter/material.dart';
import 'package:smg_buddy_app/constants/constants.dart';
import 'package:smg_buddy_app/theme/app_colors.dart';
import 'package:smg_buddy_app/theme/app_styles.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, this.selectRoute});

  final String? selectRoute;

  @override
  Widget build(BuildContext context) {
    var selectedIndex = Footer.options.indexOf(selectRoute ?? Get.currentRoute);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: AppColors.secondaryText30,
      unselectedLabelStyle: Styles.bodySmall14,
      selectedItemColor: AppColors.primaryColor,
      backgroundColor: AppColors.white,
      currentIndex: selectedIndex,
      onTap: (index) {
        Get.offNamed(Footer.options[index]);
      },
      items: Footer.menu,
    );
  }
}