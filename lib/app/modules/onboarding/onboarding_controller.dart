import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final currentPage = 0.obs;

  final pages = [
    {
      "title": "Discover amazing deals right in your neighborhood",
      "subtitle":
      "Uncover exclusive discounts for health, beauty, fitness and more from your favorite local vendors.",
      "image": "assets/images/onboarding1.png",
    },
    {
      "title": "Redeem with a Scan",
      "subtitle":
      "No printing necessary. Just show your digital coupon to the vendor at checkout.",
      "image": "assets/images/onboarding2.png",
    },
    {
      "title": "Ready to Save?",
      "subtitle": "No registration required to browse. Start exploring local offers today!",
      "image": "assets/images/onboarding3.png",
    },
  ];

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Get.offNamed(AppRoutes.DISCOVER);
    }
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }
}
