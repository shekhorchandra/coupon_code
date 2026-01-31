import 'package:get/get.dart';
import '../controllers/discover_controller.dart';

class DiscoverBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscoverController>(() => DiscoverController());
  }
}
