import 'package:coupon_code/app/core/values/app_assets.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_sizes.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/core/widgets/app_circular_avatar.dart';
import 'package:coupon_code/app/core/widgets/section_heading.dart';
import 'package:coupon_code/app/data/services/storage_service.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/controllers/vendor_dashboard_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/views/widgets/overview_card.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/views/widgets/overview_chart.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/views/widgets/top_viewed_deals_grid.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/views/widgets/total_impression_card.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/controllers/vendor_deals_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_menu/controllers/vendor_menu_controller.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class VendorDashboardPage extends GetView<VendorDashboardController> {
  VendorDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorDashboardController());
    final menuController = Get.put(VendorMenuController());
    Get.lazyPut<VendorDealsController>(() => VendorDealsController());
    final vendorDealsController = Get.find<VendorDealsController>();

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: () => controller.loadDeals(),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppSizes.screenPadding),
            child: Column(
              children: [
                // Header
                Row(
                  children: [
                    // Avatar with circular border
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Obx(
                        () => AppCircularAvatar(imageUrl: menuController.businessLogo.value),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Title + button
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(
                              menuController.businessName.value,
                              style: AppText.h5.semiBold.copyWith(color: AppColor.bw.s800),
                            ),
                          ),
                          const SizedBox(height: 8),
                          AppButton(
                            onPressed: () {
                              if (!menuController.isShopApproved.value) {
                                Get.snackbar(
                                  'Access Denied',
                                  'Your shop isn\'t approved yet!',
                                  barBlur: 100,
                                );
                              } else {
                                vendorDealsController.resetForm();

                                Get.toNamed(AppRoutes.ADD_DEAL);
                              }
                            },
                            text: 'Add New Deal',
                            icon: Icons.add,
                            height: AppSizes.denseButtonHeight,
                            width: AppSizes.denseButtonWidth,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Notification bell
                    IconButton(
                      onPressed: () {
                        StorageService _storageService = StorageService();
                        final userId = _storageService.userId;

                        if (userId != null)
                          Get.toNamed(AppRoutes.NOTIFICATIONS, parameters: {"userId": userId});
                      },
                      icon: Icon(Iconsax.notification_copy),
                    ),
                  ],
                ),

                const SizedBox(height: AppSizes.screenPadding),

                Obx(
                  () => menuController.isShopApproved.value
                      ? SizedBox.shrink()
                      : Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColor.error,
                                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                              child: SafeArea(
                                bottom: false,
                                child: Text(
                                  "Your shop isn't approved yet!",
                                  style: AppText.body1.medium.copyWith(color: Colors.white),
                                ),
                              ),
                            ),

                            const SizedBox(height: AppSizes.screenPadding),
                          ],
                        ),
                ),

                const SizedBox(height: AppSizes.screenPadding),

                // Overview Cards
                Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => OverviewCard(
                          icon: AppAssets.activeDeals,
                          title: 'Active Deals',
                          number: controller.shopAnalytics.value.activeDeals.toString(),
                          isLoading: controller.isLoading.value,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Obx(
                        () => OverviewCard(
                          icon: AppAssets.totalViews,
                          title: 'Total Views',
                          number: controller.shopAnalytics.value.totalViews.toString(),
                          isLoading: controller.isLoading.value,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Total Impression
                Obx(
                  () => TotalImpressionCard(
                    totalImpressions: controller.shopAnalytics.value.totalImpressions.toString(),
                    ctr: controller.ctr.value.toStringAsFixed(2),
                    isLoading: controller.isLoading.value,
                  ),
                ),
                const SizedBox(height: 30),

                // Overview Chart
                SectionHeading(title: "Personal Overview", subtitle: "1 year"),
                const SizedBox(height: 10),

                OverviewChart(),
                const SizedBox(height: 30),

                // Top Viewed Deals
                TopViewedDealsGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
