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













// subheading
  static final TextStyle subHeading= TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textcolor,
  );
// subheading title
  static final TextStyle onSubTitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.textcolor,
  );

  //interest color
  static const TextStyle int_color = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static final TextStyle onsubheading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textcolor,
  );

  static final TextStyle onTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textcolor,
  );

// user profile title
  static final TextStyle userprofile = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textcolor,
  );
// user profile subtitle
  static final TextStyle userprofilesubtitle = TextStyle(
    fontSize: 12,
    color: AppColors.textcolor,
  );




  ///-------------------------------------

  static final TextStyle h2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textcolor,
  );

  // Body text
  static final TextStyle body = TextStyle(
    fontSize: 14,
    color: AppColors.textcolor,
  );

  // all caption text
  static final TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.textcolor,
  );


  // Buttons
  static const TextStyle button = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );


}
