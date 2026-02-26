import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/core/widgets/custom_text_field.dart';
import 'package:coupon_code/app/core/widgets/section_heading.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/vendor_account_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/views/widgets/business_logo_upload.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/views/widgets/multiple_outlet_form.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/views/widgets/single_outlet_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CreateVendorAccountPage extends GetView<VendorAccountController> {
  const CreateVendorAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Create Your Vendor Account', showBack: false),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              // Subtitle
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Set up your business profile and start offering amazing deals to customers.',
                    textAlign: .center,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// Business Details
              SectionHeading(title: 'Business Details'),
              const SizedBox(height: 20),

              Text('Business Name', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: 'Enter your business name',
                controller: controller.businessNameController,
                icon: Iconsax.shop_copy,
              ),
              const SizedBox(height: 10),

              Text('Business Logo', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              BusinessLogoUpload(),
              const SizedBox(height: 10),

              Text('Description (Optional)', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: 'Business description',
                controller: controller.businessDescriptionController,
                maxLength: 100,
                maxLines: 4,
              ),
              const SizedBox(height: 10),

              /// Business Details
              SectionHeading(title: 'Contact Information'),
              const SizedBox(height: 20),

              Text('Email', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: 'Enter your email address',
                controller: controller.businessDescriptionController,
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 10),

              Text('Phone Number', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: 'Enter your phone number',
                controller: controller.businessDescriptionController,
                icon: Iconsax.call_copy,
              ),
              const SizedBox(height: 10),

              /// Location Details
              SectionHeading(title: 'Location Details'),
              Text(
                'If you have a single outlet, continue with the flow; if you have multiple outlets, click "Multiple Outlet" and add each outlet with its address and location.',
              ),
              const SizedBox(height: 20),

              Obx(
                () => Row(
                  children: [
                    // Single Outlet Tab
                    GestureDetector(
                      onTap: () => controller.setTab(0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: controller.selectedTab.value == 0
                              ? AppColor.vividSky.s300
                              : Colors.transparent,
                          border: Border.all(
                            color: controller.selectedTab.value == 1
                                ? AppColor.border
                                : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          "Single Outlet",
                          style: AppText.body1.semiBold.copyWith(
                            color: controller.selectedTab.value == 0
                                ? AppColor.white
                                : AppColor.bw.s400,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Multiple Outlet Tab
                    GestureDetector(
                      onTap: () => controller.setTab(1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: controller.selectedTab.value == 1
                              ? AppColor.vividSky.s300
                              : Colors.transparent,
                          border: Border.all(
                            color: controller.selectedTab.value == 0
                                ? AppColor.border
                                : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Multiple Outlets",
                          style: AppText.body1.semiBold.copyWith(
                            color: controller.selectedTab.value == 1
                                ? AppColor.white
                                : AppColor.bw.s400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // Show selected tab view
              Obx(
                () => Row(
                  children: [
                    if (controller.selectedTab.value == 0) Expanded(child: SingleOutletForm()),
                    if (controller.selectedTab.value == 1) Expanded(child: MultipleOutletForm()),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Text('Website Link (Optional)', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: 'Enter your website link',
                controller: controller.websiteLinkController,
                icon: Icons.language,
              ),
              const SizedBox(height: 30),

              AppButton(text: 'Submit for Approval', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
