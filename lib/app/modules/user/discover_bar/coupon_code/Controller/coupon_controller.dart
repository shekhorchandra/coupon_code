import 'package:coupon_code/app/data/models/deal_model.dart';
import 'package:get/get.dart';

class CouponController extends GetxController {
  // ---------------- Deal info ----------------
  String? productId;
  String? dealTitle;
  String? dealImage;

  // ---------------- Prices ----------------
  double? regularPrice;
  double? discountPercent;

  double get discountedPrice {
    if (regularPrice == null || discountPercent == null) return 0;
    return DealModel.afterDiscountPrice(regularPrice!, discountPercent!);
  }

  // ---------------- Coupon info ----------------
  RxString couponCode = "".obs; // Fetched from deal API
  String get qrData => "$productId|${couponCode.value}";

  // ---------------- UI state ----------------
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;

  // ---------------- Methods ----------------
  void changeTab(int index) => selectedIndex.value = index;

  /// Set deal details from API
  void setDeal(DealModel deal) {
    productId = deal.id;
    dealTitle = deal.title;
    dealImage = deal.images.isNotEmpty ? deal.images.first : null;
    regularPrice = deal.regular_price;
    discountPercent = deal.discountPercent;

    couponCode.value = deal.coupon ?? "No coupon available";
  }
}
