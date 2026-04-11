import 'dart:io';

import 'package:coupon_code/app/modules/auth/vendor/login/vendor_login_controller.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../core/values/app_assets.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widgets/App_button.dart';
import '../../../../core/widgets/auth_toggle.dart';
import '../../../../core/widgets/common_app_bar.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/social_button.dart';
import '../../../../routes/app_routes.dart';
import 'vendor_signup_controller.dart';

class VendorSignupView extends GetView<VendorSignupController> {
  VendorSignupView({super.key});

  late final VendorSignupController controller = Get.find<VendorSignupController>(); //instance
  final VendorLoginController _loginController = Get.put(VendorLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: " ", showBack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Center(child: Image.asset(AppAssets.economic, height: 50)),
            const SizedBox(height: 10),

            Text("Become a Vendor", textAlign: TextAlign.center, style: AppTextStyles.HeaderTitle),

            Text(
              "Expand your reach and boost your sales.",
              textAlign: TextAlign.center,
              style: AppTextStyles.HeaderSubTitle,
            ),

            const SizedBox(height: 20),

            AuthToggle(
              isLogin: false,
              onLoginTap: () => Get.offNamed(AppRoutes.VENDOR_LOGIN),
              onSignupTap: () {},
            ),

            const SizedBox(height: 20),

            CustomTextField(
              controller: controller.userNameController,
              hint: "User Name",
              icon: Icons.person_outline,
            ),

            const SizedBox(height: 12),

            CustomTextField(
              controller: controller.emailController,
              hint: "Email Address",
              icon: Icons.email_outlined,
            ),

            const SizedBox(height: 12),

            Obx(
              () => CustomTextField(
                controller: controller.passwordController,
                hint: "Password",
                icon: Icons.key,
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
                controller: controller.confirmPasswordController,
                hint: "Confirm Password",
                icon: Icons.key,
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

            Obx(
              () => AppButton(
                text: "Next",
                loading: controller.isSubmitting.value,
                onPressed: () async {
                  await controller.registerVendor();
                },
              ),
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
                children: [
                  Expanded(
                    child: SocialButton(
                      text: "Google",
                      iconPath: AppAssets.google,
                      onPressed: () => Get.find<VendorLoginController>().loginWithGoogle(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SocialButton(
                      text: "Apple",
                      iconPath: AppAssets.apple,
                      onPressed: () async {
                        final credential = await SignInWithApple.getAppleIDCredential(
                          webAuthenticationOptions: WebAuthenticationOptions(
                            clientId: "agency.beuptech.yepp.auth",
                            redirectUri: Uri.parse(
                              "${ApiConstants.baseUrl}${ApiConstants.vendorAppleLoginCallback}",
                            ),
                          ),
                          scopes: [
                            AppleIDAuthorizationScopes.email,
                            AppleIDAuthorizationScopes.fullName,
                          ],
                        );

                        if (Platform.isIOS)
                          Get.find<VendorLoginController>().loginWithApple(credential);
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),

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
                          // Using GetX navigation
                          Get.toNamed(AppRoutes.VENDOR_LOGIN);
                        },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // SwitchRoleCard(
            //   title: "Switch to User Mode",
            //   subtitle: "Browse deals and redeem coupons.",
            //   onTap: () => Get.offAllNamed(AppRoutes.USER_SIGNUP),
            // ),
          ],
        ),
      ),
    );
  }
}
