import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  ///24 20 18 16 14 12 10 text size
  ///Title text
  static final TextStyle HeaderTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textcolor,
  );

  // sub title Text
  static final TextStyle HeaderSubTitle = TextStyle(
    fontSize: 14,
    color: AppColors.greyText,
  );

  // sub title Text
  static final TextStyle Text = TextStyle(
    fontSize: 14,
    color: AppColors.textcolor,
  );

  // Text button Text
  static final TextStyle TextButton = TextStyle(
    fontSize: 14,
    color: AppColors.primary,
  );

  // Button Text
  static final TextStyle ButtonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.buttonText,
  );



}
