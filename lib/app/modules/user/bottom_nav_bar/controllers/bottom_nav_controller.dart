import 'package:coupon_code/app/modules/user/menu/menu_bar/menu_controller/menu_controller.dart';
import 'package:flutter/material.dart' hide MenuController;
import 'package:get/get.dart';


import '../../categories/Category/controllers/categories_controller.dart';
import '../../categories/Category/views/Categories_View.dart';
import '../../discover_bar/Discover/controllers/discover_controller.dart';
import '../../discover_bar/Discover/views/discover_view.dart';
import '../../menu/menu_bar/menu_view/menu_view.dart';
import '../../saved/controllers/save_controller.dart';
import '../../saved/views/save_view.dart';

class UserNavigationBarController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  /// Overlay page (e.g., AboutView)
  Rx<Widget?> currentOverlayPage = Rx<Widget?>(null);

  void openOverlayPage(Widget page) {
    currentOverlayPage.value = page;
  }

  void closeOverlayPage() {
    currentOverlayPage.value = null;
  }

  /// Screens for bottom nav
  final screens = [
    DiscoverView(),
    CategoriesView(),
    UserMySavesPage(),
    MenuView(),
  ];

  /// Switch tabs
  void changeTab(int index) {
    selectedIndex.value = index;
    closeOverlayPage(); // automatically close overlay when changing tabs
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers for your screens
    Get.lazyPut<DiscoverController>(() => DiscoverController());
    Get.lazyPut<CategoriesController>(() => CategoriesController());
    Get.lazyPut<SavesController>(() => SavesController());
    Get.lazyPut<MenuController>(() => MenuController()); // <-- Add this
  }
}
