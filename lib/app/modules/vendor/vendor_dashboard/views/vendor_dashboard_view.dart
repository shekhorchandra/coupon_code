import 'package:coupon_code/app/core/values/app_assets.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_sizes.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/controllers/vendor_dashboard_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/views/widgets/overview_card.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/views/widgets/overview_chart.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/views/widgets/top_viewed_deals_grid.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/views/widgets/total_impression_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class VendorDashboardPage extends GetView<VendorDashboardController> {
  const VendorDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColor.vividSky.s300, width: 2),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          AppAssets.salon,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Title + button
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Glamour Glow Salon',
                            style: AppText.h5.semiBold.copyWith(color: AppColor.bw.s800),
                          ),
                          const SizedBox(height: 8),
                          AppButton(
                            onPressed: () {},
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
                    Icon(Iconsax.notification_copy, color: AppColor.bw.s700, size: 24),
                  ],
                ),
                const SizedBox(height: AppSizes.denseButtonHeight),

                // Overview Cards
                Row(
                  children: [
                    Expanded(
                      child: OverviewCard(
                        icon: AppAssets.activeDeals,
                        title: 'Active Deals',
                        number: '5',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OverviewCard(
                        icon: AppAssets.totalViews,
                        title: 'Total Views',
                        number: '2,456',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Total Impression
                TotalImpressionCard(),
                const SizedBox(height: 30),

                // Overview Chart
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
