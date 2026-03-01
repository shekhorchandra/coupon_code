import 'dart:math';
import 'package:get/get.dart';

class CouponController extends GetxController {
  final selectedIndex = 0.obs;

  late String productId;
  late String couponCode;

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  String get qrData => "$productId|$couponCode";

  String generateDemoCoupon() {
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ123456789';
    final rand = Random();

    return 'GLAM-' +
        List.generate(5, (_) => chars[rand.nextInt(chars.length)]).join();
  }
}