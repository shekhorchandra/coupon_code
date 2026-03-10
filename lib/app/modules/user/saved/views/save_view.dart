import 'package:coupon_code/app/modules/user/saved/controllers/save_controller.dart';
import 'package:coupon_code/app/modules/user/saved/widget/save_item_card.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/app_color.dart';
import '../../../../core/widgets/common_app_bar.dart';
import '../../bottom_nav_bar/controllers/bottom_nav_controller.dart';
import '../models/save_item_model.dart';

class UserMySavesPage extends GetView<SavesController> {
  const UserMySavesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<UserNavigationBarController>();
    return Scaffold(
      // appBar: const CommonAppBar(title: "My Saves", showBack: false),
      appBar: CommonAppBar(
        title: "My Saves",
        showBack: false,
        onBack: () {
          // Close the overlay page instead of default back
          navController.closeOverlayPage();
        },
      ),
      body: Column(
        children: [
          // --- Tabs ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_tabButton("All", 0), _tabButton("Available", 1), _tabButton("Expired", 2)],
          ),

          const SizedBox(height: 8),

          // --- List of Saved Items ---
          Expanded(
            child: Obx(() {

              if(controller.isLoading.value){
                return const Center(child: CircularProgressIndicator(color: AppColor.primary,));
              }
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
                return const Center(child: Text("No items found"));
              }

              return ListView.builder(
                itemCount: listToShow.length,
                itemBuilder: (context, index) {
                  final item = listToShow[index];
                  return SaveItemCard(
                    id: item.id,
                    imagePath: item.imagePath,
                    title: item.title,
                    businessName: item.businessName, // changed
                    price: item.price,
                    originalPrice: item.originalPrice,
                    isAvailable: item.isAvailable,
                    Status: item.status,
                    onTap: () {
                      Get.toNamed(AppRoutes.DISCOVERDETAILS, arguments: {'id': item.id});
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
