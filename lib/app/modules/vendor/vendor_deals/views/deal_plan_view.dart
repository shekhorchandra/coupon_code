import 'package:coupon_code/app/core/values/app_sizes.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/core/widgets/section_heading.dart';
import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:coupon_code/app/data/models/deal_plan_model.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/controllers/vendor_deals_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/data/deal_plans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DealPlanView extends StatefulWidget {
  const DealPlanView({super.key, this.deal});

  final DealModel? deal;

  @override
  State<DealPlanView> createState() => _DealPlanViewState();
}

class _DealPlanViewState extends State<DealPlanView> {
  final VendorDealsController controller = Get.find();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _prefillData();
    });

    super.initState();
  }

  void _prefillData() {
    final deal = widget.deal;

    if (deal != null) {
      // Prefill data for updating
      controller.titleController.text = deal.title;
      controller.selectedCategory.value = deal.categoryId;
      controller.highlightController.value = deal.highlights;
      controller.descController.text = deal.description;
      controller.couponController.text = deal.coupon ?? '';
      controller.priceController.text = deal.regular_price.toString();
      controller.discountController.text = deal.discountPercent.toStringAsFixed(2);
      controller.finalPriceController.text = DealModel.afterDiscountPrice(
        deal.regular_price ?? deal.originalPrice,
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
              // Deal Plan
              SectionHeading(title: 'Deal Plan:'),
              SizedBox(height: 10),

              _dealPlan(dealPlan: dealPlans[0], color: Color(0xFFF6741C)),
              _dealPlan(dealPlan: dealPlans[1], color: Color(0xFF2F6ED8)),
              _dealPlan(dealPlan: dealPlans[2], color: Color(0xFF63A043)),

              // TODO: add outlet validity
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 25.0, left: 20, right: 20),
        child: Obx(() {
          final plan = controller.selectedDealPlan.value;

          final buttonText = widget.deal != null
              ? 'Update'
              : 'Continue with ${plan?.name} / \$${plan?.price.toStringAsFixed(0)}';

          return AppButton(
            text: buttonText,
            onPressed: () {
              controller.validateForm();

              if (!controller.hasError.value) {
                // Get.toNamed(
                //   AppRoutes.DISCOVERDETAILS,
                //   arguments: {'dealItem': controller.deal.value, 'isNetworkImage': false},
                // );

                Get.snackbar('Info', 'Yoo! Publishing the deal!');
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
