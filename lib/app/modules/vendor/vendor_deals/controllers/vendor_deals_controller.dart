import 'package:get/get.dart';

class VendorDealsController extends GetxController {
  VendorDealsController();

  var selectedTab = 0.obs;

  void setTab(int index) {
    selectedTab.value = index;
  }
}
