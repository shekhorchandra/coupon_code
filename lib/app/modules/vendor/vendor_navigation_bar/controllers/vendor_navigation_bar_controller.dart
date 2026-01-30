import 'package:coupon_code/app/modules/vendor/vendor_dashboard/views/vendor_dashboard_view.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/views/vendor_deals_view.dart';
import 'package:coupon_code/app/modules/vendor/vendor_menu/views/vendor_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorNavigationBarController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [VendorDashboardPage(), VendorDealsPage(), VendorMenuPage()];

  final pageController = PageController();

  void changeTab(int index) {
    selectedIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
