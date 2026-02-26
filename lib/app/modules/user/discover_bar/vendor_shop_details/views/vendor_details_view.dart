import 'dart:math';

import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/values/app_color.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widgets/App_button.dart';
import '../../../../../routes/app_routes.dart';
import '../bindings/vendor_details_binding.dart';
import '../controller/vendor_details_controller.dart';

class VendorDetailsView extends GetView<VendorDetailsController> {
  const VendorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonAppBar(title: 'Vendor Details'),
        body: Column(
          children: [
            // Vendor Info
            const CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage("https://e7.pngegg.com/pngimages/975/385/png-clipart-partnership-business-logo-marketing-business-service-people.png"),
            ),
            const SizedBox(height: 6),
            Text("Glamour Glow Salon", style: AppTextStyles.MenuTitle.copyWith()),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Glamour Glow Salon is a modern beauty studio offering expert hair styling, skincare, makeup, and grooming services. Our skilled professionals use premium products to help you look and feel your best. Whether it’s a quick refresh or a special occasion makeover, we bring out your natural glow with care and creativity.",
                style: AppTextStyles.Text.copyWith(),
                textAlign: TextAlign.start,
              ),
            ),
      
            // Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _tabButton("Active Deals", 0),
                _tabButton("Address & Location", 1),
              ],
            ),
      
            const SizedBox(height: 10),
      
            // Tab Content
            Expanded(
              child: Obx(
                () => controller.selectedTab.value == 0
                    ? _activeDeals()
                    : _addressLocation(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String title, int index) {
    return Obx(() {
      final isSelected = controller.selectedTab.value == index;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected
                ? AppColor.vividSky.s300
                : Color(0xFFD4D4D4),
          ),
          onPressed: () => controller.changeTab(index),
          child: Text(
            title,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      );
    });
  }

  // Active Deals Tab
  Widget _activeDeals() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: controller.deals.length,
      itemBuilder: (_, index) {
        final deal = controller.deals[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ================= IMAGE =================
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(deal["image"]!, fit: BoxFit.cover),
              ),

              /// ================= TITLE =================
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  deal["title"]!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Row(
                  children: [
                    /// Vendor Chip
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => const VendorDetailsView(),
                          binding: VendorDetailsBinding(),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "Glamour Glow Salon",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Countdown
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "10d 08h 54m 23s",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// ================= PRICE =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: const [
                    Text(
                      "\$49",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "\$79",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        Icon(Icons.star_half, color: Colors.orange, size: 16),
                        Icon(Icons.star_border, color: Colors.orange, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          "3.5", // you can replace with dynamic deal.rating
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),

              AppButton(
                text: "Redeem Now",
                height: 32,
                onPressed: () => Get.toNamed(
                  AppRoutes.DISCOVERDETAILS,
                  arguments: {'id': Random().nextInt(50) + 1},
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Address & Location Tab
  Widget _addressLocation() {
    return Column(
      children: [
        // ================= OUTLETS =================
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // aligns text/buttons to start
            children: [
              const Text(
                "Outlets Address",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primary,
                ),
              ),
              const SizedBox(height: 8),
              Obx(
                    () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.outlets.map((o) {
                    bool isSelected =
                        controller.selectedOutlet.value?["name"] == o["name"];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: AppButton(
                        onPressed: () => controller.selectOutlet(o),
                        text: o["name"] as String,
                        backgroundColor: controller.selectedOutlet.value?["name"] == o["name"]
                            ? AppColor.primary
                            : Colors.grey.shade200,
                        textColor: controller.selectedOutlet.value?["name"] == o["name"]
                            ? Colors.white
                            : Colors.black,
                        height: 40, // optional
                        width: double.infinity, // optional
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // ================= MAP =================
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Map Location",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary),
              ),
              const SizedBox(height: 8),
              Obx(() {
                final outlet = controller.selectedOutlet.value;
                return Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade300,
                  ),
                  child: Center(
                    child: Text(
                      outlet != null
                          ? "${outlet['name']} \nLat: ${outlet['lat']}, Lng: ${outlet['lng']}"
                          : "Select an outlet to view location",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
