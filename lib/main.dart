import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/core/values/app_strings.dart';
import 'app/routes/app_routes.dart';

void main() {
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
        fontFamily: 'Roboto',
      ),
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.pages,
    );
  }
}
