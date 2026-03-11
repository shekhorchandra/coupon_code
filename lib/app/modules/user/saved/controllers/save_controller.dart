import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/save_item_model.dart';

class SavesController extends GetxController {
  var selectedTab = 0.obs;
  var savesList = <SaveItem>[].obs;
  var isLoading = false.obs;

  final _storage = GetStorage(); // local storage key: 'savedDeals'

  @override
  void onInit() {
    super.onInit();
    fetchSavedDeals(); // load saved deals on init
  }

  // ------------------------------
  // Fetch saved deals from API
  // ------------------------------
  Future<void> fetchSavedDeals() async {
    isLoading.value = true;

    try {
      //  Get saved IDs safely
      final savedIds = _getSavedIds();
      if (savedIds.isEmpty) {
        savesList.clear();
        isLoading.value = false;
        return;
      }

      // Fetch fresh data from API
      final baseURL = 'https://gastrotomic-squirrelly-yuonne.ngrok-free.dev';
      final url = Uri.parse('$baseURL/api/v1/service/saved?ids=${savedIds.join(",")}');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['success'] == true) {
          final List fetchedDeals = data['data'] ?? [];

          //  Map API data to SaveItem model
          savesList.value = fetchedDeals.map((e) => SaveItem.fromJson(e)).toList();

          //  Update stored IDs (remove deleted deals automatically)
          final fetchedIds = savesList.map((e) => e.id).toList();
          _storage.write('savedDeals', fetchedIds);
        } else {
          Get.snackbar('Error', data['message'] ?? 'Failed to fetch saved deals');
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch saved deals');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ------------------------------
  // Save a deal by ID
  // ------------------------------
  void saveForLater(String dealId) {
    final savedIds = _getSavedIds();

    if (!savedIds.contains(dealId)) {
      savedIds.add(dealId);
      _storage.write('savedDeals', savedIds);
      Get.snackbar('Success', 'Deal saved for later');
    } else {
      Get.snackbar('Info', 'Deal already saved');
    }

    // Optional: refresh UI
    fetchSavedDeals();
  }

  // ------------------------------
  // Delete a saved deal by ID
  // ------------------------------
  void deleteSavedDeal(String dealId) {
    final savedIds = _getSavedIds();
    savedIds.remove(dealId);
    _storage.write('savedDeals', savedIds);

    // Remove from UI list
    savesList.removeWhere((deal) => deal.id == dealId);
  }

  // ------------------------------
  // Helper: Get saved IDs safely from storage
  // ------------------------------
  List<String> _getSavedIds() {
    final raw = _storage.read('savedDeals');

    if (raw == null) return [];

    // Already a List<String>
    if (raw is List) return raw.cast<String>();

    // Old JSON format (stored full deals)
    if (raw is String) {
      try {
        final list = jsonDecode(raw) as List;
        return list.map((e) {
          if (e is String) return e;
          if (e is Map && e['id'] != null) return e['id'].toString();
          return '';
        }).where((id) => id.isNotEmpty).toList();
      } catch (_) {
        return [];
      }
    }

    return [];
  }

  // ------------------------------
  // Computed getters
  // ------------------------------
  List<SaveItem> get all => savesList;
  List<SaveItem> get available => savesList.where((item) => item.isAvailable).toList();
  List<SaveItem> get expired => savesList.where((item) => !item.isAvailable).toList();

  void changeTab(int index) => selectedTab.value = index;
}