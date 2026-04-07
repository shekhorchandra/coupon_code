import 'package:coupon_code/app/core/values/app_assets.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_sizes.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/core/widgets/section_heading.dart';
import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../controllers/deal_plan_controller.dart';

class DealPlanView extends GetView<DealPlanController> {
  DealPlanView({super.key});

  final args = Get.arguments as Map<String, dynamic>?;

  DealModel? get deal => args?['dealItem'];
  String? get dealId => deal!.id;
  bool get isNetworkImage => args?['isNetworkImage'] ?? false;
  bool get showSkip => args?['showSkip'] ?? false;

  // Clean the "(App Name)" part from Store titles
  String _cleanTitle(String title) {
    return title.split('(')[0].trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: deal != null ? deal!.title : 'Choose Plan',
        // actions: [
        //   IconButton(onPressed: () => controller.restorePurchases(), icon: Icon(Icons.restore)),
        // ],
      ),
      body: SafeArea(
        child: Obx(() {
          // 1. Loading State
          if (controller.isStoreLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Error/Empty State (Diagnosis)
          if (controller.iapService.products.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.storefront_outlined, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text(
                      controller.errorMessage.value,
                      textAlign: TextAlign.center,
                      style: AppText.body1.medium,
                    ),
                    const SizedBox(height: 20),
                    AppButton(text: "Retry Loading Store", onPressed: () => controller.loadStore()),
                  ],
                ),
              ),
            );
          }

          // 3. Main Product List
          return SingleChildScrollView(
            padding: EdgeInsets.all(AppSizes.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // if (deal != null) ...[
                //   Text(
                //     deal!.title,
                //     style: AppText.body1().copyWith(
                //       color: AppColor.vividSky.s700,
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //     ),
                //     textAlign: .center,
                //   ),

                //   const SizedBox(height: 20),
                // ],
                const SectionHeading(title: 'Choose Publishing Plan:'),
                const SizedBox(height: 15),

                ...controller.iapService.products.map((product) => _buildPlanCard(product)),
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildPlanCard(ProductDetails product) {
    String? getPlanIcon(String productId) {
      switch (productId) {
        case 'deal_publish_7d':
          return AppAssets.sevenDaysDeal;
        case 'deal_publish_14d':
          return AppAssets.fourteenDaysDeal;
        case 'deal_publish_30d':
          return AppAssets.thirtyDaysDeal;
        default:
          return null;
      }
    }

    return Obx(() {
      final color = controller.getPlanColor(product.id);
      final String? icon = getPlanIcon(product.id);
      final isSelected = controller.selectedProduct.value?.id == product.id;

      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => controller.selectedProduct.value = product,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.05),
              border: Border.all(
                color: isSelected ? color : color.withOpacity(0.3),
                width: isSelected ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                if (icon != null) ...[Image.asset(icon), const SizedBox(width: 10)],

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_cleanTitle(product.title), style: AppText.body1.bold),
                      const SizedBox(height: 4),
                      if (product.description.isNotEmpty)
                        Text(
                          product.description,
                          style: AppText.body2.medium.copyWith(color: Colors.black54),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    Text(product.price, style: AppText.h5.bold.copyWith(color: color)),
                    const SizedBox(width: 8),
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? color : Colors.transparent,
                        border: Border.all(color: color, width: 2),
                      ),
                      child: isSelected
                          ? const Icon(Icons.check, size: 14, color: Colors.white)
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
      child: Obx(() {
        final selected = controller.selectedProduct.value;
        final isProcessing = controller.isPurchasing.value;

        return Column(
          mainAxisSize: .min,
          children: [
            AppButton(
              text: isProcessing
                  ? 'Processing...'
                  : (selected == null ? 'Select a Plan' : 'Pay ${selected.price}'),
              // Disable button interaction if processing
              onPressed: () => isProcessing ? null : controller.handlePublish(dealId ?? ""),
            ),

            const SizedBox(height: 10),

            if (!isProcessing && showSkip)
              AppButton(
                text: 'Skip',
                backgroundColor: Colors.white,
                borderColor: AppColor.primary,
                textColor: AppColor.primary,
                onPressed: () => Get.offAllNamed(AppRoutes.VENDOR_NAVIGATION_BAR),
              ),
          ],
        );
      }),
    );
  }
}
