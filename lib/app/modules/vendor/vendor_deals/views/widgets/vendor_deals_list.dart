import 'package:coupon_code/app/core/widgets/deal_tile.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/controllers/vendor_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorDealsList extends GetView<VendorDashboardController> {
  const VendorDealsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorDashboardController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.deals.isEmpty) {
        return const Center(child: Text("No deals found"));
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.deals.length,
        itemBuilder: (context, index) {
          final deal = controller.deals[index];
          return DealTile(deal: deal);
        },
      );
    });
  }
}
