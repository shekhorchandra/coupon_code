import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class VendorAccountController extends GetxController {
  VendorAccountController();

  // Text Controllers
  final businessNameController = TextEditingController(text: '');
  final businessDescriptionController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final countryCodeController = TextEditingController(text: '');
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

    // Clear All The Fields
    pickedLat.value = 0.0;
    pickedLng.value = 0.0;
    markers.clear();
    outlets.clear();
  }

  /// Business Logo
  // Variables
  var selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (image != null) {
      File file = File(image.path);

      // Size check (10 MB limit)
      int sizeInBytes = await file.length();
      double sizeInMb = sizeInBytes / (1024 * 1024);

      if (sizeInMb <= 10) {
        selectedImage.value = file;
      } else {
        Get.snackbar("Error", "File size exceeds 10MB");
      }
    }
  }

  void removeImage() {
    selectedImage.value = null;
  }

  /// Create vendor account - Map
  // Variables
  var pickedLat = 0.0.obs;
  var pickedLng = 0.0.obs;
  var markers = <Marker>{
    Marker(
      markerId: const MarkerId("selected_location"),
      position: LatLng(43.68235894136127, -79.62811399251223),
    ),
  }.obs;
  var outlets = <Map<String, String>>[].obs;

  void updateLocation(LatLng position) {
    // Save to variables
    pickedLat.value = position.latitude;
    pickedLng.value = position.longitude;

    // Set the marker on map
    markers.value = {Marker(markerId: const MarkerId("selected_location"), position: position)};
  }

  void saveOutlet() {
    if (businessAddressController.text.isNotEmpty) {
      outlets.add({
        'name': 'Outlet ${outlets.length + 1}',
        'address': businessAddressController.text,
        'lat': pickedLat.value.toString(),
        'lng': pickedLng.value.toString(),
        'zip_code': zipCodeController.text,
      });

      // Clear fields after saving
      businessAddressController.clear();
      zipCodeController.clear();
      markers.clear();
      Get.back();
    }
  }

  void removeOutlet(int index) {
    outlets.removeAt(index);

    // Renumber remaining outlets
    for (int i = 0; i < outlets.length; i++) {
      outlets[i]['name'] = 'Outlet ${i + 1}';
    }
    outlets.refresh();
  }

  /// Submit the form
  Future<void> submitForApproval() async {
    final DioClient _dioClient = DioClient();

    if (selectedImage.value == null) {
      Get.snackbar("Error", "Please upload a business logo");
      return;
    }

    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator.adaptive()),
        barrierDismissible: false,
      );

      // Shop part
      Map<String, dynamic> shopData = {
        "business_name": businessNameController.text,
        "business_email": emailController.text,
        "business_phone": {
          "country_code": countryCodeController.text,
          "phone_number": phoneNumberController.text,
        },
        "description": businessDescriptionController.text,
        "coord": [pickedLng.value, pickedLat.value], // [Lng, Lat]
        "zip_code": zipCodeController.text,
        "website": websiteLinkController.text,
      };

      // Outlet list part
      List<Map<String, dynamic>> outletData = [];
      if (selectedTab.value == 0) {
        outletData = [
          {
            "address": businessAddressController.text,
            "zip_code": zipCodeController.text,
            "coordinates": [pickedLng.value, pickedLat.value],
          },
        ];
      } else {
        outletData = outlets.map((item) {
          return {
            "address": item['address'],
            "zip_code": item['zip_code'],
            "coordinates": [double.parse(item['lng']!), double.parse(item['lat']!)],
          };
        }).toList();
      }

      // Combine both
      Map<String, dynamic> finalPayload = {"shop": shopData, "outlet": outletData};

      // Create formdata
      dio.FormData formData = dio.FormData.fromMap({
        "data": jsonEncode(finalPayload),
        "file": await dio.MultipartFile.fromFile(
          selectedImage.value!.path,
          filename: selectedImage.value!.path.split('/').last,
        ),
      });

      log("Payload being sent in 'data': ${jsonEncode(finalPayload)}");

      // Send request
      final response = await _dioClient.client.post(ApiConstants.createShop, data: formData);

      Get.back(); // Close loading

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Success", "Shop created successfully");
      }
    } on dio.DioException catch (e) {
      Get.back();
      String errorMsg = "Server Error";

      if (e.response?.data != null) {
        if (e.response?.data is Map) {
          errorMsg =
              e.response?.data['errorSources'][0]['message']?.toString() ??
              e.response?.data['message']?.toString() ??
              e.message ??
              "Unknown Error";
        } else {
          errorMsg = "Server returned an invalid response format.";
          log("Raw Server Error: ${e.response?.data}");
        }
      } else {
        errorMsg = e.message ?? "No response from server";
      }

      log("Final Parsed Error: $errorMsg");
      Get.snackbar("Error", errorMsg);
    } catch (e) {
      Get.back();
      log("General Error: $e");
      Get.snackbar("Error", "Something went wrong");
    }
  }
}
