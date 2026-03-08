import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/save_item_model.dart';

class SavesController extends GetxController {

  var selectedTab = 0.obs;
  var savesList = <SaveItem>[].obs;
  var isLoading = false.obs;

  final String baseUrl = "https://gastrotomic-squirrelly-yuonne.ngrok-free.dev/api/v1";

  @override
  void onInit() {
    fetchSavedDeals();
    super.onInit();
  }

  Future<void> fetchSavedDeals() async {
    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse("$baseUrl/service/saved?ids=69a6b624bdf4df7b68a74aff&page=1&limit=10"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["success"]) {
          List list = data["data"];

          savesList.value =
              list.map((e) => SaveItem.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print("Saved deals error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  List<SaveItem> get all => savesList;

  List<SaveItem> get available =>
      savesList.where((item) => item.isAvailable).toList();

  List<SaveItem> get expired =>
      savesList.where((item) => !item.isAvailable).toList();

  void changeTab(int index) {
    selectedTab.value = index;
  }
}