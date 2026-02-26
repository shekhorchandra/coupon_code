import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

    // Clear All The Fields
    pickedLat.value = 0.0;
    pickedLng.value = 0.0;
    markers.clear();
    outlets.clear();
  }

  /// Create vendor account - Map
  // Variables
  var pickedLat = 0.0.obs;
  var pickedLng = 0.0.obs;
  var markers = <Marker>{}.obs;
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
}
