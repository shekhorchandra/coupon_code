import 'package:coupon_code/app/modules/common/webview/controllers/in_app_webview_controller.dart';
import 'package:get/get.dart';

class InAppWebviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InAppWebviewController>(() => InAppWebviewController());
  }
}
