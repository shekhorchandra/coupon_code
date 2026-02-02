import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../../../core/values/app_color.dart';
import '../../../../../core/widgets/App_button.dart';
import '../../../../../core/widgets/common_app_bar.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../bottom_nav_bar/controllers/bottom_nav_controller.dart';
import '../../../discover_bar/discover_details/views/discover_details_view_page.dart';
import '../category_details_filter_widget/category_filter_controller/category_filter_controller.dart';
import '../category_details_filter_widget/category_fliter_view/category_filter_dropdown.dart';
import '../controllers/category_details_controller.dart';


class CategotyDetails extends GetView<CategoryDetailsController> {
  const CategotyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<UserNavigationBarController>();
    final controller = Get.put(CategoryDetailsController());
    final FilterController filterController = Get.put(FilterController());

    return Scaffold(
      appBar: CommonAppBar(
        title: "Food & Drinks",
        showBack: true,
        onBack: () {
          navController.closeOverlayPage();
        },
      ),
      body: SafeArea(
        child: Column(
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
                          hint: "Search for deals",
                          icon: Icons.search,
                        ),
                      ),

                      const SizedBox(width: 4),
                      AppButton(
                        text: "ZIP Code",
                        width: 100,
                        height: 40,
                        backgroundColor: Colors.white,
                        textColor: AppColor.primary,
                        borderColor: AppColor.primary,
                        icon: Icons.location_on_outlined,
                        onPressed: () {
                          /// open zip selector
                        },
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  itemCount: controller.deals.length, // reactive list
                  itemBuilder: (context, index) {
                    final isShort = index % 2 == 0;
                    return _dealCard(navController, index, isShort);
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _dealCard(UserNavigationBarController navController, int index, bool isShort) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
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
                  image: const DecorationImage(
                    image: NetworkImage('https://picsum.photos/300'),
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
              Positioned(top: 8, left: 8, child: _badge("55% off")),
              Positioned(bottom: 8, right: 8, child: _textOverlay("● 1.2 km away")),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "The Ultimate Radiance Revival: Luxurious Facial...",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Glamour Glow Salon",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 6),
                Row(
                  children: const [
                    Text(
                      "\$20",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 6),
                    Text(
                      "\$30",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 24),
                    Text(
                      "10d   08h",
                      style: TextStyle(
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
                    navController.openOverlayPage(ServiceDetailsPage());
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
    decoration: BoxDecoration(
      color: AppColor.primary,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        )),
  );

  Widget _textOverlay(String text) => Text(
    text,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
  );
}
