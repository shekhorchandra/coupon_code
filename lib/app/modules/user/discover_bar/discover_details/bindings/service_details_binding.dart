import 'package:coupon_code/app/modules/user/saved/controllers/save_controller.dart';
import 'package:get/get.dart';

import '../controllers/discover_details_controller.dart';

class ServiceDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceDetailsController>(() => ServiceDetailsController());
    Get.lazyPut(() => SavesController());
  }
}
