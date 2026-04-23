import 'package:coupon_code/app/data/models/shop_model.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/vendor_account_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/views/widgets/add_outlet_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleOutletForm extends GetView<VendorAccountController> {
  SingleOutletForm({super.key, this.outlets});

  final List<dynamic>? outlets;

  @override
  Widget build(BuildContext context) {
    // Check if outlets is not empty before accessing the first element
    if (outlets != null && outlets!.isNotEmpty) {
      return Column(children: [AddOutletForm(outlet: outlets?.first ?? Outlets())]);
    }

    // Handle the case when outlets is empty or null
    return Column(children: [AddOutletForm()]);
  }
}
