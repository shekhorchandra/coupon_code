import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:coupon_code/app/modules/user/discover_bar/discover_details/views/widgets/deal_creation_preview_app_bar.dart';
import 'package:coupon_code/app/modules/user/discover_bar/discover_details/views/widgets/shop_map.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/values/app_assets.dart';
import '../../../../../core/values/app_color.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widgets/App_button.dart';
import '../../../categories/category_details/model/category_deal_model.dart';
import '../../../saved/controllers/save_controller.dart';
import '../../coupon_code/Controller/coupon_controller.dart';
import '../../coupon_code/views/coupon_popup_view.dart';
import '../controllers/discover_details_controller.dart';

class ServiceDetailsPage extends StatefulWidget {
  ServiceDetailsPage({super.key, this.id, this.dealItem, this.isNetworkImage = true});

  final String? id;
  final CategoryDealModel? dealItem;
  final bool isNetworkImage;

  @override
  State<ServiceDetailsPage> createState() => _ServiceDetailsPageState();

  static Widget _section({required String title, required Widget child}) {
    return ExpansionTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
      children: [child],
    );
  }
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  final controller = Get.put(ServiceDetailsController());
  final SavesController savesController = Get.put(SavesController());

  @override
  void initState() {
    super.initState();

    // Set the status bar to be transparent and with white icons
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Make the status bar transparent
        statusBarIconBrightness: Brightness.light, // Set status bar icons to light color
      ),
    );

    _fetchDealDetails();
  }

  @override
  void dispose() {
    // Reset the status bar style to default when leaving the page
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black, // Default status bar color
        statusBarIconBrightness: Brightness.dark, // Default status bar icon color
      ),
    );

    super.dispose();
  }

  void _fetchDealDetails() async {
    if (widget.id != null) {
      // Use your actual user location here
      double userLat = 23.7631625;
      double userLng = 90.4329219;

      await controller.getDealDetails(widget.id!, lat: userLat, lng: userLng);

      _fetchShopDetails();
    }
  }

  void _fetchShopDetails() async {
    if (controller.deal.value?.shopId != null) {
      await controller.getShopDetails(controller.deal.value!.shopId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final deal = controller.deal.value;

      if (deal == null) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator(color: AppColor.primary)),
        );
      }

      return Scaffold(
        appBar: widget.id == null
            ? DealCreationPreviewAppBar()
            : CommonAppBar(title: 'Deal Details'),

        body: SafeArea(
          child: SingleChildScrollView(
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
                          itemCount: deal.images.length,
                          onPageChanged: controller.onPageChanged,
                          itemBuilder: (_, index) {
                            final imageUrl = deal.images[index];

                            return widget.isNetworkImage ?? true
                                ? Hero(
                                    tag: 'top-deals-grid-${deal.id}',
                                    child: CachedNetworkImage(
                                      imageUrl: imageUrl,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      placeholder: (_, _) => const Center(
                                        child: CircularProgressIndicator(color: AppColor.primary),
                                      ),
                                      errorWidget: (_, _, _) => const Icon(Icons.broken_image),
                                    ),
                                  )
                                : Image.file(
                                    File(imageUrl),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  );
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
                              onPressed: controller.currentImage.value == deal.images.length - 1
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
                                '${controller.currentImage.value + 1} / ${deal.images.length}',
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
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        Get.toNamed(AppRoutes.shopDetails, arguments: {"shopId": deal.shopId});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              AppAssets.category,
                              width: 14,
                              height: 14,
                              colorFilter: const ColorFilter.mode(
                                Colors.blueAccent,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "Shop Name: ${deal.businessName ?? 'No shop name'}",
                              style: TextStyle(fontSize: 12, color: Colors.blueAccent),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Address
                              Text(
                                "Address: ${deal.address ?? 'No address'}",
                                style: AppTextStyles.MenuButtonText.copyWith(
                                  color: AppColor.titleColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 2),

                              // Distance
                              // Text(
                              //   "${((deal.distance))}",
                              // )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        /// LEFT SIDE (prices + discount)
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "\$${DealModel.afterDiscountPrice(deal.reguler_price ?? deal.originalPrice, deal.discountPercent).toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    "\$${deal.reguler_price?.toStringAsFixed(2)}",
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
                                  "${deal.discountPercent.toStringAsFixed(0)}% off",
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        // Countdown on the left
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            deal.promotionCountdown,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                              fontSize: 14,
                            ),
                          ),
                        ),

                        const Spacer(), // pushes the icons to the right
                        // Favorite
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          color: Colors.grey,
                          onPressed: () {
                            final dealId = controller.deal.value?.id;

                            if (dealId == null || dealId.isEmpty) {
                              Get.snackbar('Error', 'Deal not found');
                              return;
                            }

                            savesController.saveForLater(dealId);
                          },
                        ),

                        // Share
                        IconButton(
                          icon: const Icon(Icons.share_outlined),
                          color: AppColor.titleColor,
                          onPressed: () {
                            final dealData = controller.deal.value;

                            if (dealData == null) {
                              Get.snackbar('Error', 'No deal data to share');
                              return;
                            }

                            final shareText =
                                '''
                            ${dealData.title ?? 'Amazing Deal!'}
                            ${dealData.description ?? ''}
                            Price: ${dealData.price ?? ''}
                            Grab this deal now!
                                ''';

                            Share.share(
                              shareText,
                              subject: dealData.title ?? 'Check out this deal!',
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  // ================= HIGHLIGHTS =================
                  ServiceDetailsPage._section(
                    title: "Highlights",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: deal.highlights.map((highlight) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "• ",
                                style: TextStyle(fontSize: 16, color: Colors.orange),
                              ),
                              Expanded(
                                child: Text(
                                  highlight,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  // ================= DESCRIPTION =================
                  ServiceDetailsPage._section(
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
                  ServiceDetailsPage._section(
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

                  // ================= HOW TO REDEEM =================
                  ServiceDetailsPage._section(
                    title: "Website",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Obx(() {
                        final website = controller.deal.value?.website ?? '';
                        final business = controller.deal.value?.businessName ?? 'Website';

                        if (website.isEmpty) {
                          return const Text(
                            "No website available",
                            style: TextStyle(color: Colors.grey),
                          );
                        }

                        return InkWell(
                          onTap: () async {
                            try {
                              await launchUrl(
                                Uri.parse(
                                  website.startsWith('http') ? website : 'https://$website',
                                ),
                                mode: LaunchMode.externalApplication,
                              );
                            } catch (e) {
                              Get.snackbar("Error", "Could not launch website: $e");
                            }
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/web.svg",
                                width: 18,
                                height: 18,
                                colorFilter: const ColorFilter.mode(
                                  AppColor.primary,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  business,
                                  style: const TextStyle(color: AppColor.primary, fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
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
                            Text(
                              controller.shop.value?.businessName ?? 'Unknown Business',
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // Location Map
                        if (controller.shop.value != null) ShopMap(shop: controller.shop.value!),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
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
                  if (widget.id == null)
                    Expanded(
                      child: AppButton(
                        text: 'Payment & Publish',
                        onPressed: () => Get.toNamed(
                          AppRoutes.PAYMENT_METHOD,
                          arguments: {'isSelectable': true},
                        ),
                      ),
                    ),

                  // Expanded(
                  //   child: AppButton(
                  //     text: 'Save For Later',
                  //     onPressed: () {
                  //       final item = SaveItem(
                  //         id: deal.id,
                  //         // title: deal.title,
                  //         // businessName: deal.businessName ?? 'Unknown',
                  //         // imagePath: deal.image,
                  //         // price: deal.price,
                  //         // originalPrice: deal.originalPrice,
                  //         // isAvailable: true,
                  //         // status: 'active',
                  //       );
                  //
                  //       // Save locally using the controller
                  //       Get.find<SavesController>().saveForLater(item);
                  //       Get.toNamed(AppRoutes.SAVEDLATER);
                  //     },
                  //     backgroundColor: Colors.white70,
                  //     textColor: AppColor.primary,
                  //     borderColor: AppColor.primary,
                  //     leading: SvgPicture.asset(
                  //       AppAssets.saved,
                  //       width: 18,
                  //       height: 18,
                  //       colorFilter: const ColorFilter.mode(AppColor.primary, BlendMode.srcIn),
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    child: AppButton(
                      text: 'Save For Later',
                      onPressed: () {
                        final dealId = deal.id;
                        final controller = Get.find<SavesController>();

                        controller.saveForLater(dealId!);
                        controller.fetchSavedDeals();
                        Get.toNamed(AppRoutes.SAVEDLATER);
                      },
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

                  const SizedBox(width: 16),

                  Expanded(
                    child: AppButton(
                      onPressed: () async {
                        final couponController = Get.put(CouponController());

                        // Set deal info from the API response
                        couponController.setDeal(deal);

                        // Open the popup
                        Get.dialog(const CouponPopupView()).then((_) {
                          if (Get.isRegistered<CouponController>()) {
                            Get.delete<CouponController>();
                          }
                        });
                      },
                      text: 'Show Coupon',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
