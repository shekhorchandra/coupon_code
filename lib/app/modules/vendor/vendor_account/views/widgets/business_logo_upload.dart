import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/vendor_account_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessLogoUpload extends GetView<VendorAccountController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => DottedBorder(
            options: RoundedRectDottedBorderOptions(
              radius: Radius.circular(10),
              color: Colors.grey.shade400,
              strokeWidth: 1.5,
              dashPattern: [6, 3],
            ),

            child: GestureDetector(
              onTap: () => controller.pickImage(),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: controller.selectedImage.value != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: Image.file(controller.selectedImage.value!, fit: BoxFit.cover),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.add, color: Colors.grey),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Upload Photos",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "JPEG or PNG  max 10 MB",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: AppButton(
                  text: 'Upload business logo',
                  onPressed: () => controller.pickImage(),
                  icon: Icons.add,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
