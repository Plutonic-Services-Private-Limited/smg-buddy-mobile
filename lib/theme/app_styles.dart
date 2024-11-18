import 'package:flutter/material.dart';

import 'app_colors.dart';

class Styles {
  // Light: 300
  // Regular / Normal: 400
  // Medium: 500
  // Semi Bold: 600
  // Bold: 700
  static const robotoFont="Roboto";
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
}
