import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2), _checkFirstLaunch);
  }

  Future<void> _checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    final first = prefs.getBool('is_first_launch') ?? true;

    if (first) {
      await prefs.setBool('is_first_launch', false);
      Get.offAllNamed(AppRoutes.ONBOARDING);
    } else {
      Get.offAllNamed(AppRoutes.DISCOVER);
    }
  }
}
