import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorAccountController extends GetxController {
  VendorAccountController();

  // Text Controllers
  final businessNameController = TextEditingController(text: '');
  final businessDescriptionController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final phoneNumberController = TextEditingController(text: '');
  final websiteLinkController = TextEditingController(text: '');
  final businessAddressController = TextEditingController(text: '');
  final zipCodeController = TextEditingController(text: '');

  @override
  void dispose() {
    businessNameController.dispose();
    businessDescriptionController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    websiteLinkController.dispose();
    businessAddressController.dispose();
    zipCodeController.dispose();

    super.dispose();
  }

  // Outlet Tab Controller
  Rx<int> selectedTab = 0.obs;

  void setTab(int value) {
    selectedTab.value = value;
  }
}
