import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/values/app_assets.dart';
import '../../../../core/values/app_color.dart';
import '../controllers/bottom_nav_controller.dart';

class UserNavigationBarPage extends GetView<UserNavigationBarController> {
  const UserNavigationBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserNavigationBarController());

    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            // Main bottom nav screen
            controller.screens[controller.selectedIndex.value],

            // Overlay page (e.g., AboutView)
            if (controller.currentOverlayPage.value != null)
              controller.currentOverlayPage.value!,
          ],
        );
      }),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColor.textcolor, width: 0.5),
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
                  indicatorShape: const CircleBorder(),
                  selectedIndex: controller.selectedIndex.value,
                  onDestinationSelected: controller.changeTab,
                  animationDuration: Duration.zero,
                  height: 65,
                  backgroundColor: AppColor.white,
                  indicatorColor: AppColor.vividSky.s300,
                  labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((
                    states,
                  ) {
                    if (states.contains(MaterialState.selected)) {
                      return TextStyle(
                        color: AppColor.vividSky.s300,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      );
                    }
                    return TextStyle(color: AppColor.bw.s500, fontSize: 12);
                  }),

                  destinations: [
                    NavigationDestination(
                      icon: SvgPicture.asset(
                        AppAssets.discover,
                        colorFilter: ColorFilter.mode(
                          controller.selectedIndex.value == 0
                              ? AppColor.white
                              : AppColor.bw.s500,
                          BlendMode.srcIn,
                        ),
                        width: 20,
                        height: 20,
                      ),
                      label: 'Discover',
                    ),
                    NavigationDestination(
                      icon: SvgPicture.asset(
                        AppAssets.category,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          controller.selectedIndex.value == 1
                              ? AppColor.white
                              : AppColor.bw.s500,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: 'Categories',
                    ),
                    NavigationDestination(
                      icon: SvgPicture.asset(
                        AppAssets.saved,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          controller.selectedIndex.value == 2
                              ? AppColor.white
                              : AppColor.bw.s500,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: 'Saved',
                    ),
                    NavigationDestination(
                      icon: SvgPicture.asset(
                        AppAssets.menu,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          controller.selectedIndex.value == 3
                              ? AppColor.white
                              : AppColor.bw.s500,
                          BlendMode.srcIn,
                        ),
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
