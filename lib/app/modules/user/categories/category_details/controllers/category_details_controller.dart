import 'package:get/get.dart';

class CategoryDetailsController extends GetxController {
  // Filter selections
  var searchText = ''.obs;
  var sortBy = ''.obs;
  var category = ''.obs;
  var price = ''.obs;
  var availability = ''.obs;
  var distance = ''.obs;
  var location = ''.obs;

  // Mock category data
  final deals = List.generate(6, (index) => index);

  // Methods
  void onSearch(String value) {
    searchText.value = value;
  }
}
