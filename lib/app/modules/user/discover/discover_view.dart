import 'package:flutter/material.dart' as AppTextStyle;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../core/values/app_assets.dart';
import '../../../core/values/app_color.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/widgets/App_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../bottom_nav_bar/bottom_nav_controller.dart';
import '../bottom_nav_bar/bottom_nav_view.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());

    return Scaffold(
      bottomNavigationBar: const AppBottomNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Explore Nearby", style: AppTextStyles.HeaderTitle),
                  IconButton(
                    icon: const Icon(Icons.notifications_none),
                    onPressed: () {
                      /// logic
                    },
                  ),
                ],
              ),
            ),

            // Search + Zip Code + Location
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar + Zip Code Button
                  Row(
                    children: [
                      // 🔍 Search Field
                      Expanded(
                        child: CustomTextField(hint: "Search for deals", icon: Icons.search),
                      ),

                      const SizedBox(width: 8),

                      // ZIP Code Button
                      AppButton(
                        text: "ZIP Code",
                        width: 110,
                        height: 42,
                        onPressed: () {
                          /// open zip selector
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Location button
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      /// open location selector / bottom sheet
                    },
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

            const SizedBox(height: 16),

            // Popular Categories Container
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextStyle.Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Popular Categories", style: AppTextStyles.Title),
                        Text("See All", style: AppTextStyles.TextButton),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(6, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundColor: AppColor.secondary.withOpacity(0.2),
                                child: Image.asset(
                                  AppAssets.food, // 'assets/icons/food.png'
                                  width: 38,
                                  height: 38,
                                  fit: BoxFit.contain,
                                ),
                              ),

                              const SizedBox(height: 4),
                              const Text("Food & Drink", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Deals Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    final isShort = index % 2 == 0;

                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 🖼 IMAGE
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
                              // Gradient Overlay
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

                              // Discount badge
                              Positioned(top: 8, left: 8, child: _badge("55% off")),

                              Positioned(bottom: 8, left: 8, child: _textOverlay("● 1.2 km away")),
                            ],
                          ),

                          // 📄 CONTENT
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
                                  height: 32, // or 48 if you want compact
                                  onPressed: () {
                                    // redeem action
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _badge(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(4)),
    child: Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _textOverlay(String text) {
  return Text(
    text,
    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
  );
}
