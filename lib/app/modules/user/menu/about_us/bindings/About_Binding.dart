import 'package:coupon_code/app/modules/user/menu/about_us/controllers/About_Controller.dart';
import 'package:get/get.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutController>(() => AboutController());
  }
}
