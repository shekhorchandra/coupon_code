import 'package:get/get.dart';

import '../../../menu/about_us/about_controller.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutController>(() => AboutController());
  }
}
