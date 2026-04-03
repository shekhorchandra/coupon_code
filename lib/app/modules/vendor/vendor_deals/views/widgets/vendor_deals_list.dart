import 'package:coupon_code/app/core/widgets/deal_tile.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/controllers/my_deals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorDealsList extends GetView<MyDealsController> {
  VendorDealsList({super.key});

  final MyDealsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator.adaptive());
      }

      if (controller.deals.isEmpty) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("No deals found for this category"),
          ),
        );
      }

      return ListView.builder(
        controller: controller.scrollController,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.deals.length,
        itemBuilder: (context, index) {
          final deal = controller.deals[index];
          return Column(
            children: [
              DealTile(key: ValueKey(deal.id), deal: deal, dealType: controller.selectedTab.value),
              const SizedBox(height: 10),
            ],
          );
        },
      );
    });
  }
}
