import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_sizes.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/core/widgets/custom_date_range_selector.dart';
import 'package:coupon_code/app/core/widgets/custom_dropdown_field.dart';
import 'package:coupon_code/app/core/widgets/custom_text_field.dart';
import 'package:coupon_code/app/core/widgets/section_heading.dart';
import 'package:coupon_code/app/data/models/deal_category_model.dart';
import 'package:coupon_code/app/data/models/deal_plan_model.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/controllers/vendor_deals_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/data/deal_plans.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/views/widgets/multi_image_uploader.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDealView extends GetView<VendorDealsController> {
  const AddDealView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Add New Deal'),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSizes.screenPadding),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              // Header
              SectionHeading(title: 'Media:'),
              Text(
                'You can upload up to 6 images to showcase your deal.',
                style: AppText.body2.medium.copyWith(color: AppColor.bw.s500),
              ),
              const SizedBox(height: 12),

              // Image Upload
              MultiImageUploader(),
              const SizedBox(height: 20),

              // Deal Info
              SectionHeading(title: 'Deal Info:'),
              const SizedBox(height: 10),

              Text('Deal Title', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(hint: 'Title', controller: controller.titleController),
              const SizedBox(height: 10),

              Text('Category', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              Obx(
                () => CustomDropdownField<DealCategoryModel>(
                  hint: 'Select a category',
                  value: controller.selectedCategory.value.id == -1
                      ? null
                      : controller.selectedCategory.value,
                  items: controller.categories,
                  itemLabel: (item) => item.name,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedCategory.value = value;
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),

              Text('Highlights', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: 'Product Highlights',
                controller: controller.highlightController,
                maxLength: 100,
                maxLines: 5,
              ),
              const SizedBox(height: 10),

              Text('Description', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: 'Product Description',
                controller: controller.descController,
                maxLength: 500,
                maxLines: 5,
              ),
              const SizedBox(height: 10),

              Text('Coupon Code', style: AppText.body1.semiBold),
              Text(
                'Enter a coupon code that users can redeem to access your deal.',
                style: AppText.body2.medium.copyWith(color: AppColor.bw.s500),
              ),
              const SizedBox(height: 5),
              CustomTextField(hint: 'Coupon Code', controller: controller.couponController),
              const SizedBox(height: 20),

              // Deal Pricing
              SectionHeading(title: 'Deal Pricing'),
              const SizedBox(height: 10),

              Text('Regular Price', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: '50',
                icon: Icons.attach_money_rounded,
                controller: controller.priceController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),

              Text('Discount Percentage', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: '20%',
                controller: controller.discountController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),

              Text('Final Price After Discount', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: '40',
                icon: Icons.attach_money_rounded,
                controller: controller.finalPriceController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),

              // Deal Plan
              SectionHeading(title: 'Deal Plan:'),
              SizedBox(height: 10),

              _dealPlan(dealPlan: dealPlans[0], color: Color(0xFFF6741C)),
              _dealPlan(dealPlan: dealPlans[1], color: Color(0xFF2F6ED8)),
              _dealPlan(dealPlan: dealPlans[2], color: Color(0xFF63A043)),

              Text('Validity', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomDateRangeSelector(selectedRange: controller.selectedValidityRange),
              const SizedBox(height: 20),

              // Note
              Text(
                '⚠️ Note: To ensure fairness and prevent misuse, you can only edit your deal within 30 minutes after publishing. This helps maintain consistency and transparency for all users. After the 30-minute window, editing will no longer be allowed.',
                style: AppText.body2.medium,
              ),
              const SizedBox(height: 20),

              // T&C
              Obx(
                () => Row(
                  children: [
                    Checkbox(
                      value: controller.acceptedTnC.value,
                      onChanged: (status) => controller.acceptedTnC.value = status ?? false,
                    ),

                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'I acknowledge and agree to the ',
                            style: AppText.body2.regular.copyWith(color: AppColor.bw.s800),
                          ),

                          TextSpan(
                            text: 'Terms and Conditions.',
                            style: AppText.body2.regular.copyWith(color: AppColor.primary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(AppRoutes.TERMSCONDITION);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 25.0, left: 20, right: 20),
        child: Obx(
          () => AppButton(
            text:
                'Continue with ${controller.selectedDealPlan.value?.name} / \$${controller.selectedDealPlan.value?.price.toStringAsFixed(0)}',
            onPressed: () {
              controller.validateAndSubmit();

              if (!controller.hasError.value) {
                Get.toNamed(
                  AppRoutes.DISCOVERDETAILS,
                  arguments: {'dealItem': controller.deal.value, 'isNetworkImage': false},
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _dealPlan({required DealPlanModel dealPlan, required Color color}) {
    return Obx(() {
      bool isSelected = controller.selectedDealPlan.value?.id == dealPlan.id;
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            controller.selectedDealPlan.value = dealPlan;
          },
          child: Container(
            decoration: BoxDecoration(
              color: color.withAlpha(15),
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Row(
                  children: [
                    if (dealPlan.icon != null) Image.asset(dealPlan.icon!),
                    const SizedBox(width: 10),

                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(dealPlan.name, style: AppText.body2.bold),
                        if (dealPlan.description != null)
                          Text(dealPlan.description!, style: AppText.body2.medium),
                      ],
                    ),
                  ],
                ),

                Row(
                  children: [
                    Text(
                      '\$${dealPlan.price.toStringAsFixed(0)}',
                      style: AppText.h5.bold.copyWith(color: color),
                    ),
                    const SizedBox(width: 10),

                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: color, width: 2),
                        color: isSelected ? color : Colors.transparent,
                      ),
                      child: isSelected
                          ? const Icon(Icons.check, size: 16, color: Colors.white)
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
