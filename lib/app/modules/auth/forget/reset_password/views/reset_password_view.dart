import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/widgets/App_button.dart';
import '../../../../../core/widgets/common_app_bar.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Reset Password"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              controller: controller.newPasswordController,
              hint: "New Password",
              icon: Icons.lock_outline,
              obscure: true,
            ),

            const SizedBox(height: 16),

            CustomTextField(
              controller: controller.confirmPasswordController,
              hint: "Confirm Password",
              icon: Icons.lock_outline,
              obscure: true,
            ),

            const SizedBox(height: 24),

            Obx(() => AppButton(
              text: "Reset Password",
              loading: controller.isLoading.value,
              onPressed: controller.resetPassword,
            )),
          ],
        ),
      ),
    );
  }
}