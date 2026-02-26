import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/values/app_color.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widgets/App_button.dart';
import '../../../../../core/widgets/common_app_bar.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../routes/app_routes.dart';
import '../controllers/forgot_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final isUser = controller.role == UserRole.user;

    return Scaffold(
      appBar: const CommonAppBar(title: " "),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isUser ? "User Forgot Password?" : "Vendor Forgot Password?",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "Enter the email associated with your account",
              style: TextStyle(fontSize: 12, color: AppColor.greyText),
            ),

            const SizedBox(height: 32),

            const Text("Email Address", style: TextStyle(fontSize: 16, color: AppColor.textcolor)),

            const SizedBox(height: 16),

            CustomTextField(
              controller: controller.emailController,
              hint: "Email Address",
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 24),

            Obx(() => AppButton(
              text: "Send OTP",
              loading: controller.isLoading.value,
              onPressed: controller.sendResetLink,
            )),

            const SizedBox(height: 60),

            Center(
              child: RichText(
                text: TextSpan(
                  text: "Remember your password? ",
                  style: AppTextStyles.Text,
                  children: [
                    TextSpan(
                      text: "Log In",
                      style: AppTextStyles.TextButton,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.offNamed(isUser ? AppRoutes.USER_LOGIN : AppRoutes.VENDOR_LOGIN);
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
