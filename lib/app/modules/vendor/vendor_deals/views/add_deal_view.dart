import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_sizes.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/core/widgets/custom_dropdown_field.dart';
import 'package:coupon_code/app/core/widgets/custom_text_field.dart';
import 'package:coupon_code/app/core/widgets/section_heading.dart';
import 'package:coupon_code/app/data/models/deal_category_model.dart';
import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:coupon_code/app/data/models/deal_model_dto.dart';
import 'package:coupon_code/app/data/models/deal_plan_model.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/controllers/vendor_deals_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/data/deal_plans.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/views/widgets/multi_image_uploader.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDealView extends StatefulWidget {
  const AddDealView({super.key, this.deal});

  final DealModelDTO? deal;

  @override
  State<AddDealView> createState() => _AddDealViewState();
}

class _AddDealViewState extends State<AddDealView> {
  final VendorDealsController controller = Get.find();

  @override
  void initState() {
    super.initState();
    _prefillData();
  }

  void _prefillData() {
    final deal = widget.deal;

    // If no deal is provided (Add New Deal), clear all fields
    if (deal == null) {
      controller.titleController.clear();
      controller.selectedCategory.value = '';
      controller.highlightController.clear();
      controller.descController.clear();
      controller.couponController.clear();
      controller.priceController.clear();
      controller.discountController.clear();
      controller.finalPriceController.clear();
      controller.selectedValidityRange.value = DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now(),
      ); // Default date range
      controller.acceptedTnC.value = false;
      controller.selectedDealPlan.value = dealPlans[2];
    } else {
      // Prefill data for updating
      controller.titleController.text = deal.title;
      controller.selectedCategory.value = deal.categoryId;
      controller.highlightController.value = deal.highlights;
      controller.descController.text = deal.description;
      controller.couponController.text = '';
      controller.priceController.text = deal.regularPrice.toString();
      controller.discountController.text = deal.discountPercent.toStringAsFixed(2);
      controller.finalPriceController.text = DealModel.afterDiscountPrice(
        deal.regularPrice,
        deal.discountPercent,
      ).toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: widget.deal != null ? 'Update Deal' : 'Add New Deal'),

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

              // TODO: Add Category
              Text('Category', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              Obx(() {
                final selected = controller.categories
                    .where(
                      (category) => category.id.toString() == controller.selectedCategory.value,
                    )
                    .toList();

                return CustomDropdownField<DealCategoryModel>(
                  hint: 'Select a category',
                  value: selected.isNotEmpty ? selected.first : null,
                  items: controller.categories,
                  itemLabel: (item) => item.categoryName,
                  onChanged: (value) {
                    controller.selectedCategory.value = value?.id.toString() ?? '';
                  },
                );
              }),
              const SizedBox(height: 10),

              // TODO: fix this
              // Text('Highlights', style: AppText.body1.semiBold),
              // const SizedBox(height: 5),
              // CustomTextField(
              //   hint: 'Product Highlights',
              //   controller: controller.highlightController,
              //   maxLength: 100,
              //   maxLines: 5,
              // ),
              // const SizedBox(height: 10),
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
                hint: '20',
                controller: controller.discountController,
                keyboardType: TextInputType.number,
                suffix: Icon(Icons.percent_rounded),
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

              // Note
              Text(
                '⚠️ Note: To ensure fairness and prevent misuse, you can only edit your deal within 30 minutes after publishing. This helps maintain consistency and transparency for all users. After the 30-minute window, editing will no longer be allowed.',
                style: AppText.body2.medium,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 25.0, left: 20, right: 20),
        child: Obx(() {
          final plan = controller.selectedDealPlan.value;

          final buttonText = widget.deal != null ? 'Update' : 'Submit';

          return AppButton(
            text: buttonText,
            onPressed: () {
              controller.validateAndSubmit();

              if (!controller.hasError.value) {
                Get.toNamed(
                  AppRoutes.DEAL_PLAN,
                  arguments: {'dealItem': controller.deal.value, 'isNetworkImage': false},
                );
              }
            },
          );
        }),
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
