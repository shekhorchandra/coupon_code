import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/widgets/App_button.dart';
import '../../../../../core/widgets/common_app_bar.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../controllers/otp_controller.dart';

class OtpVerificationView extends GetView<OtpController> {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Verify OTP"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Enter OTP sent to your email",
                style: TextStyle(fontSize: 16)),

            const SizedBox(height: 20),

            CustomTextField(
              controller: controller.otpController,
              hint: "Enter OTP",
              icon: Icons.lock_outline,
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 24),

            Obx(() => AppButton(
              text: "Verify OTP",
              loading: controller.isLoading.value,
              onPressed: controller.verifyOtp,
            )),
          ],
        ),
      ),
    );
  }
}