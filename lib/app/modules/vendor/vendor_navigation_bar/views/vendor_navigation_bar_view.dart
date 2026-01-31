import 'package:coupon_code/app/core/values/app_assets.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/modules/vendor/vendor_navigation_bar/controllers/vendor_navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class VendorNavigationBarPage extends GetView<VendorNavigationBarController> {
  const VendorNavigationBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, bottom: 16),

          // Main Bar Container
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColor.bw.s100, width: 0.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(13),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Obx(
                () => NavigationBar(
                  elevation: 0,
                  height: 65,
                  backgroundColor: AppColor.white,
                  indicatorColor: AppColor.vividSky.s300,
                  labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
                    states,
                  ) {
                    if (states.contains(WidgetState.selected)) {
                      return TextStyle(
                        color: AppColor.vividSky.s300,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      );
                    }
                    return TextStyle(color: AppColor.bw.s500, fontSize: 12);
                  }),
                  indicatorShape: const CircleBorder(),
                  selectedIndex: controller.selectedIndex.value,
                  onDestinationSelected: (index) =>
                      controller.selectedIndex.value = index,
                  animationDuration: Duration.zero,
                  destinations: [
                    NavigationDestination(
                      icon: SvgPicture.asset(
                        AppAssets.dashboard,
                        colorFilter: ColorFilter.mode(
                          controller.selectedIndex.value == 0
                              ? AppColor.white
                              : AppColor.bw.s500,
                          BlendMode.srcIn,
                        ),
                        width: 20,
                        height: 20,
                      ),
                      label: 'Dashboard',
                    ),
                    NavigationDestination(
                      icon: Icon(
                        Iconsax.tag_2_copy,
                        color: controller.selectedIndex.value == 1
                            ? AppColor.white
                            : AppColor.bw.s500,
                        size: 20,
                      ),
                      label: 'Deals',
                    ),
                    NavigationDestination(
                      icon: Icon(
                        Iconsax.shop_copy,
                        color: controller.selectedIndex.value == 2
                            ? AppColor.white
                            : AppColor.bw.s500,
                        size: 20,
                      ),
                      label: 'Menu',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
