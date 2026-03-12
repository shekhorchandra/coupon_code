import 'dart:developer';

import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/custom_text_field.dart';
import 'package:coupon_code/app/data/models/shop_model.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/vendor_account_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddOutletForm extends GetView<VendorAccountController> {
  AddOutletForm({super.key, this.outlet});

  final Outlets? outlet;

  @override
  Widget build(BuildContext context) {
    // For updating the shop
    inspect(outlet);
    if (outlet != null) {
      controller.businessAddressController.text = outlet?.address ?? '';

      // Safe checking for outlet coordinates
      if (outlet?.location?.coordinates?.isNotEmpty ?? false) {
        controller.pickedLng.value = outlet?.location?.coordinates?[0] as double;
        controller.pickedLat.value = outlet?.location?.coordinates?[1] as double;
      } else {
        controller.pickedLng.value = -74.0060; // Default longitude if empty
        controller.pickedLat.value = 40.7128; // Default latitude if empty
      }

      controller.zipCodeController.text = outlet?.zipCode ?? '';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Business Address', style: AppText.body1.semiBold),
        const SizedBox(height: 5),
        CustomTextField(
          hint: 'e.g.: Shop Name, Street, City, Country',
          controller: controller.businessAddressController,
          icon: Icons.pin_drop_outlined,
        ),
        const SizedBox(height: 10),

        Text('Business Location', style: AppText.body1.semiBold),
        const SizedBox(height: 10),
        Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.border, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Obx(
              () => GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(controller.pickedLat.value, controller.pickedLng.value),
                  zoom: 15,
                ),
                markers: controller.markers.toList().toSet(),
                onTap: (LatLng pos) => controller.updateLocation(pos),
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                myLocationButtonEnabled: false,

                // Ensures tap works inside scrollable views
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                  Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),

        const SizedBox(height: 10),

        Text('Zip Code', style: AppText.body1.semiBold),
        const SizedBox(height: 5),
        CustomTextField(
          hint: 'Enter your zip code',
          controller: controller.zipCodeController,
          icon: Icons.numbers_rounded,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
