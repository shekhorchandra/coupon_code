import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../services/Helper_status_code/HttpStatusHandler.dart';
import '../../../../services/contants/api_constants.dart';
import '../category_model/CategoryModel.dart';

class CategoriesController extends GetxController {
  final searchText = ''.obs;
  final categories = <CategoryModel>[].obs;
  final isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final url = "${ApiConstants.baseUrl}${ApiConstants.category}";
      // API call
      final response = await Dio().get(
        url,
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      // Use HttpStatusHandler to get message
      final message = HttpStatusHandler.getMessage(
        response.statusCode ?? 0,
        fallback: response.data?['message'],
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        final List data = response.data['data'];
        categories.value = data.map((e) => CategoryModel.fromJson(e)).toList();
        print(" Categories loaded: ${categories.length}");
      } else {
        print(" Failed: $message");
      }
    } on DioException catch (e) {
      final status = e.response?.statusCode ?? 0;
      final message = HttpStatusHandler.getMessage(status, fallback: e.message);
      print(" Dio error: $message");
    } catch (e) {
      print(" Unexpected error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  List<CategoryModel> get filteredCategories {
    if (searchText.value.isEmpty) return categories;

    return categories
        .where(
          (c) => c.name.toLowerCase().contains(searchText.value.toLowerCase()),
        )
        .toList();
  }

  void onSearch(String value) => searchText.value = value;
}
