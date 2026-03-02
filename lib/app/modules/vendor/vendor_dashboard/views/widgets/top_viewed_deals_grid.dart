import 'package:coupon_code/app/core/widgets/deal_grid.dart';
import 'package:coupon_code/app/core/widgets/section_heading.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/controllers/vendor_dashboard_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_navigation_bar/controllers/vendor_navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopViewedDealsGrid extends GetView<VendorDashboardController> {
  const TopViewedDealsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorDashboardController());

    // 1. Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // 2. Calculate the width of a single card
    // (Screen width - horizontal screen padding - grid spacing) / crossAxisCount
    double padding = 16.0 * 2; // AppSizes.screenPadding * 2
    double spacing = 10.0;
    double cardWidth = (screenWidth - padding - spacing) / 2;

    // 3. Define your content's expected height
    // Image (cardWidth / 1.2 aspect ratio) + Text Area (~90px)
    double expectedHeight = (cardWidth / 1.2) + 110;

    // 4. Calculate final ratio
    double dynamicRatio = cardWidth / expectedHeight;

    return Column(
      children: [
        SectionHeading(
          title: 'Top Viewed Deals',
          cta: 'See All',
          ctaOnTap: () {
            final navigationController = Get.find<VendorNavigationBarController>();

            navigationController.selectedIndex.value = 1;
          },
        ),
        Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: Padding(padding: EdgeInsets.all(20.0), child: CircularProgressIndicator()),
            );
          }

          if (controller.deals.isEmpty) {
            return const Center(child: Text("No deals found"));
          }

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: controller.deals.length < 4 ? controller.deals.length : 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: dynamicRatio,
            ),
            itemBuilder: (context, index) {
              return DealGrid(deal: controller.deals[index]);
            },
          );
        }),
      ],
    );
  }
}
