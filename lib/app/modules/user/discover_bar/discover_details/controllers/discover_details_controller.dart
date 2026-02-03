import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceDetailsController extends GetxController {
  final PageController pageController = PageController();
  RxInt currentImage = 0.obs;

  void onPageChanged(int index) {
    currentImage.value = index;
  }

  void next() {
    pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void previous() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
