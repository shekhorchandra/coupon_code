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
            Obx(
                  () => CustomTextField(
                controller: controller.newPasswordController,
                hint: "New Password",
                icon: Icons.key,
                obscure: controller.obscureNewPassword.value,
                suffix: IconButton(
                  icon: Icon(
                    controller.obscureNewPassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: controller.toggleNewPassword,
                ),
              ),
            ),


            const SizedBox(height: 16),

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