import 'package:get/get.dart';

class DiscoverController extends GetxController {
  final searchQuery = ''.obs;

  void onSearch(String value) {
    searchQuery.value = value;
  }


  void onZipPressed() {
    // TODO: open zip selector
  }

  void onLocationPressed() {
    // TODO: open location selector
  }

  void onNotificationPressed() {
    // TODO: notification logic
  }
}
