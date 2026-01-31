import 'package:coupon_code/app/core/theme/checkbox_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/values/app_strings.dart';
import 'app/modules/user/bottom_nav_bar/controllers/bottom_nav_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() {
  Get.put(BottomNavController(), permanent: true);
  runApp(const CouponDiscountApp());
}

class CouponDiscountApp extends StatelessWidget {
  const CouponDiscountApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        checkboxTheme: checkboxTheme,
        fontFamily: 'FontMain',
      ),
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.pages,
    );
  }
}
