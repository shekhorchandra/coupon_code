import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/save_item_model.dart';

class SavesController extends GetxController {
  var selectedTab = 0.obs;
  var savesList = <SaveItem>[].obs;
  var isLoading = false.obs;

  final _storage = GetStorage(); // local storage

  @override
  void onInit() {
    super.onInit();
    loadSavedDeals();
  }

  // remove deals
  void removeSavedDeal(String id) {
    // Remove from the list
    savesList.removeWhere((item) => item.id == id);

    // Update local storage
    _storage.write('savedDeals', jsonEncode(savesList.map((e) => e.toJson()).toList()));

    Get.snackbar('Removed', 'Deal has been removed from saved items');
  }


  // Load saved deals from local storage
  void loadSavedDeals() {
    final savedJson = _storage.read<String>('savedDeals');
    if (savedJson != null) {
      final list = jsonDecode(savedJson) as List;
      savesList.value = list.map((e) => SaveItem.fromJson(e)).toList();
    }
  }

  // Save an item locally
  void saveForLater(SaveItem item) {
    // avoid duplicates
    if (!savesList.any((e) => e.id == item.id)) {
      savesList.add(item);
      _storage.write('savedDeals', jsonEncode(savesList.map((e) => e.toJson()).toList()));
      Get.snackbar('Saved', '${item.title} has been saved for later');
    } else {
      Get.snackbar('Info', '${item.title} is already saved');
    }
  }

  List<SaveItem> get all => savesList;
  List<SaveItem> get available => savesList.where((item) => item.isAvailable).toList();
  List<SaveItem> get expired => savesList.where((item) => !item.isAvailable).toList();

  void changeTab(int index) => selectedTab.value = index;
}