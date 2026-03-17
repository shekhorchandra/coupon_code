import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../../../core/values/app_color.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widgets/deal_card_skeleton.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../bottom_nav_bar/controllers/bottom_nav_controller.dart';
import '../../../categories/Category/controllers/categories_controller.dart';
import '../../../categories/category_details/views/categoty_details_view.dart';
import '../controllers/discover_controller.dart';
import '../discover_widget/deal_card.dart';

class DiscoverView extends GetView<DiscoverController> {
  const DiscoverView({super.key});
  static Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    final CategoriesController controller = Get.put(CategoriesController());
    final DiscoverController discoverController = Get.find();

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColor.primary,
          onRefresh: () async {
            await controller.fetchCategories();
            await discoverController.fetchDeals();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Explore Nearby", style: AppTextStyles.HeaderTitle)],
                  ),
                ),

                const SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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

                        /// SEARCH FIELD
                        const Icon(Icons.search, color: Colors.grey, size: 20),
                        const SizedBox(width: 8),

                        Expanded(
                          child: TextField(
                            controller: discoverController.searchController,
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

                        /// ZIP FIELD
                        const Icon(Icons.location_on, color: Colors.grey, size: 20),
                        const SizedBox(width: 8),

                        SizedBox(
                          width: 70,
                          child: TextField(
                            controller: discoverController.zipController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: "Zip",
                              border: InputBorder.none,
                              isDense: true,
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        /// SEARCH BUTTON
                        GestureDetector(
                          onTap: discoverController.onSearchButton,
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

                const SizedBox(height: 12),

                // POPULAR CATEGORIES
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  color: Colors.grey.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Popular Categories", style: AppTextStyles.Title),
                            TextButton(
                              onPressed: () {
                                Get.find<UserNavigationBarController>().changeTab(1);
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
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (_, __) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: Column(
                                    children: [
                                      Skeleton(
                                        height: 56,
                                        width: 56,
                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                      ),
                                      SizedBox(height: 6),
                                      Skeleton(height: 10, width: 50),
                                    ],
                                  ),
                                );
                              },
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
                                    Get.to(() => const CategotyDetails(), arguments: {
                                      "id": category.id,
                                      "title": category.name,
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 28,
                                        backgroundColor: AppColor.secondary.withOpacity(0.2),
                                        child: ClipOval(
                                          child: Image.network(
                                            category.image,
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
                                          category.name,
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

                // DEALS
                Obx(() {
                  /// Loading → show skeleton
                  if (discoverController.isLoading.value) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: MasonryGridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        itemCount: 6,
                        itemBuilder: (_, __) => const DealCardSkeleton(),
                      ),
                    );
                  }

                  /// Empty state
                  if (discoverController.deals.isEmpty) {
                    return const SizedBox(
                      height: 300,
                      child: Center(child: Text("No deals available")),
                    );
                  }

                  /// Deals grid
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: MasonryGridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      itemCount: discoverController.deals.length,
                      itemBuilder: (_, index) =>
                          DealCard(index: index, deal: discoverController.deals[index]),
                    ),
                  );
                }),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
