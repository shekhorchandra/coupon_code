import 'package:country_code_picker/country_code_picker.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/core/widgets/custom_text_field.dart';
import 'package:coupon_code/app/core/widgets/section_heading.dart';
import 'package:coupon_code/app/data/services/storage_service.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/update_shop_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/views/widgets/business_logo_upload.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/views/widgets/multiple_outlet_form.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/views/widgets/single_outlet_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class UpdateShopView extends GetView<UpdateShopController> {
  UpdateShopView({super.key});

  @override
  Widget build(BuildContext context) {
    StorageService _storageService = StorageService();
    final String? myId = _storageService.userId;

    if (myId == null) {
      return Scaffold(
        appBar: CommonAppBar(title: 'Error', showBack: true),
        body: Center(child: Text('Shop not found!')),
      );
    } else {
      controller.fetchShopDetails(myId);
    }

    return Scaffold(
      appBar: CommonAppBar(title: 'Update Your Vendor Account', showBack: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Business Details
              SectionHeading(title: 'Business Details'),
              const SizedBox(height: 20),

              Text('Business Name', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: 'Enter your business name',
                controller: controller.name, // Bind to the name controller
                icon: Iconsax.shop_copy,
              ),
              const SizedBox(height: 10),

              Text('Business Logo', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              BusinessLogoUpload(), // Custom widget for uploading logo
              const SizedBox(height: 10),

              Text('Description', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: 'Business description',
                controller: controller.description,
                maxLength: 100,
                maxLines: 4,
              ),
              const SizedBox(height: 10),

              // Contact Information Section
              SectionHeading(title: 'Contact Information'),
              const SizedBox(height: 20),

              Text('Email', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: 'Enter your email address',
                controller: controller.email,
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 10),

              Text('Phone Number', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              Obx(
                () => Row(
                  children: [
                    if (!controller.isLoading.value)
                      CountryCodePicker(
                        boxDecoration: BoxDecoration(
                          border: Border.all(color: AppColor.border, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        initialSelection: controller.countryCode.value.countryCode,
                        onChanged: (value) {
                          controller.countryCode.value.countryCode = value.dialCode;
                        },
                      ),
                    Expanded(
                      child: CustomTextField(
                        hint: 'Enter your phone number',
                        controller: controller.phoneNumber,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Location Details Section
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
                    if (controller.selectedTab.value == 0)
                      Expanded(
                        child: SingleOutletForm(outlets: controller.shop.value.outlets),
                      ), // Single Outlet form
                    if (controller.selectedTab.value == 1)
                      Expanded(
                        child: MultipleOutletForm(outlets: controller.shop.value.outlets),
                      ), // Multiple Outlet form
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Text('Website Link (Optional)', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: 'Enter your website link',
                controller: controller.website, // Bind to the website controller
                icon: Icons.language,
              ),
              const SizedBox(height: 30),

              AppButton(
                text: 'Update',
                onPressed: () =>
                    controller.updateShopDetails(), // Update shop details on button press
              ),
            ],
          ),
        ),
      ),
    );
  }
}
