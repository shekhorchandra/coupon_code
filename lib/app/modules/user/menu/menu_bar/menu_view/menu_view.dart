import 'package:coupon_code/app/core/values/app_assets.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart' hide MenuController;
import 'package:get/get.dart';

import '../../../../../core/values/app_color.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widgets/common_app_bar.dart';
import '../menu_controller/menu_controller.dart';

class MenuView extends GetView<MenuController> {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Menu", showBack: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Profile/Login
            GestureDetector(
              onTap: controller.onLoginTap,
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
                      backgroundColor: AppColor.primary.withOpacity(0.1),
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
                                "Switch to vendor",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Continue as a vendor",
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

            const SizedBox(height: 24),

            Text("Settings", style: AppTextStyles.MenuTitle),
            const SizedBox(height: 12),

            // _menuItem(Icons.info_outline, "About Us", controller.goToAbout),
            _menuItem(Icons.info_outline, "About Us", () => Get.toNamed(AppRoutes.ABOUT)),

            // _menuItem(Icons.campaign_outlined, 'Advertise on App', controller.onAdvertiseTap),
            _menuItem(Icons.contact_support_outlined, "Contact Us", controller.onContactUsTap),
            _menuItem(Icons.emergency, "Help & Support", controller.onHelpSupportTap),
            const SizedBox(height: 24),
            _menuItem(Icons.privacy_tip_outlined, "Privacy Policy", controller.onPrivacyPolicyTap),
            _menuItem(Icons.description_outlined, "Terms & Condition", controller.onTermsTap),
            _menuItem(Icons.star_rate_outlined, "Rate the App", controller.onRateAppTap),
            _menuItem(Icons.share_outlined, "Invite Friends", controller.onInviteFriendsTap),

            const SizedBox(height: 24),

            // SizedBox(
            //   width: double.infinity,
            //   height: 52,
            //   child: AppButton(text: 'Logout', onPressed: controller.onLogoutTap),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String title, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(icon, color: AppColor.bw.s700),
          title: Text(title, style: AppTextStyles.MenuButtonText),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          onTap: onTap,
        ),
        const Divider(height: 1, thickness: 0.2),
      ],
    );
  }
}
