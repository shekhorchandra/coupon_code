import 'package:coupon_code/app/core/widgets/deal_tile.dart';
import 'package:coupon_code/app/data/models/deal_model_dto.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/controllers/vendor_dashboard_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/controllers/vendor_deals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorDealsList extends GetView<VendorDashboardController> {
  const VendorDealsList({super.key});

  @override
  Widget build(BuildContext context) {
    final dealController = Get.find<VendorDealsController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      List<DealModelDTO> filteredDeals = [];

      // if (dealController.selectedTab.value == 0) {
      //   filteredDeals = controller.deals.where((deal) {
      //     // Ensure that deal.activePromotion is checked and promotedUntil is valid
      //     DateTime validPromotedUntil =
      //         deal.promotedUntil ?? DateTime.now().subtract(Duration(days: 1));
      //     return (deal.activePromotion ?? false) && validPromotedUntil.isAfter(DateTime.now());
      //   }).toList();
      // } else {
      //   filteredDeals = controller.deals.where((deal) {
      //     // Check if promotedUntil is not null and is before now
      //     return deal.promotedUntil != null && deal.promotedUntil!.isBefore(DateTime.now());
      //   }).toList();
      // }
      filteredDeals = controller.deals; // TODO: fix this

      if (filteredDeals.isEmpty) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("No deals found for this category"),
          ),
        );
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: filteredDeals.length,
        itemBuilder: (context, index) {
          final deal = filteredDeals[index];
          return Column(
            children: [
              DealTile(
                key: ValueKey(deal.id),
                deal: deal,
                dealType: dealController.selectedTab.value,
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      );
    });
  }
}
