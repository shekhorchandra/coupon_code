import 'package:coupon_code/app/modules/vendor/vendor_dashboard/views/vendor_dashboard_view.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/views/vendor_deals_view.dart';
import 'package:coupon_code/app/modules/vendor/vendor_menu/views/vendor_menu_view.dart';
import 'package:get/get.dart';

class VendorNavigationBarController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  final screens = [VendorDashboardPage(), VendorDealsPage(), VendorMenuPage()];
}
