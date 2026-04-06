import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DealPlanPurchaseSuccessView extends StatelessWidget {
  DealPlanPurchaseSuccessView({Key? key}) : super(key: key);

  final String planName = Get.arguments ?? "Your Plan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Success Icon
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.withOpacity(0.1),
                ),
                child: const Icon(Icons.check_circle, color: Colors.green, size: 80),
              ),

              const SizedBox(height: 30),

              // ✅ Title
              const Text(
                "Purchase Successful!",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              // ✅ Plan Name
              Text(
                "$planName plan has been activated successfully.",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),

              const SizedBox(height: 40),

              // ✅ Back to Home Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _refreshAllControllers();

                    // Navigate to home and remove all previous routes
                    Get.offAllNamed(AppRoutes.VENDOR_NAVIGATION_BAR);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    "Back to Home",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ Refresh all controllers
  void _refreshAllControllers() {
    // Option 1: Refresh specific controllers
    // Example:
    // Get.find<HomeController>().refreshData();

    // Option 2: Force recreate all controllers (recommended)
    Get.deleteAll(force: true);

    // If you use bindings, they will be reinitialized automatically
  }
}
