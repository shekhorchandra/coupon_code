import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTextStyles {
  AppTextStyles._();

  ///24 20 18 16 14 12 10 text size
  ///Title text
  static final TextStyle HeaderTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColor.textcolor,
  );

  // sub title Text
  static final TextStyle HeaderSubTitle = TextStyle(fontSize: 14, color: AppColor.greyText);

  // sub title Text
  static final TextStyle Text = TextStyle(fontSize: 14, color: AppColor.textcolor);

  // Text button Text
  static final TextStyle TextButton = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColor.titleColor,
  );

  // Button Text
  static final TextStyle ButtonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColor.buttonText,
  );

  static final TextStyle MenuButtonText = TextStyle(fontSize: 16, color: AppColor.textcolor);

  // Discover title Text
  static final TextStyle Title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColor.titleColor,
  );

  // Menu title Text
  static final TextStyle MenuTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColor.titleColor,
  );
}
