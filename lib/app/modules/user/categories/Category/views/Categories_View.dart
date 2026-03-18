import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/values/app_assets.dart';
import '../../../../../core/values/app_color.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widgets/common_app_bar.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../routes/app_routes.dart';

import '../../../bottom_nav_bar/controllers/bottom_nav_controller.dart';
import '../../category_details/views/categoty_details_view.dart';
import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Categories", showBack: false),
      body: Column(
        children: [
          // Search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(
              hint: 'Search categories',
              icon: Icons.search,
              onChanged: controller.onSearch,
            ),
          ),

          // Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(() {
                // Loading state
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator(color: AppColor.primary));
                }

                // Empty state
                if (controller.categories.isEmpty) {
                  return const Center(child: Text("No categories"));
                }

                // Grid view
                return GridView.builder(
                  itemCount: controller.filteredCategories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    final item = controller.filteredCategories[index];

                    return _categoryItem(
                      imageUrl: item.image,
                      title: item.name,
                      onTap: () {
                        Get.to(
                          () => const CategotyDetails(),
                          arguments: {"id": item.id, "title": item.name},
                        );
                      },
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryItem({
    required String imageUrl,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: AppColor.primary.withOpacity(0.15),
            child: ClipOval(
              child: Image.network(
                imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.Text.copyWith(fontSize: 10, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
