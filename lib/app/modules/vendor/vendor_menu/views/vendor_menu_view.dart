import 'package:coupon_code/app/core/values/app_assets.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_sizes.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/core/widgets/section_heading.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/vendor_account_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_menu/controllers/vendor_menu_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_menu/views/widgets/menu_item.dart';
import 'package:coupon_code/app/modules/vendor/vendor_menu/views/widgets/profile_overview_card.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class VendorMenuPage extends GetView<VendorAccountController> {
  const VendorMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(VendorMenuController());

    return Obx(() {
      if (menuController.loading.value) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }

      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppSizes.screenPadding),
            child: Column(
              children: [
                // User Info
                ProfileOverviewCard(),
                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.USER_BOTTOM_NAV),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColor.primary.withAlpha(30),
                          child: Image.asset(
                            AppAssets.vendor,
                            height: 50,
                            width: 50,
                            fit: BoxFit.contain,
                          ),
                        ),

                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Switch to User",
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "Continue as a User",
                                style: TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Settings
                SectionHeading(title: 'Settings'),

                KMenuItem(
                  title: 'Profile',
                  icon: Icons.person,
                  onTap: () => Get.toNamed(AppRoutes.VENDOR_PROFILE),
                ),
                KMenuItem(
                  title: 'Payment Methods',
                  icon: Icons.credit_card_rounded,
                  onTap: () => Get.toNamed(AppRoutes.PAYMENT_METHOD),
                ),
                KMenuItem(
                  title: 'About Us',
                  icon: Icons.info_outline_rounded,
                  onTap: () => Get.toNamed(AppRoutes.ABOUT),
                ),
                KMenuItem(
                  title: 'Contact Us',
                  icon: Icons.headphones_outlined,
                  onTap: () => Get.toNamed(AppRoutes.CONTACT_US),
                ),
                KMenuItem(
                  title: 'Help & Support',
                  icon: Icons.help_outline_rounded,
                  onTap: () => Get.toNamed(AppRoutes.HELP_SUPPORT),
                ),

                KMenuItem(
                  title: 'Privacy Policy',
                  icon: Icons.privacy_tip_outlined,
                  onTap: () => Get.toNamed(AppRoutes.PRIVACYPOLICY),
                ),
                KMenuItem(
                  title: 'Terms & Conditions',
                  icon: Icons.description_outlined,
                  onTap: () => Get.toNamed(AppRoutes.TERMSCONDITION),
                ),
                KMenuItem(title: 'Rate the App', icon: Icons.star_rate_rounded, onTap: () {}),
                KMenuItem(
                  title: 'Invite Friends',
                  icon: Icons.share_outlined,
                  onTap: () async {
                    final box = context.findRenderObject() as RenderBox?;

                    await SharePlus.instance.share(
                      ShareParams(
                        title: 'Get best deals on Yepp!',
                        subject: 'Download Yepp',
                        text: '''
                          🔥 Get the best deals on Yepp!

                          Shop smarter and save more with amazing offers. Download the app now!

                          Available on Android & iOS.
                        ''',
                        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
                      ),
                    );
                  },
                  showDivider: false,
                ),

                // Logout
                const SizedBox(height: 20),

                // AppButton(
                //     text: 'Logout',
                //     onPressed: menuController.logout
                // ),
                AppButton(text: 'Logout', onPressed: menuController.showLogoutWarning),

                const SizedBox(height: 20),

                // AppButton(
                //   text: 'User ID',
                //   onPressed: () async {
                //     StorageService _storageService = StorageService();

                //     print(await _storageService.userId);
                //   },
                // ), // TODO: remove this debug button
              ],
            ),
          ),
        ),
      );
    });
  }
}
