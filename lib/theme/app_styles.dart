import 'package:flutter/material.dart';

import 'app_colors.dart';

class Styles {
  // Light: 300
  // Regular / Normal: 400
  // Medium: 500
  // Semi Bold: 600
  // Bold: 700
  static const robotoFont = "Roboto";
  static TextStyle tsPrimaryText70Light16 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 16,
    color: AppColors.primaryText70,
    height: 1.2,
  );
  static const tsDataTextRegular14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.dataColour,
    height: 1.2,
  );
  static const headerLarge28 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 28,
    color: AppColors.black,
  );
  static const headerMedium25 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 25,
    color: AppColors.black,
  );

  static const headerSmall21 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 21,
    color: AppColors.black,
  );
  static const headerXSmall18 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: AppColors.black,
  );
  static const bodyLarge18 = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 18,
      color: AppColors.black,
      fontFamily: robotoFont
  );
  static const bodyMedium16 = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: AppColors.black,
      fontFamily: robotoFont
  );
  static const bodySmall14 = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: AppColors.black,
      fontFamily: robotoFont
  );
  static const captionRegular = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      color: AppColors.black,
      fontFamily: robotoFont
  );
  static const buttonText = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppColors.white,
  );
}