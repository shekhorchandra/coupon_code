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
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Search Bar + Zip Code Button
                        Row(
                          children: [
                            // Search Field
                            Expanded(
                              child: CustomTextField(
                                hint: "Search for Deals or Zip Code...",
                                icon: Icons.search,
                                onChanged: controller.onSearchDeals, // use controller method


                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
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
                      return const Center(child: CircularProgressIndicator());
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
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Stack(
              children: [
                Container(
                  height: isShort ? 155 : 255,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(deal.images.first),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: isShort ? 155 : 255,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black54],
                    ),
                  ),
                ),
                Positioned(top: 8, left: 8, child: _badge("${deal.discount.toInt()}% off")),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: _textOverlay(
                    "● ${(deal.distance / 1000).toStringAsFixed(3)} km away",
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deal.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    deal.businessName,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 6),

                  // Use Wrap instead of Row
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 6, // horizontal spacing
                    runSpacing: 4, // vertical spacing
                    children: [
                      Text(
                        "\$${deal.finalPrice.toStringAsFixed(0)}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$${deal.price.toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        deal.promotedUntil != null
                            ? _formatRemainingTime(deal.promotedUntil!)
                            : "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  AppButton(
                    text: "Redeem Now",
                    height: 32,
                    onPressed: () {
                      Get.toNamed(
                        AppRoutes.DISCOVERDETAILS,
                        arguments: {
                          'id': deal.id,
                          'dealItem': deal,
                          'isNetworkImage': true, // optional, defaults to true
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
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

  Widget _textOverlay(String text) => Text(
    text,
    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
  );

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
