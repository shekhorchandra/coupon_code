import 'package:dio/dio.dart';

import '../../../../services/contants/api_constants.dart';
import '../model/category_deal_model.dart';

class CategoryDetailsApiService {
  final Dio _dio = Dio();

  Future<List<CategoryDealModel>> getCategoryDeals(
      String categoryId, {
        String sort = "reguler_price",
      }) async {
    final String url = "${ApiConstants.baseUrl}${ApiConstants.categoryDeals(categoryId)}";

    final response = await _dio.get(
      url,
      queryParameters: {
        "lng": "90.4293804",
        "lat": "23.7587992",
        "sort": sort,
      },
    );

    final List deals = response.data["data"]["deals"];

    return deals.map((e) => CategoryDealModel.fromJson(e)).toList();
  }
}
