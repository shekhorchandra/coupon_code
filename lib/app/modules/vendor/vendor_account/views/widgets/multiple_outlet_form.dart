import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/vendor_account_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/views/widgets/add_outlet_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultipleOutletForm extends GetView<VendorAccountController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFA3A3A3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // List of Outlets
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.outlets.length,
                itemBuilder: (context, index) {
                  final item = controller.outlets[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FE),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.storefront_outlined, color: Color(0xFF4CB5C3)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${item['name']}: ",
                                  style: const TextStyle(
                                    color: Color(0xFF4CB5C3),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: item['address'],
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Delete Outlet Button
                        IconButton(
                          icon: Icon(Icons.delete_outline, color: Colors.red[300], size: 20),
                          onPressed: () {
                            // Confirmation Dialog
                            Get.defaultDialog(
                              title: "Remove Outlet",
                              middleText: "Are you sure you want to delete ${item['name']}?",
                              textConfirm: "Delete",
                              textCancel: "Cancel",
                              confirmTextColor: Colors.white,
                              buttonColor: Colors.red[500],
                              contentPadding: EdgeInsets.all(20),
                              onConfirm: () {
                                controller.removeOutlet(index);
                                Get.back();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // Add Outlet Button
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton.icon(
                onPressed: () => _showAddOutletSheet(context),
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  "Add Outlet",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF56C0CF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddOutletSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AddOutletForm(),
              const SizedBox(height: 20),

              // Save Button inside bottom sheet
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => controller.saveOutlet(),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF56C0CF)),
                  child: const Text("Confirm & Add Outlet", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }
}
