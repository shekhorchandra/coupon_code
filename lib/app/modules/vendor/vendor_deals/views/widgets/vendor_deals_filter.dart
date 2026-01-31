import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/controllers/vendor_deals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorDealsFilter extends GetView<VendorDealsController> {
  const VendorDealsFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorDealsController());

    return Row(
      children: [
        // TABS WRAPPER
        Obx(
          () => Row(
            children: [
              // Active Deals Tab
              GestureDetector(
                onTap: () => controller.setTab(0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: controller.selectedTab.value == 0
                        ? AppColor.vividSky.s300
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    "Active Deals",
                    style: AppText.body1.semiBold.copyWith(
                      color: controller.selectedTab.value == 0 ? AppColor.white : AppColor.bw.s400,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // Expired Deals Tab
              GestureDetector(
                onTap: () => controller.setTab(1),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: controller.selectedTab.value == 1
                        ? AppColor.vividSky.s300
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Expired Deals",
                    style: AppText.body1.semiBold.copyWith(
                      color: controller.selectedTab.value == 1 ? AppColor.white : AppColor.bw.s400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const Spacer(),

        // FILTER BUTTON
        InkWell(
          onTap: () {
            // TODO: Filter logic
          },
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColor.sky.s100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(Icons.tune_rounded, size: 18, color: AppColor.vividSky.s700),
                SizedBox(width: 6),
                Text(
                  "Filters",
                  style: TextStyle(
                    color: AppColor.vividSky.s700,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
