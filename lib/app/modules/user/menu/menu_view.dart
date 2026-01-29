import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../core/values/app_color.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/widgets/App_button.dart';
import '../../../routes/app_routes.dart';
import '../bottom_nav_bar/views/bottom_nav_view.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavBar(),
      appBar: const CommonAppBar(title: "Menu", showBack: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Profile / Login Button Container
            GestureDetector(
              onTap: () {
                // Navigate to Login / Signup
                Get.toNamed(AppRoutes.USER_LOGIN);
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColor.primary.withOpacity(0.1),
                      child: const Icon(
                        Icons.person,
                        color: AppColor.primary,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Login / Sign Up",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Sign in to save deals and track your favorites",
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

            /// Settings Title
            Text("Settings", style: AppTextStyles.MenuTitle),

            const SizedBox(height: 12),

            /// Settings Items
            _menuItem(
              icon: Icons.info_outline,
              title: "About Us",
              onTap: () {
                Get.toNamed(AppRoutes.ABOUT);
              },
            ),
            _menuItem(
              icon: Icons.campaign_outlined,
              title: 'Advertise on "App Name"',
              onTap: () {
                Get.toNamed(AppRoutes.USER_LOGIN);
              },
            ),
            _menuItem(
              icon: Icons.contact_support_outlined,
              title: "Contact Us",
              onTap: () {
                Get.toNamed(AppRoutes.CONTACT_US);
              },
            ),
            _menuItem(
              icon: Icons.help_outline,
              title: "Help & Support",
              onTap: () {
                Get.toNamed(AppRoutes.HELP_SUPPORT);
              },
            ),

            SizedBox(height: 24),

            _menuItem(icon: Icons.privacy_tip_outlined, title: "Privacy Policy", onTap: () {
              Get.toNamed(AppRoutes.PRIVACYPOLICY);
            }),
            _menuItem(icon: Icons.description_outlined, title: "Terms & Condition", onTap: () {
              Get.toNamed(AppRoutes.TERMSCONDITION);
            }),
            _menuItem(icon: Icons.star_rate_outlined, title: "Rate the App", onTap: () {}),
            _menuItem(icon: Icons.share_outlined, title: "Invite Friends", onTap: () {}),

            const SizedBox(height: 24),

            /// Logout Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: AppButton(
                onPressed: () {
                  // Logout logic
                },
                text: 'Logout',
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable Menu Item
  Widget _menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(icon, color: AppColor.primary),
          title: Text(title, style: AppTextStyles.MenuButtonText),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          onTap: onTap,
        ),

        /// Divider line
        const Divider(height: 1, thickness: 0.2),
      ],
    );
  }
}
