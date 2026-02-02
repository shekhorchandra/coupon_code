import 'package:coupon_code/app/modules/vendor/payment_method/controller/payment_method_controller.dart';
import 'package:get/get.dart';

class PaymentMethodBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentMethodController>(() => PaymentMethodController());
  }
}
