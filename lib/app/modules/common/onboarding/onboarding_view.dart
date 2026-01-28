import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import 'onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.pages.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (context, index) {
                  final page = controller.pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex: 6, child: Image.asset(page['image']!, fit: BoxFit.contain)),
                        const SizedBox(height: 24),
                        Text(
                          page['title']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          page['subtitle']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  );
                },
              ),
            ),

            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.pages.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: controller.currentPage.value == index ? 34 : 20,
                    height: 4,
                    decoration: BoxDecoration(
                      color: controller.currentPage.value == index
                          ? AppColors.primary
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: controller.nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Obx(
                    () => Text(
                      controller.currentPage.value == controller.pages.length - 1
                          ? "Get Started"
                          : "Next",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.buttonText,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
