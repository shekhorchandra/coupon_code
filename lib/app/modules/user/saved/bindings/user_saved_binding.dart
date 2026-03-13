import 'package:get/get.dart';

import '../controllers/save_controller.dart';

class SavesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavesController>(() => SavesController());
  }
}