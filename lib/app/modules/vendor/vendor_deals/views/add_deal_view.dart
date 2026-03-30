import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_sizes.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/core/widgets/custom_dropdown_field.dart';
import 'package:coupon_code/app/core/widgets/custom_text_field.dart';
import 'package:coupon_code/app/core/widgets/section_heading.dart';
import 'package:coupon_code/app/data/models/deal_category_model.dart';
import 'package:coupon_code/app/data/models/deal_image_model.dart';
import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/controllers/vendor_deals_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/data/deal_plans.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/views/deal_publish_notice_view.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/views/widgets/multi_image_uploader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDealView extends StatefulWidget {
  const AddDealView({super.key, this.deal});

  final DealModel? deal;

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

  void _showOutletSelector(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Select Outlets"),
            const SizedBox(height: 15),
            Flexible(
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.outlets?.length,
                  itemBuilder: (context, index) {
                    final outlet = controller.outlets?[index];
                    final isSelected = controller.selectedOutlets?.contains(outlet);

                    return CheckboxListTile(
                      title: Text(outlet?.name ?? ""),
                      value: isSelected,
                      activeColor: AppColor.primary,
                      onChanged: (_) => controller.toggleOutlet(outlet!),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            AppButton(text: "Done", onPressed: () => Get.back()),
            const SizedBox(height: 10),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void _prefillData() {
    final deal = widget.deal;

    // If no deal is provided (Add New Deal), clear all fields
    if (deal == null) {
      // Logo as thumbnail
      controller.fetchShopLogoAndOutlets();

      controller.titleController.clear();
      controller.selectedCategory.value = '';
      // TODO: fix this
      // controller.selectedOutlets?.assignAll(deal?.selectedOutlets ?? []);
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
      controller.images.clear();
      controller.currentImageIndex.value = 0;
    } else {
      // Prefill data for updating
      controller.titleController.text = deal.title;
      controller.selectedCategory.value = deal.categoryId;
      controller.highlightController.value = deal.highlights;
      controller.descController.text = deal.description;
      controller.couponController.text = '';
      controller.priceController.text = deal.regular_price.toString();
      controller.discountController.text = deal.discountPercent.toStringAsFixed(2);
      controller.finalPriceController.text = DealModel.afterDiscountPrice(
        deal.regular_price ?? deal.originalPrice,
        deal.discountPercent,
      ).toStringAsFixed(2);
      controller.currentImageIndex.value = 0;
      controller.images.value = deal.images.asMap().entries.map((entry) {
        int index = entry.key;
        String url = entry.value;

        return DealImageModel(
          url: url,
          isThumbnail: index == 0, // Set first image as thumbnail
        );
      }).toList();
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
                'You can upload up to 2 images to showcase your deal.',
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

              Text('Discount/Promo', style: AppText.body1.semiBold),
              const SizedBox(height: 10),
              Obx(() {
                return CustomDropdownField<String>(
                  hint: 'Select coupon type',
                  value: controller.selectedCouponType.value,
                  items: controller.couponTypes,
                  itemLabel: (item) => item,
                  onChanged: (value) {
                    controller.selectedCouponType.value = value ?? 'Select Discount/Promo';
                  },
                );
              }),

              const SizedBox(height: 10),

              Obx(() {
                // Show TextField if 'Coupon Code' is selected
                if (controller.selectedCouponType.value == 'Coupon Code') {
                  return CustomTextField(
                    hint: 'e.g. 50%OFF',
                    controller: controller.couponController,
                  );
                }
                // Show Image Uploader if 'QR Code' or 'Barcode' is selected
                else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upload ${controller.selectedCouponType.value} Image',
                        style: AppText.body1.semiBold,
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: controller.pickCouponImage,
                        child: Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey[300]!, width: 1),
                          ),
                          child: controller.couponImageFile.value != null
                              ? Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.file(
                                        controller.couponImageFile.value!,
                                        width: double.infinity,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Positioned(
                                      right: 8,
                                      top: 8,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 15,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: const Icon(
                                            Icons.close,
                                            size: 18,
                                            color: Colors.red,
                                          ),
                                          onPressed: () => controller.couponImageFile.value = null,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.qr_code_scanner_rounded,
                                      size: 40,
                                      color: Colors.grey[400],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Tap to upload ${controller.selectedCouponType.value}",
                                      style: TextStyle(color: Colors.grey[600]),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  );
                }
              }),
              const SizedBox(height: 20),

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

              // Text('Select Outlet', style: AppText.body1.semiBold),
              // const SizedBox(height: 5),
              // Obx(() {
              //   final selected = controller.outlets
              //       .where((outlet) => outlet == controller.selectedOutlet?.value)
              //       .toList();

              //   return CustomDropdownField<Outlets>(
              //     hint: 'Select an outlet',
              //     value: selected.isNotEmpty ? selected.first : null,
              //     items: controller.outlets,
              //     itemLabel: (item) =>
              //         '${item.name ?? ''}${item.name == null ? '' : ' ('}${item.address})',
              //     onChanged: (value) {
              //       controller.selectedOutlet?.value = value ?? Outlets();
              //     },
              //   );
              // }),
              // const SizedBox(height: 10),
              Text('Select Outlets', style: AppText.body1.semiBold),
              const SizedBox(height: 5),

              Obx(
                () => InkWell(
                  onTap: () => _showOutletSelector(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.bw.s300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (controller.selectedOutlets!.isEmpty) Text("Tap to select outlets"),

                        // Show selected outlets as Chips
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: controller.selectedOutlets!.map((outlet) {
                            return Chip(
                              label: Text(outlet.name!),
                              onDeleted: () => controller.toggleOutlet(outlet),
                              backgroundColor: AppColor.primary.withOpacity(0.1),
                              deleteIcon: const Icon(Icons.cancel, size: 16),
                            );
                          }).toList(),
                        ),

                        // Indicator icon
                        if (controller.selectedOutlets!.isNotEmpty) const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.add_circle_outline, color: AppColor.primary, size: 20),
                            const SizedBox(width: 4),
                            Text(
                              "Add/Edit",
                              style: AppText.body2.semiBold.copyWith(color: AppColor.primary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
                hint: 'Enter Deal Description',
                controller: controller.descController,
                maxLength: 500,
                maxLines: 5,
              ),
              const SizedBox(height: 10),

              Text('Tags', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hint: 'Enter tag (e.g. Halloween)',
                      controller: controller.tagController,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary),
                    onPressed: () => controller.addTag(controller.tagController.text),
                    child: const Text('Add', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Obx(
                () => Wrap(
                  spacing: 8,
                  children: controller.tags.asMap().entries.map((entry) {
                    return Chip(
                      label: Text(entry.value),
                      deleteIcon: const Icon(Icons.close, size: 16),
                      onDeleted: () => controller.removeTag(entry.key),
                      backgroundColor: AppColor.bw.s100,
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),

              // Deal Pricing
              SectionHeading(title: 'Deal Pricing'),
              const SizedBox(height: 10),

              Text('Regular Price', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: 'Enter Regular Price',
                icon: Icons.attach_money_rounded,
                controller: controller.priceController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),

              Text('Discount Percentage', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: 'Enter Discount Percentage (e.g.: 25)',
                controller: controller.discountController,
                keyboardType: TextInputType.number,
                suffix: Icon(Icons.percent_rounded),
              ),
              const SizedBox(height: 10),

              Text('Final Price After Discount', style: AppText.body1.semiBold),
              const SizedBox(height: 5),
              CustomTextField(
                hint: 'Enter Sale Price',
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
          final buttonText = widget.deal != null ? 'Update' : 'Submit';

          return AppButton(
            text: buttonText,
            loading: controller.isLoading.value,
            onPressed: () async {
              final bool formValidationSuccess = controller.validateForm();

              if (formValidationSuccess) {
                await showDialog(context: context, builder: (context) => DealPublishNoticeView());
              }

              if (!controller.acceptedTnC.value) {
                controller.hasError.value = true;
              }

              if (!controller.hasError.value && controller.acceptedTnC.value) {
                await controller.publishDeal();
              }
            },
          );
        }),
      ),
    );
  }
}
