import 'package:smg_buddy_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
      fontFamily: 'Cabin',
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.primaryColor,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }));
}
