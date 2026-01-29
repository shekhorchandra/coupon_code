import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/values/app_assets.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widgets/App_button.dart';
import '../../../../../core/widgets/auth_toggle.dart';
import '../../../../../core/widgets/common_app_bar.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/social_button.dart';
import '../../../../../core/widgets/switch_role_card.dart';
import '../../../../../routes/app_routes.dart';
import '../controllers/user_login_controller.dart';

class UserLoginView extends GetView<UserLoginController> {
  const UserLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: " ", showBack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Center(child: Image.asset(AppAssets.economic, height: 90)),

            const SizedBox(height: 16),

            Text("Welcome Back", textAlign: TextAlign.center, style: AppTextStyles.HeaderTitle),

            Text(
              "Please enter your details to sign in",
              textAlign: TextAlign.center,
              style: AppTextStyles.HeaderSubTitle,
            ),

            const SizedBox(height: 20),

            AuthToggle(
              isLogin: true,
              onLoginTap: () {},
              onSignupTap: () => Get.offNamed(AppRoutes.USER_SIGNUP),
            ),

            const SizedBox(height: 20),

            const CustomTextField(hint: "Email Address", icon: Icons.email_outlined),

            const SizedBox(height: 12),

            Obx(
              () => CustomTextField(
                hint: "Password",
                icon: Icons.lock_outline,
                obscure: controller.obscurePassword.value,
                suffix: IconButton(
                  icon: Icon(
                    controller.obscurePassword.value ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: controller.togglePassword,
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Get.toNamed(AppRoutes.USER_FORGOT_PASSWORD),
                child: Text("Forgot Password?", style: AppTextStyles.TextButton),
              ),
            ),

            AppButton(
              text: "Log in",
              onPressed: () {
                // TODO: call login API
                Get.offAllNamed(AppRoutes.DISCOVER);
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
                          Get.toNamed(AppRoutes.USER_SIGNUP);
                        },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 50),

            SwitchRoleCard(
              title: "Are you a Vendor?",
              subtitle: "Continue as a vendor",
              onTap: () => Get.offAllNamed(AppRoutes.VENDOR_LOGIN),
            ),
          ],
        ),
      ),
    );
  }
}
