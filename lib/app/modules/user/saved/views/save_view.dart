
import 'package:coupon_code/app/modules/user/saved/controllers/save_controller.dart';
import 'package:coupon_code/app/modules/user/saved/widget/save_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/app_color.dart';
import '../../../../core/widgets/common_app_bar.dart';
import '../../../../routes/app_routes.dart';


class UserMySavesPage extends GetView<SavesController> {
  const UserMySavesPage({super.key});

// class MySavesPage extends StatelessWidget {
//   MySavesPage({super.key});
//
//   final SavesController controller = Get.put(SavesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "My Saves", showBack: false),
      body: Column(
        children: [
          // --- Tabs ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tabButton("All", 0),
              _tabButton("Available", 1),
              _tabButton("Expired", 2),
            ],
          ),

          const SizedBox(height: 8),

          // --- List of Saved Items ---
          Expanded(
            child: Obx(() {
              List<SaveItem> listToShow;
              switch (controller.selectedTab.value) {
                case 1:
                  listToShow = controller.available;
                  break;
                case 2:
                  listToShow = controller.expired;
                  break;
                default:
                  listToShow = controller.all;
              }

              if (listToShow.isEmpty) {
                return const Center(
                  child: Text("No items found"),
                );
              }

              return ListView.builder(
                itemCount: listToShow.length,
                itemBuilder: (context, index) {
                  final item = listToShow[index];
                  return SaveItemCard(
                    imagePath: item.imagePath,
                    title: item.title,
                    subtitle: item.subtitle,
                    price: item.price,
                    originalPrice: item.originalPrice,
                    duration: item.duration,
                    isAvailable: item.isAvailable,
                    Status: item.Status,
                    onTap: () {
                      Get.toNamed(AppRoutes.DISCOVERDETAILS);
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  // Tab button
  Widget _tabButton(String label, int index) {
    return Obx(() {
      bool isSelected = controller.selectedTab.value == index;
      return GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          decoration: BoxDecoration(
            color: isSelected ? AppColor.primary : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    });
  }

}
