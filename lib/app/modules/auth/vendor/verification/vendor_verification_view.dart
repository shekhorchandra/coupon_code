import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/modules/auth/vendor/verification/vendor_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VendorVerificationView extends GetView<VendorVerificationController> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              "Email Verification",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(color: Colors.grey, fontSize: 16),
                children: [
                  const TextSpan(text: "Enter the code sent to "),
                  TextSpan(
                    text: controller.email,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // OTP Input Field
            Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyDecorationWith(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
              onCompleted: (pin) => controller.otpCode.value = pin,
              onChanged: (pin) => controller.otpCode.value = pin,
            ),

            const SizedBox(height: 40),

            // Verify Button
            // SizedBox(
            //   width: double.infinity,
            //   height: 55,
            //   child: ElevatedButton(
            //     onPressed: controller.verifyOtp,
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.blueAccent,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //     ),
            //     child: const Text(
            //       "Verify",
            //       style: TextStyle(color: Colors.white, fontSize: 18),
            //     ),
            //   ),
            // ),
            AppButton(text: 'Verify', onPressed: controller.verifyOtp),

            const SizedBox(height: 20),

            // Resend Timer
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't receive code? "),
                  TextButton(
                    onPressed: controller.canResend.value
                        ? controller.resendOtp
                        : null,
                    child: Text(
                      controller.canResend.value
                          ? "Resend"
                          : "Resend in ${controller.secondsRemaining.value}s",
                      style: TextStyle(
                        color: controller.canResend.value
                            ? Colors.blue
                            : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
