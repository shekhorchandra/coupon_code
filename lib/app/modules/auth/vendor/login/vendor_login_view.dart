import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/app_assets.dart';
import '../../../../core/values/app_color.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widgets/App_button.dart';
import '../../../../core/widgets/auth_toggle.dart';
import '../../../../core/widgets/common_app_bar.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/social_button.dart';
import '../../../../core/widgets/switch_role_card.dart';
import '../../../../data/models/user_role.dart';
import '../../../../routes/app_routes.dart';
import 'vendor_login_controller.dart';

class VendorLoginView extends GetView<VendorLoginController> {
  const VendorLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: " "),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Center(child: Image.asset(AppAssets.economic, height: 90)),
            const SizedBox(height: 16),
            Text(
              "Welcome Back, Vendor",
              textAlign: TextAlign.center,
              style: AppTextStyles.HeaderTitle,
            ),
            Text(
              "Let’s get you back to your business",
              textAlign: TextAlign.center,
              style: AppTextStyles.HeaderSubTitle,
            ),
            const SizedBox(height: 20),

            AuthToggle(
              isLogin: true,
              onLoginTap: () {},
              onSignupTap: () => Get.offNamed(AppRoutes.VENDOR_SIGNUP),
            ),

            const SizedBox(height: 20),

            const CustomTextField(hint: "Email Address", icon: Icons.email_outlined),

            const SizedBox(height: 12),

            Obx(
              () => CustomTextField(
                hint: "Password",
                icon: Icons.lock_outline,
                obscure: controller.obscure.value,
                suffix: IconButton(
                  icon: Icon(controller.obscure.value ? Icons.visibility_off : Icons.visibility),
                  onPressed: controller.togglePassword,
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(
                    AppRoutes.VENDOR_FORGOT_PASSWORD,
                    arguments: UserRole.user, // or UserRole.vendor
                  );
                },
                child: const Text("Forgot Password?", style: TextStyle(color: AppColor.primary)),
              ),
            ),

            AppButton(
              text: "Log in",
              onPressed: () {
                // TODO: call login API
                Get.offAllNamed(AppRoutes.VENDOR_NAVIGATION_BAR);
              },
            ),

            const SizedBox(height: 20),

            Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text("Or continue with"),
                ),
                Expanded(child: Divider()),
              ],
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                children: const [
                  Expanded(
                    child: SocialButton(text: "Google", iconPath: AppAssets.google),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: SocialButton(text: "Apple", iconPath: AppAssets.apple),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),

            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: AppTextStyles.Text,
                  children: [
                    TextSpan(
                      text: "Sign Up",
                      style: AppTextStyles.TextButton,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Using GetX navigation
                          Get.toNamed(AppRoutes.VENDOR_SIGNUP);
                        },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            SwitchRoleCard(
              title: "Switch to User Mode",
              subtitle: "Browse deals and redeem coupons.",
              onTap: () => Get.offAllNamed(AppRoutes.USER_LOGIN),
            ),
          ],
        ),
      ),
    );
  }
}
