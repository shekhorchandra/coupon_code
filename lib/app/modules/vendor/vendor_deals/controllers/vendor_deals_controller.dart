import 'dart:developer';
import 'dart:io';

import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/data/models/deal_category_model.dart';
import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:coupon_code/app/data/models/deal_plan_model.dart';
import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/data/deal_plans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VendorDealsController extends GetxController {
  VendorDealsController();

  var selectedTab = 0.obs;

  void setTab(int index) {
    selectedTab.value = index;
  }

  // void toggleDealStatus(String id, bool value) {
  //   // 1. Find the index of the deal in the mockDeals list (or your observable list)
  //   int index = mockDeals.indexWhere((deal) => deal.id == id);

  //   if (index != -1) {
  //     // 2. Update the value
  //     mockDeals[index].isActive = value;

  //     // 3. IMPORTANT: If mockDeals is an RxList in a controller, call refresh
  //     // if this list is in VendorDashboardController, use:
  //     // Get.find<VendorDashboardController>().deals.refresh();

  //     print("Deal $id status changed to: $value");
  //   }
  // }

  // Add New Deal
  bool _isUpdatingDiscount = false;
  bool _isUpdatingFinalPrice = false;

  DioClient _dioClient = DioClient();

  @override
  void onInit() async {
    priceController.addListener(_calculateFromDiscount);
    discountController.addListener(_calculateFinalPrice);
    finalPriceController.addListener(_calculateDiscount);

    await _fetchCategories();
    super.onInit();
  }

  Future<void> _fetchCategories() async {
    try {
      final response = await _dioClient.client.get(ApiConstants.category);

      if (response.statusCode == 200) {
        final data = response.data['data'];

        if (data is List) {
          categories.value = data.map((e) => DealCategoryModel.fromMap(e)).toList();
        } else if (data is Map<String, dynamic>) {
          categories.value = [DealCategoryModel.fromMap(data)];
        }
        log(categories.toString());
      } else {
        Get.snackbar('Error', 'Couldn\'t fetch categories!');
      }
    } catch (e) {
      Get.snackbar('Error', 'Unidentified error occured!');
      log(e.toString());
    }
  }

  void _calculateFinalPrice() {
    if (_isUpdatingFinalPrice) return;

    final price = double.tryParse(priceController.text);
    final discount = double.tryParse(discountController.text);

    if (price == null || discount == null) return;

    _isUpdatingDiscount = true;

    final finalPrice = price - (price * discount / 100);
    finalPriceController.text = finalPrice.toStringAsFixed(2);

    _isUpdatingDiscount = false;
  }

  void _calculateDiscount() {
    if (_isUpdatingDiscount) return;

    final price = double.tryParse(priceController.text);
    final finalPrice = double.tryParse(finalPriceController.text);

    if (price == null || finalPrice == null || price == 0) return;

    _isUpdatingFinalPrice = true;

    final discount = ((price - finalPrice) / price) * 100;
    discountController.text = discount.toStringAsFixed(2);

    _isUpdatingFinalPrice = false;
  }

  void _calculateFromDiscount() {
    if (discountController.text.isNotEmpty) {
      _calculateFinalPrice();
    }
  }

  // Text Controllers
  final titleController = TextEditingController(text: '');
  final descController = TextEditingController(text: '');
  final couponController = TextEditingController(text: '');
  final priceController = TextEditingController(text: '');
  final discountController = TextEditingController(text: '');
  final finalPriceController = TextEditingController(text: '');

  RxList<String> highlightController = <String>[].obs;

  // Selections
  Rx<String> selectedCategory = ''.obs;
  // TODO: Fetch categories from API
  RxList<DealCategoryModel> categories = <DealCategoryModel>[].obs;
  Rx<DealPlanModel?> selectedDealPlan = Rx<DealPlanModel?>(dealPlans[0]);
  Rx<DateTimeRange?> selectedValidityRange = Rx<DateTimeRange?>(null);
  Rx<bool> acceptedTnC = false.obs;
  Rx<bool> hasError = true.obs;
  Rxn<DealModel> deal = Rxn<DealModel>();

  // Image Picker
  var images = <File>[].obs;
  var currentImageIndex = 0.obs;
  final PageController pageController = PageController();
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    if (images.length >= 6) {
      Get.snackbar("Limit Reached", "You can only upload up to 6 images");
      return;
    }

    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      images.add(File(pickedFile.path));
    }
  }

  void removeImage(int index) {
    images.removeAt(index);
    if (currentImageIndex.value >= images.length && images.isNotEmpty) {
      currentImageIndex.value = images.length - 1;
    }
  }

  void nextImage() {
    if (currentImageIndex.value < images.length - 1) {
      pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void previousImage() {
    if (currentImageIndex.value > 0) {
      pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  // DealModel buildDealModel() {
  //   return DealModel(
  //     id: DateTime.now().millisecondsSinceEpoch.toString(), // temporary ID for mock
  //     shopId: 'some_shop_id', // You may want to use a real shop ID here
  //     userId: 'some_user_id', // You may want to use a real user ID here
  //     categoryId: deal.categoryId,
  //     activePromotion: true, // Assuming default value as true
  //     title: titleController.text.trim(),
  //     regularPrice: price,
  //     discountPercent: discount,
  //     highlights: highlights,
  //     description: descController.text.trim(),
  //     images: images
  //         .map((image) => image.path)
  //         .toList(), // Convert image file paths to list of strings
  //     isPromoted: true, // Assuming default value as true
  //     promotedUntil: DateTime.now().add(Duration(days: 30)), // Set a default expiration date
  //     coupon: couponController.text.trim(),
  //     totalViews: 0,
  //     totalImpression: 0,
  //     createdAt: DateTime.now(),
  //     updatedAt: DateTime.now(),
  //     dealPlan: selectedDealPlan.value!, // Ensure this is not null
  //     expireDate: selectedValidityRange.value!.end, // Ensure this is not null
  //   );
  // }

  void validateAndSubmit() {
    // 1. Check Images
    if (images.isEmpty) {
      _showError("Please upload at least one image.");
      return;
    }

    // 2. Check Text Fields
    if (titleController.text.trim().isEmpty) {
      _showError("Deal title is required.");
      return;
    }
    if (selectedCategory.value.isEmpty) {
      _showError("Please select a category.");
      return;
    }
    if (highlightController.isEmpty) {
      _showError("Highlights are required.");
      return;
    }
    if (descController.text.trim().isEmpty) {
      _showError("Description is required.");
      return;
    }

    // 3. Pricing Validation
    if (priceController.text.isEmpty || finalPriceController.text.isEmpty) {
      _showError("Please enter pricing details.");
      return;
    }

    // 4. Plan and Date Validation
    if (selectedDealPlan.value == null) {
      _showError("Please select a deal plan.");
      return;
    }
    if (selectedValidityRange.value == null) {
      _showError("Please select the validity date range.");
      return;
    }

    // 5. T&C Validation
    if (!acceptedTnC.value) {
      _showError("You must accept the Terms and Conditions.");
      return;
    }

    // SUCCESS
    hasError.value = false;

    // TODO: Call repository/API here
    // deal.value = buildDealModel();
    debugPrint("Created Deal: ${deal.value}");
  }

  void _showError(String message) {
    Get.snackbar(
      "Required Field",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColor.error,
      colorText: AppColor.white,
      margin: const EdgeInsets.all(15),
    );
  }

  @override
  void onClose() {
    titleController.dispose();
    descController.dispose();
    couponController.dispose();
    priceController.dispose();
    discountController.dispose();
    finalPriceController.dispose();
    super.onClose();
  }
}
