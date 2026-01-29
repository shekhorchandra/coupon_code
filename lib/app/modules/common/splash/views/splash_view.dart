import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/app_assets.dart';
import '../../../../core/values/app_color.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppAssets.economic, width: 150, height: 150),
            const SizedBox(height: 16),
            const Text(
              "Discounts That Make You Smile",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.textcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
