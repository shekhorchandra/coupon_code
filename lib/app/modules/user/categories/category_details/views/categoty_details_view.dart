import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../../../core/values/app_color.dart';
import '../../../../../core/widgets/App_button.dart';
import '../../../../../core/widgets/common_app_bar.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../routes/app_routes.dart';
import '../../../bottom_nav_bar/controllers/bottom_nav_controller.dart';
import '../category_details_filter_widget/category_filter_controller/category_filter_controller.dart';
import '../category_details_filter_widget/category_fliter_view/category_filter_dropdown.dart';
import '../controllers/category_details_controller.dart';
import '../model/category_deal_model.dart';

class CategotyDetails extends GetView<CategoryDetailsController> {
  const CategotyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<UserNavigationBarController>();
    final controller = Get.put(CategoryDetailsController());
    final FilterController filterController = Get.put(FilterController());

    return Scaffold(
      appBar: CommonAppBar(
        title: controller.title,
        showBack: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.fetchDeals();
            await Future.delayed(const Duration(milliseconds: 600));
          },
          color: AppColor.primary,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Column(
                children: [
                  // Search + Zip Code + Location
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [

                          /// SEARCH ICON
                          const Icon(Icons.search, color: Colors.grey, size: 20),
                          const SizedBox(width: 8),

                          /// SEARCH FIELD
                          Expanded(
                            child: TextField(
                              controller: controller.searchController,
                              decoration: const InputDecoration(
                                hintText: "Search deals...",
                                border: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),

                          /// DIVIDER
                          Container(
                            height: 24,
                            width: 1,
                            color: Colors.grey.shade300,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                          ),

                          /// ZIP ICON
                          const Icon(Icons.location_on, color: Colors.grey, size: 20),
                          const SizedBox(width: 6),

                          /// ZIP FIELD
                          SizedBox(
                            width: 70,
                            child: TextField(
                              controller: controller.zipController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: "Zip",
                                border: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          /// SEARCH BUTTON
                          GestureDetector(
                            onTap: controller.onSearchButton,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text(
                                "Search",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Dropdown
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    color: Colors.grey.shade100,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          filterDropdown(
                            hint: "Sort By",
                            selectedValue: filterController.sortBy,
                            items: filterController.sortOptions,
                          ),
                          const SizedBox(width: 8),

                          filterDropdown(
                            hint: "Categories",
                            selectedValue: filterController.category,
                            items: filterController.categoryOptions,
                          ),
                          const SizedBox(width: 8),

                          filterDropdown(
                            hint: "Price",
                            selectedValue: filterController.price,
                            items: filterController.priceOptions,
                          ),
                          const SizedBox(width: 8),

                          filterDropdown(
                            hint: "Availability",
                            selectedValue: filterController.availability,
                            items: filterController.availabilityOptions,
                          ),

                          const SizedBox(width: 8),

                          filterDropdown(
                            hint: "Distance",
                            selectedValue: filterController.distance,
                            items: filterController.distanceOptions,
                          ),

                          const SizedBox(width: 8),

                          filterDropdown(
                            hint: "Location",
                            selectedValue: filterController.location,
                            items: filterController.locationOptions,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Deals Grid

                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator(color: AppColor.primary,));
                    }

                    if (controller.deals.isEmpty) {
                      return const Center(
                        child: Text(
                          "No deals found",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      );
                    }

                    return MasonryGridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 2,
                      itemCount: controller.deals.length,
                      itemBuilder: (context, index) {
                        final deal = controller.deals[index];
                        final isShort = index % 2 == 0;
                        return _dealCard(navController, deal, isShort);
                      },
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dealCard(UserNavigationBarController navController, CategoryDealModel deal, bool isShort) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image with overlay
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  deal.images.first,
                  height: isShort ? 160 : 260,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: isShort ? 160 : 260,
                      alignment: Alignment.center,
                      color: Colors.grey.shade200,
                      child: const CircularProgressIndicator(strokeWidth: 2, color: AppColor.primary),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: isShort ? 160 : 260,
                    alignment: Alignment.center,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
                  ),
                ),
              ),

              /// Gradient Overlay
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black45],
                    ),
                  ),
                ),
              ),

              /// Discount badge
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${deal.discount.toInt()}% OFF",
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ),

              /// Distance overlay
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "${(deal.distance / 1000).toStringAsFixed(2)} km away",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),

          /// Content Padding
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Deal Title
                Text(
                  deal.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),

                /// Shop Name
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.shopDetails, arguments: {"shopId": deal.shopId});
                  },
                  child: Text(
                    deal.businessName,
                    style: const TextStyle(fontSize: 13, color: Colors.blueAccent),
                  ),
                ),
                const SizedBox(height: 8),

                /// Prices and promotion
                Row(
                  children: [
                    Text(
                      "\$${deal.finalPrice.toStringAsFixed(0)}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "\$${deal.price.toStringAsFixed(0)}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const Spacer(),
                    if (deal.promotedUntil != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _formatRemainingTime(deal.promotedUntil!),
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 8),

                /// Redeem Button
                AppButton(
                  text: "Redeem Now",
                  height: 36,
                  width: double.infinity,
                  onPressed: () {
                    Get.toNamed(AppRoutes.DISCOVERDETAILS, arguments: {
                      'id': deal.id,
                      'dealItem': deal,
                      'isNetworkImage': true,
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _badge(String text) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(4)),
    child: Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
    ),
  );
  //
  // Widget _textOverlay(String text) => Text(
  //   text,
  //   style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
  // );

  //Helper function to format remaining time
  String _formatRemainingTime(DateTime endTime) {
    final now = DateTime.now();
    if (endTime.isBefore(now)) return "Expired";

    final difference = endTime.difference(now);

    final days = difference.inDays;
    final hours = difference.inHours % 24;

    return "${days}d ${hours.toString().padLeft(2, '0')}h";
  }
}
