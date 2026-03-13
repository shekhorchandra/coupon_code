// vendor_details_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/widgets/common_app_bar.dart';
import '../../../../../core/widgets/App_button.dart';
import '../../../../../core/values/app_color.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../routes/app_routes.dart';
import '../controller/vendor_details_controller.dart';

class VendorDetailsView extends GetView<VendorDetailsController> {
  const VendorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonAppBar(title: 'Vendor Details'),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator( color: AppColor.primary,));
          }

          final vendor = controller.vendor.value;
          if (vendor == null) {
            return const Center(child: Text("Vendor not found"));
          }
          return Column(
            children: [
              /// Business Logo
              ClipOval(
                child: Image.network(
                  vendor.businessLogo,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,

                  /// Loading Indicator
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return Container(
                      width: 70,
                      height: 70,
                      alignment: Alignment.center,
                      color: AppColor.greyText,
                      child: const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: AppColor.primary,),
                      ),
                    );
                  },

                  /// Error Widget
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 70,
                      height: 70,
                      color: AppColor.greyText,
                      alignment: Alignment.center,
                      child: const Icon(Icons.store),
                    );
                  },
                ),
              ),

              /// Vendor Name
              Text(vendor.businessName, style: AppTextStyles.MenuTitle),

              /// Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(vendor.description, style: AppTextStyles.Text),
              ),

              /// Tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _tabButton("Active Deals", 0),
                  _tabButton("Address & Location", 1),
                ],
              ),

              /// Tab Content
              Expanded(
                child: RefreshIndicator(
                  color: AppColor.primary,
                  onRefresh: () async {
                    await controller.fetchVendorDetails(); // your reload API
                  },
                  child: Obx(() {
                    return controller.selectedTab.value == 0
                        ? _activeDeals()
                        : _addressLocation();
                  }),
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  Widget _tabButton(String title, int index) {
    return Obx(() {
      final isSelected = controller.selectedTab.value == index;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
            isSelected ? AppColor.vividSky.s300 : const Color(0xFFD4D4D4),
          ),
          onPressed: () => controller.changeTab(index),
          child: Text(title,
              style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
        ),
      );
    });
  }

  Widget _activeDeals() {
    final vendor = controller.vendor.value!;
    if (vendor.deals.isEmpty) return const Center(child: Text("No Deals Available"));

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      itemCount: vendor.deals.length,
      itemBuilder: (_, index) {
        final deal = vendor.deals[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// DEAL IMAGES
              if (deal.images.isNotEmpty)
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: deal.images.length,
                    itemBuilder: (_, imgIndex) =>
                        Image.network(deal.images[imgIndex], fit: BoxFit.cover),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.all(4),
                child: Text(deal.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("\$${deal.price}",
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 8),
                        Text("\$${deal.originalPrice}",
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey)),
                        const Spacer(),
                        if (deal.isPromoted)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(deal.remainingTime,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange)),
                          )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppButton(
                        width: double.infinity,
                          text: "Redeem Now",
                          height: 32,
                          onPressed: () {
                            Get.toNamed(AppRoutes.DISCOVERDETAILS,
                                arguments: {'id': deal.id});
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _addressLocation() {
    final vendor = controller.vendor.value!;
    if (vendor.outlets.isEmpty) return const Center(child: Text("No Outlets"));

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          /// OUTLETS
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Outlets Address",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary)),
                const SizedBox(height: 8),
                Column(
                  children: vendor.outlets.asMap().entries.map((entry) {
                    int index = entry.key;
                    final outlet = entry.value;
                    bool isSelected =
                        controller.selectedOutlet.value?.id == outlet.id;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: AppButton(
                        onPressed: () => controller.selectOutlet(outlet),
                        text: "Outlet ${index + 1}\n${outlet.name}",
                        backgroundColor:
                        isSelected ? AppColor.primary : Colors.grey.shade200,
                        textColor: isSelected ? Colors.white : Colors.black,
                        height: 60,
                        width: double.infinity,
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),

          /// MAP LOCATION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Map Location",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary)),
                const SizedBox(height: 8),
                Obx(() {
                  final outlet = controller.selectedOutlet.value;
                  return Container(
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade300),
                    child: Center(
                        child: Text(
                          outlet != null
                              ? "${outlet.name}\nLat: ${outlet.lat}, Lng: ${outlet.lng}"
                              : "Select an outlet",
                          textAlign: TextAlign.center,
                        )),
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}