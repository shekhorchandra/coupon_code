import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../services/contants/api_constants.dart';
import '../model/Vendor_deals_Shop_Model.dart';

class VendorDetailsController extends GetxController {
  var isLoading = true.obs;
  var vendor = Rx<VendorDetailsModel?>(null);
  var selectedTab = 0.obs;
  var selectedOutlet = Rx<OutletModel?>(null);

  late String shopId;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;

    print("Arguments-----------: $args");

    if (args != null && args['shopId'] != null) {
      shopId = args['shopId'];

      print("SHOP ID RECEIVED: $shopId");

      fetchVendorDeals(shopId);
    } else {
      print("shopId not found in arguments");
    }
  }

  /// Get logged-in user token (replace key with your storage key)
  final box = GetStorage();

  String getUserToken() {
    return box.read('accessToken') ?? '';
  }

  Future<void> fetchVendorDetails() async {
    if (shopId.isNotEmpty) {
      await fetchVendorDeals(shopId);
    }
  }

  /// Fetch vendor details by shopId using token in headers
  Future<void> fetchVendorDeals(String shopId) async {
    try {
      isLoading.value = true;

      final url = "${ApiConstants.baseUrl}/shop/shop_details";

      final token = getUserToken();

      final response = await Dio().get(
        url,
        queryParameters: {'shopId': shopId},
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
          validateStatus: (status) => status! < 500,
        ),
      );

      print("Response: ${response.data}");

      if (response.statusCode == 200 &&
          response.data['success'] == true &&
          response.data['data'] != null) {

        // Parse vendor
        vendor.value = VendorDetailsModel.fromJson(response.data['data']);

        // Select first outlet
        if (vendor.value!.outlets.isNotEmpty) {
          selectedOutlet.value = vendor.value!.outlets.first;
        }

        // Filter deals for this shopId (though API already gives it)
        final deals = (response.data['data']['deals'] as List? ?? [])
            .map((e) => DealModel.fromJson(e ?? {}))
            .where((d) => d.shopId == shopId)
            .toList();

        vendor.value!.deals.clear();
        vendor.value!.deals.addAll(deals);

      } else {
        vendor.value = null;
        selectedOutlet.value = null;
      }
    } catch (e) {
      print("Error fetching deals: $e");
      vendor.value = null;
      selectedOutlet.value = null;
    } finally {
      isLoading.value = false;
    }
  }

  void changeTab(int index) => selectedTab.value = index;
  void selectOutlet(OutletModel outlet) => selectedOutlet.value = outlet;
}