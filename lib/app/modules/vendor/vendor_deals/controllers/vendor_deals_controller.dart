import 'package:get/get.dart';

class VendorDealsController extends GetxController {
  VendorDealsController();

  var selectedTab = 0.obs;

  void setTab(int index) {
    selectedTab.value = index;
  }

  // void toggleDealStatus(String id, bool value) {
  //   // 1. Find the index of the deal in the mockDeals list (or your observable list)
  //   int index = mockDeals.indexWhere((deal) => deal.id == id);

  //   if (index != -1) {
  //     // 2. Update the value
  //     mockDeals[index].isActive = value;

  //     // 3. IMPORTANT: If mockDeals is an RxList in a controller, call refresh
  //     // if this list is in VendorDashboardController, use:
  //     // Get.find<VendorDashboardController>().deals.refresh();

  //     print("Deal $id status changed to: $value");
  //   }
  // }
}
