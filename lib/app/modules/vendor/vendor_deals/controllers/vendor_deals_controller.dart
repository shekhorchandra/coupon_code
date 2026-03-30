import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/data/models/deal_category_model.dart';
import 'package:coupon_code/app/data/models/deal_image_model.dart';
import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:coupon_code/app/data/models/deal_plan_model.dart';
import 'package:coupon_code/app/data/models/shop_model.dart';
import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/data/services/storage_service.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:coupon_code/app/modules/vendor/vendor_deals/data/deal_plans.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class VendorDealsController extends GetxController {
  VendorDealsController();

  var selectedTab = 0.obs;
  Rx<bool> isLoading = false.obs;

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

  Rx<String?> shopLogo = ''.obs;

  var selectedCouponType = 'Coupon Code'.obs;
  final List<String> couponTypes = ['Coupon Code', 'QR Code', 'Barcode'];
  Rxn<File> couponImageFile = Rxn<File>();

  final tagController = TextEditingController();
  RxList<String> tags = <String>[].obs;

  RxList<Outlets>? outlets = <Outlets>[].obs;
  RxList<Outlets>? selectedOutlets = <Outlets>[].obs;

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

  Future<void> fetchShopLogoAndOutlets() async {
    try {
      StorageService _storageService = StorageService();

      final response = await _dioClient.client.get(
        ApiConstants.shopDetails,
        queryParameters: {"myId": "${_storageService.userId}"},
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];

        final shop = ShopModel.fromJson(data);
        shopLogo.value = shop.businessLogo;

        if (shopLogo.value != null || shopLogo.value!.isNotEmpty) {
          images.add(DealImageModel(url: shopLogo.value, isThumbnail: true));
        }

        // Outlets
        if (shop.outlets != null) outlets?.value = shop.outlets!;
      } else {
        Get.snackbar('Error', 'Couldn\'t fetch shop logo!');
      }
    } catch (e) {
      Get.snackbar('Error', 'Unidentified error occured!');
      log(e.toString());
    }
  }

  void toggleOutlet(Outlets outlet) {
    if (selectedOutlets!.contains(outlet)) {
      selectedOutlets?.remove(outlet);
    } else {
      selectedOutlets?.add(outlet);
    }
  }

  // Tag related logics
  void addTag(String value) {
    final cleanTag = value.trim();
    if (cleanTag.isNotEmpty && !tags.contains(cleanTag)) {
      tags.add(cleanTag);
      tagController.clear();
    }
  }

  void removeTag(int index) {
    tags.removeAt(index);
  }

  // Method to pick QR/Barcode image
  Future<void> pickCouponImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      couponImageFile.value = File(pickedFile.path);
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

  /// Image Picker
  var images = <DealImageModel>[].obs;
  var currentImageIndex = 0.obs;
  final PageController pageController = PageController();
  final ImagePicker _picker = ImagePicker();

  // 1. Pick Image (Local)
  Future<void> pickImage() async {
    if (images.length >= 6) {
      Get.snackbar("Limit Reached", "You can only upload up to 6 images");
      return;
    }

    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // If this is the first image being added, set it as the thumbnail automatically
      bool isFirst = images.isEmpty;
      images.add(DealImageModel(file: File(pickedFile.path), isThumbnail: isFirst));
    }
  }

  // 2. Set Thumbnail
  void setThumbnail(int index) {
    if (index <= 0 || index >= images.length) return; // Already thumbnail or out of bounds

    // 1. Get the item
    final selected = images[index];

    // 2. Set flags
    for (var img in images) img.isThumbnail = false;
    selected.isThumbnail = true;

    // 3. Move to first position
    images.removeAt(index);
    images.insert(0, selected);

    // 4. Update UI
    currentImageIndex.value = 0;
    if (pageController.hasClients) pageController.jumpToPage(0);
    images.refresh();
  }

  // 3. Remove Image
  void removeImage(int index) {
    bool removedWasThumbnail = images[index].isThumbnail;
    images.removeAt(index);

    // If we removed the thumbnail, assign the thumbnail to the first remaining image
    if (removedWasThumbnail && images.isNotEmpty) {
      images[0].isThumbnail = true;
    }

    // Adjust current index for the PageView
    if (currentImageIndex.value >= images.length && images.isNotEmpty) {
      currentImageIndex.value = images.length - 1;
    }
    images.refresh();
  }

  // 4. Load Network Images (Use this when editing an existing deal)
  void loadExistingImages(List<String> imageUrls, String thumbnail) {
    images.assignAll(
      imageUrls.map((u) => DealImageModel(url: u, isThumbnail: u == thumbnail)).toList(),
    );
  }

  // Navigation Logic
  void nextImage() {
    if (currentImageIndex.value < images.length - 1) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void previousImage() {
    if (currentImageIndex.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  bool validateForm() {
    if (images.isEmpty) {
      _showError("Please upload at least one image.");
      return false;
    }
    if (titleController.text.trim().isEmpty) {
      _showError("Deal title is required.");
      return false;
    }
    if (selectedCategory.value.isEmpty) {
      _showError("Please select a category.");
      return false;
    }

    if (descController.value.text.length < 6) {
      _showError("Description is too short.");
      return false;
    }

    final isTextCoupon = selectedCouponType.value == 'Coupon Code';
    if (isTextCoupon) {
      if (couponController.text.trim().isEmpty) {
        _showError("Please enter the Coupon Code.");
        return false;
      }
    } else {
      if (couponImageFile.value == null) {
        _showError("Please upload the ${selectedCouponType.value} image.");
        return false;
      }
    }

    // 3. Pricing Validation
    if (priceController.text.isEmpty) {
      _showError("Please enter the price.");
      return false;
    }
    if (double.tryParse(priceController.text) == null) {
      _showError("Invalid price format.");
      return false;
    }

    if (discountController.text.isEmpty) {
      _showError("Please enter the discount percentage.");
      return false;
    }
    if (double.tryParse(discountController.text) == null) {
      _showError("Invalid discount format.");
      return false;
    }

    if (finalPriceController.text.isEmpty) {
      finalPriceController.value = discountController.value;
      return false;
    }
    if (double.tryParse(finalPriceController.text) == null) {
      finalPriceController.value = discountController.value;
      return false;
    }

    // 4. Date Validation
    if (selectedValidityRange.value == null) {
      _showError("Please select a validity date range.");
      return false;
    }

    // SUCCESS - Clear error state
    hasError.value = false;

    return true;
  }

  Future<void> publishDeal() async {
    final isTextCoupon = selectedCouponType.value == 'Coupon Code';

    try {
      isLoading.value = true;
      deal.value = buildDealModel();

      // 1. Prepare images for the 'files' array (as you were doing)
      List<dio.MultipartFile> multipartFileList = [];
      for (var img in images) {
        if (img.file != null) {
          multipartFileList.add(
            await dio.MultipartFile.fromFile(
              img.file!.path,
              filename: img.file!.path.split('/').last,
            ),
          );
        } else if (img.url != null) {
          File downloadedFile = await _downloadFile(img.url!);
          multipartFileList.add(
            await dio.MultipartFile.fromFile(
              downloadedFile.path,
              filename: downloadedFile.path.split('/').last,
            ),
          );
        }
      }

      // 2. Construct the JSON payload (TEXT ONLY)
      // REMOVE coupon_image from here!
      Map<String, dynamic> textPayload = {
        "category": selectedCategory.value,
        "title": titleController.text.trim(),
        "available_in_outlet": selectedOutlets?.map((outlet) => outlet.sId).toList(),
        "regular_price": num.tryParse(priceController.text),
        "discount": num.tryParse(discountController.text),
        "description": descController.text.trim(),
        "highlights": highlightController.toList(),
        "tags": tags.toList(),
      };

      if (isTextCoupon) {
        textPayload["coupon"] = couponController.text.trim();
      }

      // 3. Create the FormData map
      Map<String, dynamic> formDataMap = {
        "data": jsonEncode(textPayload), // This now works because it's only text
        "files": multipartFileList, // The list of gallery images
      };

      // 4. Add the Coupon Image separately (if applicable)
      if (!isTextCoupon && couponImageFile.value != null) {
        // Depending on your API, the key might be 'coupon_image', 'qr', or 'upc'
        String fileKey = selectedCouponType.value == 'QR Code' ? 'qr' : 'upc';

        formDataMap[fileKey] = await dio.MultipartFile.fromFile(
          couponImageFile.value!.path,
          // filename: 'coupon_image.png',
        );
      }

      // 5. Build final FormData and send
      dio.FormData formData = dio.FormData.fromMap(formDataMap);

      final response = await _dioClient.client.post(ApiConstants.addDeal, data: formData);

      if (response.statusCode == 200) {
        debugPrint("Deal successfully published.");

        Get.toNamed(
          AppRoutes.DEAL_PLAN,
          arguments: {'dealItem': deal.value, 'isNetworkImage': false},
        );
      }
    } catch (e) {
      // log("Preparation error: $e");
      hasError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  // Updated Build Model to include Thumbnail Reordering logic
  DealModel buildDealModel() {
    // Ensure the thumbnail is at index 0 for the preview model
    List<String> imagePaths = images.map((img) => img.url ?? img.file?.path ?? "").toList();

    return DealModel(
      categoryId: selectedCategory.value,
      title: titleController.text.trim(),
      originalPrice: double.tryParse(priceController.text) ?? 0.0,
      discountPercent: double.tryParse(discountController.text) ?? 0.0,
      highlights: highlightController.toList(),
      description: descController.text.trim(),
      images: imagePaths, // index 0 is thumbnail
      isPromoted: true,
      promotedUntil:
          selectedValidityRange.value?.end ?? DateTime.now().add(const Duration(days: 30)),
      coupon: selectedCouponType.value == 'Coupon Code'
          ? couponController.text.trim()
          : "IMAGE_COUPON",
      totalViews: 0,
      totalImpression: 0,
    );
  }

  // Helper for Network -> File conversion (requires path_provider and http)
  Future<File> _downloadFile(String url) async {
    // Get the directory on the main thread (plugins don't work inside isolates)
    final tempDir = await getTemporaryDirectory();
    final fileName = url.split('/').last;
    final savePath = '${tempDir.path}/$fileName';

    try {
      // 2. Use Isolate.run to perform the heavy lifting
      final String downloadedPath = await Isolate.run(() => _downloadTask(url, savePath));
      return File(downloadedPath);
    } catch (e) {
      log("Isolate Download Error: $e");
      rethrow;
    }
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

Future<String> _downloadTask(String url, String savePath) async {
  final client = HttpClient();
  try {
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();

    if (response.statusCode == 200) {
      final bytes = await response.fold<List<int>>([], (p, e) => p..addAll(e));
      final file = File(savePath);
      await file.writeAsBytes(bytes);
      return file.path;
    } else {
      throw Exception("Failed to download file: ${response.statusCode}");
    }
  } finally {
    client.close();
  }
}
