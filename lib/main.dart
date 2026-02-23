import 'package:coupon_code/app/core/theme/checkbox_theme.dart';
import 'package:coupon_code/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/values/app_strings.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
