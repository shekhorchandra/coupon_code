import 'package:coupon_code/app/modules/vendor/vendor_dashboard/controllers/vendor_dashboard_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/controllers/vendor_overview_chart_controller.dart';
import 'package:get/get.dart';

class VendorDashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VendorOverviewChartController>(() => VendorOverviewChartController());
    Get.lazyPut<VendorDashboardController>(() => VendorDashboardController());
  }
}
