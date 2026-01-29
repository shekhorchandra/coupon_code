import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceDetailsController extends GetxController {
  final PageController pageController = PageController();

  RxInt currentImage = 0.obs;

  final List<String> images = [
    'assets/images/makeup.jpg',
    'assets/images/makeup.jpg',
    'assets/images/makeup.jpg',
  ];

  void onPageChanged(int index) {
    currentImage.value = index;
  }

  void next() {
    if (currentImage.value < images.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previous() {
    if (currentImage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
