import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/update_shop_controller.dart';
import 'package:get/get.dart';

class UpdateShopBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateShopController>(() => UpdateShopController());
  }
}
