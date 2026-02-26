import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/vendor_account_controller.dart';
import 'package:coupon_code/app/modules/vendor/vendor_account/views/widgets/add_outlet_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleOutletForm extends GetView<VendorAccountController> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [AddOutletForm()]);
  }
}
