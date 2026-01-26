import 'package:get/get.dart';

import '../../routes/app_routes.dart';


class BottomNavController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;

    // Navigate based on index
    switch (index) {
      case 0:
        Get.offAllNamed(AppRoutes.DISCOVER);
        break;
      case 1:
        Get.offAllNamed(AppRoutes.CATEGORIES);
        break;
      case 2:
        Get.offAllNamed(AppRoutes.SAVED);
        break;
      case 3:
        Get.offAllNamed(AppRoutes.MENU);
        break;
    }
  }
}
