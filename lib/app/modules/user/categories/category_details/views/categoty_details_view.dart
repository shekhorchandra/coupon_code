import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../../../core/values/app_color.dart';
import '../../../../../core/widgets/App_button.dart';
import '../../../../../core/widgets/common_app_bar.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../bottom_nav_bar/controllers/bottom_nav_controller.dart';
import '../../../discover_bar/discover_details/views/discover_details_view_page.dart';
import '../controllers/category_details_controller.dart';


class CategotyDetails extends GetView<CategoryDetailsController> {
  const CategotyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<UserNavigationBarController>();
    final controller = Get.put(CategoryDetailsController());

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
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: CustomTextField(
                hint: "Search for deals",
                icon: Icons.search,
                onChanged: controller.onSearch,
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
