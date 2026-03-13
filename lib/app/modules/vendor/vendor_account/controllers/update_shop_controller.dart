import 'dart:io';

import 'package:coupon_code/app/data/models/shop_model.dart';
import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateShopController extends GetxController {
  DioClient _dioClient = DioClient();
  Rx<ShopModel> shop = ShopModel().obs;
  final RxBool isLoading = false.obs;

  // Text Controllers
  final name = TextEditingController();
  final logo = TextEditingController();
  final description = TextEditingController();
  final email = TextEditingController();
  Rx<BusinessPhone> countryCode = BusinessPhone().obs;
  final phoneNumber = TextEditingController();
  final List<Outlets> outlets = [];
  final website = TextEditingController();
  // Outlet Tab Controller
  Rx<int> selectedTab = 0.obs;

  // Logo Update
  Rx<File?> selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    clearFields();
  }

  // Clear the form fields
  void clearFields() {
    name.clear();
    logo.clear();
    description.clear();
    email.clear();
    countryCode.value.countryCode = null;
    countryCode.value.phoneNumber = null;
    website.clear();
  }

  void setTab(int value) {
    selectedTab.value = value;
    outlets.clear();
  }

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  // Fetch shop details from the API
  Future<bool> fetchShopDetails(String? myId) async {
    isLoading.value = true;

    try {
      // Fetch shop details from API
      final response = await _dioClient.client.get(
        ApiConstants.shopDetails,
        queryParameters: {'myId': myId},
      );

      // Handle the response
      if (response.statusCode == 200) {
        shop.value = ShopModel.fromJson(response.data['data']);
        updateFormFields(shop.value); // Bind the data to the text controllers
        return true;
      } else {
        Get.snackbar('Error', 'Failed to fetch shop details!');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong! Error: $e');
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Update form fields with fetched data
  void updateFormFields(ShopModel shopData) {
    name.text = shopData.businessName ?? '';
    // logo.text = shopData.businessLogo ?? '';
    description.text = shopData.description ?? '';
    email.text = shopData.businessEmail ?? '';
    website.text = shopData.website ?? '';
    if (shopData.businessPhone != null) {
      countryCode.value.countryCode = shopData.businessPhone?.countryCode;
      countryCode.value.phoneNumber = shopData.businessPhone?.phoneNumber;
    }
    phoneNumber.text = countryCode.value.phoneNumber ?? '';
    outlets.clear();
    if (shopData.outlets != null) {
      outlets.addAll(shopData.outlets!);
    }
  }

  // Update shop details
  Future<bool> updateShopDetails() async {
    isLoading.value = true;

    try {
      final response = await _dioClient.client.patch(
        ApiConstants.updateShop(shop.value.sId!),
        data: {
          'business_name': name.text,
          // 'business_logo': logo.text,
          'description': description.text,
          'business_email': email.text,
          'business_phone': {
            "country_code": countryCode.value.countryCode,
            "phone_number": phoneNumber.text,
          },
          'website': website.text,
          // 'outlets': outlets.map((outlet) => outlet.toJson()).toList(),
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Shop details updated successfully!');
        return true;
      } else {
        Get.snackbar('Error', 'Failed to update shop details!');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong while updating! Error: $e');
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
