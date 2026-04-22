import 'package:get/get.dart';

class InAppWebviewController extends GetxController {
  // State variables
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;

  final RxString title = ''.obs;
  final RxString url = ''.obs;
}
