import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../core/values/app_assets.dart';
import '../../../../core/values/app_color.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widgets/App_button.dart';
import '../../../../core/widgets/auth_toggle.dart';
import '../../../../core/widgets/common_app_bar.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/social_button.dart';
import '../../../../data/models/user_role.dart';
import '../../../../routes/app_routes.dart';
import 'vendor_login_controller.dart';

class VendorLoginView extends GetView<VendorLoginController> {
  VendorLoginView({super.key});

  final _formKey = GlobalKey<FormState>();
  final VendorLoginController controller = Get.find<VendorLoginController>(); //instance

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

            Form(
              key: _formKey,
              child: Column(
                children: [
                  /// EMAIL
                  CustomTextField(
                    controller: controller.emailController.value,
                    hint: "Email Address",
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Email is required";
                      }
                      if (!GetUtils.isEmail(value.trim())) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  /// PASSWORD
                  Obx(
                    () => CustomTextField(
                      controller: controller.passwordController.value,
                      hint: "Password",
                      icon: Icons.key,
                      obscure: controller.obscure.value,
                      suffix: IconButton(
                        icon: Icon(
                          controller.obscure.value ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: controller.togglePassword,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password required";
                        }
                        if (value.length < 6) {
                          return "Minimum 6 characters";
                        }
                        return null;
                      },
                    ),
                  ),

                  /// FORGOT PASSWORD
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.VENDOR_FORGOT_PASSWORD, arguments: UserRole.user);
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: AppColor.primary),
                      ),
                    ),
                  ),

                  /// LOGIN BUTTON
                  Obx(() {
                    return AppButton(
                      text: "Log in",
                      loading: controller.loading.value,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await controller.loginApi();
                        }
                      },
                    );
                  }),
                ],
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
                      onPressed: () => Get.find<VendorLoginController>().loginWithGoogleDeepLink(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SocialButton(
                      text: "Apple",
                      iconPath: AppAssets.apple,
                      onPressed: () async {
                        final credential = await SignInWithApple.getAppleIDCredential(
                          scopes: [
                            AppleIDAuthorizationScopes.email,
                            AppleIDAuthorizationScopes.fullName,
                          ],
                        );

                        print(credential);
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

            // const SizedBox(height: 20),
            //
            // SwitchRoleCard(
            //   title: "Switch to User Mode",
            //   subtitle: "Browse deals and redeem coupons.",
            //   onTap: () => Get.offAllNamed(AppRoutes.USER_LOGIN),
            // ),
          ],
        ),
      ),
    );
  }
}
