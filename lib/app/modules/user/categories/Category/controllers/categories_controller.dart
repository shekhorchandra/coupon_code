import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final searchText = ''.obs;

  final categories = [
    {"icon": "food", "title": "Food & Drink"},
    {"icon": "food", "title": "Spas & Wellness"},
    {"icon": "food", "title": "Beauty Treatments"},
    {"icon": "food", "title": "Health & Medical"},
    {"icon": "food", "title": "Events & Concerts"},
    {"icon": "food", "title": "Shopping & Retail"},
    {"icon": "food", "title": "Education & Learning"},
    {"icon": "food", "title": "Outdoor & Recreation"},
    {"icon": "food", "title": "Automotive Services"},
  ];

  List<Map<String, String>> get filteredCategories {
    if (searchText.value.isEmpty) {
      return List<Map<String, String>>.from(categories);
    }
    return categories
        .where((c) =>
        c["title"]!
            .toLowerCase()
            .contains(searchText.value.toLowerCase()))
        .map((e) => Map<String, String>.from(e))
        .toList();
  }

  void onSearch(String value) {
    searchText.value = value;
  }
}
