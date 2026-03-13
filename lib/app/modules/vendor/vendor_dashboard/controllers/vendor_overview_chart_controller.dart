import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/models/chart_data_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorOverviewChartController extends GetxController {
  var isLoading = true.obs;
  var selectedMetric = 'Views'.obs;
  var selectedYear = ''.obs;
  var activeYears = <String>[].obs;
  var availableYears = <String>[].obs;

  final Map<String, List<ChartDataModel>> allData = {'Views': [], 'Impressions': []};

  final DioClient _dioClient = DioClient();

  // Future-proof: List of colors to cycle through for any number of years
  final List<Color> _chartColors = [
    Colors.cyan,
    Colors.orange,
    Colors.purple,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.indigo,
  ];

  @override
  void onInit() {
    super.onInit();
    loadDataFromApi();
  }

  void loadDataFromApi() async {
    try {
      isLoading.value = true;
      final response = await _dioClient.client.get(ApiConstants.yearlyAnalytics);

      if (response.data != null) {
        processApiResponse(response.data);
      }
    } catch (e) {
      debugPrint("Error fetching analytics: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void processApiResponse(Map<String, dynamic> response) {
    if (response['success'] == true && response['data'] != null) {
      final data = response['data'] as Map<String, dynamic>;

      // 1. Setup & Sort Years dynamically
      List<String> years = data.keys.toList();
      // Sort years numerically (2024, 2025, 2026...)
      years.sort((a, b) => a.compareTo(b));
      availableYears.assignAll(years);

      // Default to the latest year available
      if (years.isNotEmpty) {
        selectedYear.value = years.last;
        activeYears.assign(years.last);
      }

      // 2. Clear previous data
      allData['Views']!.clear();
      allData['Impressions']!.clear();

      // 3. Loop through years and parse data
      for (int i = 0; i < years.length; i++) {
        String year = years[i];
        var monthlyList = data[year] as List;

        // Future-proof: Assign color based on index (cycles through the list)
        Color yearColor = _chartColors[i % _chartColors.length];

        List<FlSpot> viewSpots = [];
        List<FlSpot> impressionSpots = [];

        for (var item in monthlyList) {
          // X-axis: Month 1-12 mapped to 0-11
          double x = ((item['month'] ?? 1) - 1).toDouble();

          viewSpots.add(FlSpot(x, (item['views'] as num? ?? 0).toDouble()));
          impressionSpots.add(FlSpot(x, (item['impressions'] as num? ?? 0).toDouble()));
        }

        // Add to Views
        allData['Views']!.add(ChartDataModel(year: year, color: yearColor, spots: viewSpots));

        // Add to Impressions
        allData['Impressions']!.add(
          ChartDataModel(year: year, color: yearColor, spots: impressionSpots),
        );
      }
    }
  }

  // --- Logic Helpers ---

  void changeMetric(String? value) {
    if (value != null) selectedMetric.value = value;
  }

  void changeYear(String? year) {
    if (year != null) {
      selectedYear.value = year;
      // When user selects a year from dropdown, focus only on that year
      activeYears.assign(year);
    }
  }

  void toggleYear(String year) {
    if (activeYears.contains(year)) {
      if (activeYears.length > 1) activeYears.remove(year);
    } else {
      activeYears.add(year);
    }
  }

  List<LineChartBarData> getVisibleLines() {
    List<ChartDataModel> seriesList = allData[selectedMetric.value] ?? [];
    return seriesList
        .where((s) => activeYears.contains(s.year))
        .map(
          (s) => LineChartBarData(
            spots: s.spots,
            isCurved: true,
            color: s.color,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                radius: 3,
                color: Colors.white,
                strokeWidth: 2,
                strokeColor: s.color,
              ),
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [s.color.withOpacity(0.3), s.color.withOpacity(0.0)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        )
        .toList();
  }
}
