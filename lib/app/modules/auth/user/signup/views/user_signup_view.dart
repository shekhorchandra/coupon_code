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
import '../controllers/user_signup_controller.dart';

class UserSignupView extends GetView<UserSignupController> {
  const UserSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: " ", showBack: false,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Center(child: Image.asset(AppAssets.economic, height: 90)),
            const SizedBox(height: 16),

            Text(
              "Create New Account",
              textAlign: TextAlign.center,
              style: AppTextStyles.HeaderTitle,
            ),

            Text(
              "Please enter your details to sign up",
              textAlign: TextAlign.center,
              style: AppTextStyles.HeaderSubTitle,
            ),

            const SizedBox(height: 20),

            AuthToggle(
              isLogin: false,
              onLoginTap: () => Get.offNamed(AppRoutes.USER_LOGIN),
              onSignupTap: () {},
            ),

            const SizedBox(height: 20),

            const CustomTextField(hint: "User Name", icon: Icons.person_outline),

            const SizedBox(height: 12),

            const CustomTextField(hint: "Email Address", icon: Icons.email_outlined),

            const SizedBox(height: 12),

            Obx(
              () => CustomTextField(
                hint: "Set Password",
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

            const SizedBox(height: 12),

            Obx(
              () => CustomTextField(
                hint: "Confirm Password",
                icon: Icons.lock_outline,
                obscure: controller.obscureConfirmPassword.value,
                suffix: IconButton(
                  icon: Icon(
                    controller.obscureConfirmPassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: controller.toggleConfirmPassword,
                ),
              ),
            ),

            const SizedBox(height: 20),

            AppButton(
              text: "Sign up",
              onPressed: () {
                // TODO: call login API
              },
            ),

            const SizedBox(height: 16),

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

            const SizedBox(height: 10),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 32.0),
            //   child: Row(
            //     children: const [
            //       Expanded(
            //         child: SocialButton(text: "Google", iconPath: AppAssets.google),
            //       ),
            //       SizedBox(width: 12),
            //       Expanded(
            //         child: SocialButton(text: "Apple", iconPath: AppAssets.apple),
            //       ),
            //     ],
            //   ),
            // ),

            const SizedBox(height: 16),

            Center(
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: AppTextStyles.Text,
                  children: [
                    TextSpan(
                      text: "Log In",
                      style: AppTextStyles.TextButton,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(AppRoutes.USER_LOGIN);
                        },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            SwitchRoleCard(
              title: "Switch to Vendor",
              subtitle: "Continue as a Vendor",
              onTap: () => Get.offNamed(AppRoutes.VENDOR_SIGNUP),
            ),
          ],
        ),
      ),
    );
  }
}
