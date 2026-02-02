import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/data/mock_data/mock_deals.dart';
import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:coupon_code/app/modules/user/discover_bar/coupon_code/qr_code.dart';
import 'package:coupon_code/app/modules/user/discover_bar/discover_details/views/widgets/deal_creation_preview_app_bar.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/values/app_assets.dart';
import '../../../../../core/values/app_color.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widgets/App_button.dart';
import '../controllers/discover_details_controller.dart';

class ServiceDetailsPage extends StatelessWidget {
  ServiceDetailsPage({super.key, this.id, this.dealItem, this.isNetworkImage = true});

  final int? id;
  final DealModel? dealItem;
  final bool? isNetworkImage;

  final controller = Get.put(ServiceDetailsController());

  @override
  Widget build(BuildContext context) {
    DealModel? deal;

    if (id != null) {
      final List<DealModel> deals = (jsonDecode(mockDeals) as List)
          .map((e) => DealModel.fromMap(e as Map<String, dynamic>))
          .toList();

      try {
        deal = deals.firstWhere((d) => d.id == id);
      } catch (_) {
        deal = null;
      }
    } else {
      deal = dealItem;
    }

    if (deal == null) {
      return const Scaffold(body: Center(child: Text('Deal not found')));
    }

    return Scaffold(
      appBar: dealItem == null
          ? CommonAppBar(title: "Deal Details", showBack: true)
          : DealCreationPreviewAppBar(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= IMAGE SLIDER =================
              SizedBox(
                height: 220,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// IMAGE SLIDER
                    PageView.builder(
                      controller: controller.pageController,
                      itemCount: deal.media.length,
                      onPageChanged: controller.onPageChanged,
                      itemBuilder: (_, index) {
                        final imageUrl = deal!.media[index].imageUrl;

                        return isNetworkImage ?? true
                            ? CachedNetworkImage(
                                imageUrl: imageUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                placeholder: (_, _) =>
                                    const Center(child: CircularProgressIndicator()),
                                errorWidget: (_, _, _) => const Icon(Icons.broken_image),
                              )
                            : Image.file(File(imageUrl), fit: BoxFit.cover, width: double.infinity);
                      },
                    ),

                    /// LEFT ARROW
                    Positioned(
                      left: 12,
                      child: Obx(
                        () => IconButton(
                          onPressed: controller.currentImage.value == 0
                              ? null
                              : controller.previous,
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                        ),
                      ),
                    ),

                    /// RIGHT ARROW
                    Positioned(
                      right: 12,
                      child: Obx(
                        () => IconButton(
                          onPressed: controller.currentImage.value == deal!.media.length - 1
                              ? null
                              : controller.next,
                          icon: const Icon(Icons.arrow_forward_ios),
                          color: Colors.white,
                        ),
                      ),
                    ),

                    /// IMAGE COUNT
                    Positioned(
                      bottom: 12,
                      right: 12,
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha(128),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            '${controller.currentImage.value + 1} / ${deal!.media.length}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ================= TITLE =================
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  deal.title,
                  style: AppTextStyles.MenuTitle.copyWith(color: Colors.black),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.category, // or any salon/shop icon
                      width: 14,
                      height: 14,
                      colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Glamour Glow Salon",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Address text
                    Expanded(
                      child: Text(
                        "1234 Streets, New York  ● 1.2 km away",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.MenuButtonText.copyWith(color: AppColor.titleColor),
                      ),
                    ),

                    //  Favorite
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.grey,
                      onPressed: () {
                        // handle save / favorite
                      },
                    ),

                    // Share
                    IconButton(
                      icon: const Icon(Icons.share_outlined),
                      color: AppColor.titleColor,
                      onPressed: () {
                        // handle share
                      },
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    /// LEFT SIDE (prices + discount)
                    Expanded(
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "\$${deal.afterDiscountPrice.toStringAsFixed(2)}",
                                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "\$${deal.regularPrice.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),

                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "${deal.discountPercentage.toStringAsFixed(0)}% off",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// Countdown
              Align(
                alignment: .centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Text(
                    "10d   08h   54m   23s",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ================= HIGHLIGHTS =================
              _section(
                title: "Highlights",
                child: Text(
                  deal.highlights,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5, // better spacing for readability
                    color: Colors.black,
                  ),
                ),
              ),

              // ================= DESCRIPTION =================
              _section(
                title: "Description",
                child: Text(
                  deal.description,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5, // better spacing for readability
                    color: Colors.black,
                  ),
                ),
              ),

              // ================= HOW TO REDEEM =================
              _section(
                title: "How to Redeem",
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Image.asset(
                    'assets/images/redeem.png', // replace with your infographic image
                    width: double.infinity, // take full width
                    fit: BoxFit.contain, // or BoxFit.cover depending on your design
                  ),
                ),
              ),

              //Location
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Title
                    const Text(
                      "Location",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 8),

                    // Subtitle with icon
                    Row(
                      children: [
                        const Icon(
                          Icons.storefront, // or use a custom SVG
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          "Grown Salon",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Map Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        "https://static-maps.yandex.ru/1.x/?ll=-74.0060,40.7128&size=400,200&z=14&l=map&pt=-74.0060,40.7128,pm2rdm",
                        width: double.infinity,
                        height: 172,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // ================= BOTTOM BUTTONS =================
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            // padding: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsetsGeometry.only(top: 1, right: 16, bottom: 20, left: 16),
            child: Row(
              children: [
                if (dealItem != null)
                  Expanded(
                    child: AppButton(
                      text: 'Payment & Publish',
                      onPressed: () =>
                          Get.toNamed(AppRoutes.PAYMENT_METHOD, arguments: {'isSelectable': true}),
                    ),
                  ),

                if (dealItem == null) ...[
                  Expanded(
                    child: AppButton(
                      text: 'Save For Later',
                      onPressed: () {},
                      backgroundColor: Colors.white70,
                      textColor: AppColor.primary,
                      borderColor: AppColor.primary,
                      leading: SvgPicture.asset(
                        AppAssets.saved,
                        width: 18,
                        height: 18,
                        colorFilter: const ColorFilter.mode(AppColor.primary, BlendMode.srcIn),
                      ),
                    ),
                  ),

                  if (dealItem == null) const SizedBox(width: 16),
                  if (dealItem == null)
                    Expanded(
                      child: AppButton(
                        onPressed: () {
                          showCouponDemoPopup();
                        },
                        text: 'Show Coupon',
                      ),
                    ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= COMMON FOLDABLE SECTION =================
  static Widget _section({required String title, required Widget child}) {
    return ExpansionTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
      children: [child],
    );
  }
}
