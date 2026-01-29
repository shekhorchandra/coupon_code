import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/app_assets.dart';
import '../../../../core/values/app_color.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widgets/common_app_bar.dart';
import '../../../../routes/app_routes.dart';
import '../../bottom_nav_bar/views/bottom_nav_view.dart';



class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"icon": AppAssets.food, "title": "Food & Drink"},
      {"icon": AppAssets.food, "title": "Spas & Wellness"},
      {"icon": AppAssets.food, "title": "Beauty Treatments"},
      {"icon": AppAssets.food, "title": "Health & Medical"},
      {"icon": AppAssets.food, "title": " Events & Concerts"},
      {"icon": AppAssets.food, "title": "Shopping & Retail"},
      {"icon": AppAssets.food, "title": "Education & Learning"},
      {"icon": AppAssets.food, "title": "Outdoor & Recreation"},
      {"icon": AppAssets.food, "title": "Automotive Services"},
    ];

    return Scaffold(
      bottomNavigationBar: const AppBottomNavBar(),
      appBar: const CommonAppBar(
        title: "Categories",
        showBack: false,
      ),
      body: Column(
        children: [
          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search categories",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // 🟢 Categories Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,),
              child: GridView.builder(
                shrinkWrap: true, // avoid overflow
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final item = categories[index];
                  return _categoryItem(
                    iconPath: item["icon"] as String, // use string path
                    title: item["title"] as String,
                    onTap: () {
                      Get.toNamed(AppRoutes.CATEGORIESDETAILS);
                    },
                  );
                },
              ),
            ),
          )


        ],
      ),
    );
  }

  // ---------- Category Item ----------
  Widget _categoryItem({
    required String iconPath,
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
            child: Padding(
              padding: const EdgeInsets.all(12), // inner padding
              child: Image.asset(
                iconPath,
                width: 46,
                height: 57,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 4), // small vertical gap
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.Text.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }





}
