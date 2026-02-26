import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/custom_text_field.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/vendor_account_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddOutletForm extends GetView<VendorAccountController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
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
                initialCameraPosition: const CameraPosition(
                  target: LatLng(43.681860431388685, -79.6277716755867),
                  zoom: 5,
                ),
                markers: controller.markers.toList().toSet(),
                onTap: (LatLng pos) => controller.updateLocation(pos),
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,

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
