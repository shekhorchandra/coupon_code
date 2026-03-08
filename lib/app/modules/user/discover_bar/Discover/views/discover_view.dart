import 'dart:async';

import 'package:flutter/material.dart' as AppTextStyle;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../../../core/values/app_color.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widgets/App_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../bottom_nav_bar/controllers/bottom_nav_controller.dart';
import '../../../categories/Category/controllers/categories_controller.dart';
import '../controllers/discover_controller.dart';
import '../discover_widget/discover_details_widget_view/deal_card.dart';


class DiscoverView extends GetView<DiscoverController> {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoriesController controller = Get.put(CategoriesController());
    final DiscoverController discoverController = Get.find();
    Timer? _debounce;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Explore Nearby", style: AppTextStyles.HeaderTitle),
                ],
              ),
            ),

            // SEARCH + ZIP + LOCATION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hint: "Search for deals or Zip Code...",
                          icon: Icons.search,
                          onChanged: (value) {
                            controller.onSearch(value);

                            if (_debounce?.isActive ?? false) _debounce!.cancel();
                            _debounce = Timer(const Duration(milliseconds: 500), () {
                              discoverController.fetchDealsWithSearch(searchTerm: value);
                            });
                          },
                        )
                      ),
                      // const SizedBox(width: 8),
                      // AppButton(
                      //   text: "ZIP Code",
                      //   width: 100,
                      //   height: 40,
                      //   icon: Icons.location_on_outlined,
                      //   onPressed: discoverController.onZipPressed,
                      //   backgroundColor: Colors.white,
                      //   textColor: AppColor.primary,
                      //   borderColor: AppColor.primary,
                      // ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: discoverController.onLocationPressed,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.location_on, color: AppColor.primary),
                        const SizedBox(width: 4),
                        Text("New York, United States", style: AppTextStyles.Text),
                        const SizedBox(width: 4),
                        const Icon(Icons.keyboard_arrow_down, size: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 6),

            // POPULAR CATEGORIES
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextStyle.Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Popular Categories", style: AppTextStyles.Title),
                        TextButton(
                          onPressed: () {
                            final navController = Get.find<UserNavigationBarController>();
                            navController.changeTab(1);
                          },
                          child: Text("See All", style: AppTextStyles.TextButton),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 80,
                    child: Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(color: AppColor.primary),
                        );
                      }

                      if (controller.categories.isEmpty) {
                        return const Center(child: Text("No categories"));
                      }

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categories.length,
                        itemBuilder: (_, index) {
                          final category = controller.categories[index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(40),
                              onTap: () {
                                // navController.changeTab(1);
                                // navController.openOverlayPage(CategotyDetails());
                              },
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 28,
                                    backgroundColor: AppColor.secondary.withOpacity(0.2),
                                    child: ClipOval(
                                      child: Image.network(
                                        category.image, // API image
                                        width: 56,
                                        height: 56,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) =>
                                        const Icon(Icons.image_not_supported),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  SizedBox(
                                    width: 60,
                                    child: Text(
                                      category.name, // API name
                                      style: const TextStyle(fontSize: 12),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // DEALS GRID

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Obx(() {
                  return RefreshIndicator(
                    onRefresh: () async {
                      await discoverController.fetchDeals();
                    },
                    child: discoverController.isLoading.value
                        ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primary,
                      ),
                    )
                        : discoverController.deals.isEmpty
                        ? ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: const [
                        SizedBox(height: 300),
                        Center(child: Text("No deals available")),
                      ],
                    )
                        : MasonryGridView.count(
                      physics: const AlwaysScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      itemCount: discoverController.deals.length,
                      itemBuilder: (_, index) => DealCard(
                        index: index,
                        deal: discoverController.deals[index],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
