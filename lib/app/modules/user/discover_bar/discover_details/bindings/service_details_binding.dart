import 'package:get/get.dart';
import '../controllers/discover_details_controller.dart';

class ServiceDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceDetailsController>(() => ServiceDetailsController());
  }
}
