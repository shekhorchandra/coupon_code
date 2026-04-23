import 'package:coupon_code/app/modules/user/saved/controllers/save_controller.dart';
import 'package:coupon_code/app/modules/user/saved/widget/save_item_card.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/app_color.dart';
import '../../../../core/widgets/common_app_bar.dart';

class UserMySavesPage extends GetView<SavesController> {
  UserMySavesPage({super.key});

  final SavesController controller = Get.put(SavesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "My Saves", showBack: true),
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
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator(color: AppColor.primary));
              }
              List<dynamic> listToShow;
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

              return RefreshIndicator(
                color: AppColor.primary,
                onRefresh: () async {
                  await controller.fetchSavedItems(); // your API reload method
                },
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: listToShow.length,
                  itemBuilder: (context, index) {
                    final item = listToShow[index];

                    return Stack(
                      children: [
                        SaveItemCard(
                          id: item.id,
                          imagePath: item.imagePath,
                          title: item.title,
                          businessName: item.businessName,
                          price: item.price,
                          originalPrice: item.originalPrice,
                          isAvailable: item.isAvailable,
                          promotedUntil: item.promotedUntil,
                          status: item.status,
                          onTap: () {
                            Get.toNamed(AppRoutes.DISCOVERDETAILS, arguments: {'id': item.id});
                          },
                        ),
                      ],
                    );
                  },
                ),
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
