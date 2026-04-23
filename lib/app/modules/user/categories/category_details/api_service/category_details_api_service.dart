import 'package:dio/dio.dart';

import '../../../../services/contants/api_constants.dart';
import '../../../../services/geolocator_helper/current_location_picker.dart';
import '../model/category_deal_model.dart';

class CategoryDetailsApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> getCategoryDeals(String categoryId, {String sort = "reguler_price"}) async {
    final position = await getCurrentLocation();

    if (position == null) {
      throw Exception("Location not available");
    }

    final double lng = position.longitude;
    final double lat = position.latitude;

    final String url = "${ApiConstants.baseUrl}${ApiConstants.categoryDeals(categoryId)}";

    final response = await _dio.get(url, queryParameters: {"lng": lng, "lat": lat, "sort": sort});

    final List deals = response.data["data"]["deals"];

    return deals.map((e) => CategoryDealModel.fromJson(e)).toList();
  }
}
