import 'package:coupon_code/app/modules/vendor/vendor_dashboard/models/chart_data_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorOverviewChartController extends GetxController {
  // Observables for State
  var selectedMetric = 'Views'.obs;
  var activeYears = <String>['2025-26'].obs;
  RxString selectedYear = '2025-26'.obs;
  List<String> availableYears = ['2023-24', '2024-25', '2025-26'];

  // Mock Data for different metrics
  final Map<String, List<ChartDataModel>> allData = {
    'Views': [
      ChartDataModel(
        year: '2025-26',
        color: Colors.cyan,
        spots: [
          const FlSpot(0, 2000),
          const FlSpot(2, 1800),
          const FlSpot(5, 2100),
          const FlSpot(11, 1800),
        ],
      ),
      ChartDataModel(
        year: '2024-25',
        color: Colors.orange,
        spots: [
          const FlSpot(0, 1200),
          const FlSpot(4, 1500),
          const FlSpot(8, 1100),
          const FlSpot(11, 2200),
        ],
      ),
      ChartDataModel(
        year: '2023-24',
        color: Colors.purple,
        spots: [
          const FlSpot(0, 500),
          const FlSpot(5, 1200),
          const FlSpot(10, 800),
          const FlSpot(11, 1500),
        ],
      ),
    ],
    'Clicks': [
      ChartDataModel(
        year: '2025-26',
        color: Colors.cyan,
        spots: [
          const FlSpot(0, 400),
          const FlSpot(3, 900),
          const FlSpot(7, 400),
          const FlSpot(11, 1100),
        ],
      ),
      ChartDataModel(
        year: '2024-25',
        color: Colors.orange,
        spots: [const FlSpot(0, 200), const FlSpot(5, 600), const FlSpot(11, 300)],
      ),
      ChartDataModel(
        year: '2023-24',
        color: Colors.purple,
        spots: [const FlSpot(0, 100), const FlSpot(6, 400), const FlSpot(11, 900)],
      ),
    ],
    'Conversions': [
      ChartDataModel(
        year: '2025-26',
        color: Colors.cyan,
        spots: [const FlSpot(0, 50), const FlSpot(6, 150), const FlSpot(11, 80)],
      ),
      ChartDataModel(
        year: '2024-25',
        color: Colors.orange,
        spots: [const FlSpot(0, 20), const FlSpot(5, 90), const FlSpot(11, 140)],
      ),
      ChartDataModel(
        year: '2023-24',
        color: Colors.purple,
        spots: [const FlSpot(0, 10), const FlSpot(6, 40), const FlSpot(11, 60)],
      ),
    ],
  };

  void changeMetric(String? value) {
    if (value == null) return;

    selectedMetric.value = value;

    // Ensure selected year exists for the metric
    final years = allData[value]!.map((e) => e.year).toList();
    if (!years.contains(selectedYear.value)) {
      changeYear(years.first);
    }
  }

  void toggleYear(String year) {
    if (activeYears.contains(year)) {
      if (activeYears.length > 1) activeYears.remove(year);
    } else {
      activeYears.add(year);
    }
  }

  void changeYear(String? year) {
    if (year == null) return;

    selectedYear.value = year;

    // Show only the selected year in the chart
    activeYears
      ..clear()
      ..add(year);
  }

  // Helper to filter and format data for FlChart
  List<LineChartBarData> getVisibleLines() {
    List<ChartDataModel> seriesList = allData[selectedMetric.value] ?? [];
    return seriesList
        .where((s) => activeYears.contains(s.year))
        .map(
          (s) => LineChartBarData(
            spots: s.spots,
            isCurved: false,
            color: s.color,
            barWidth: 2,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, p, bar, i) => FlDotCirclePainter(
                radius: 3,
                color: Colors.white,
                strokeWidth: 2,
                strokeColor: s.color,
              ),
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [s.color.withAlpha(90), s.color.withAlpha(0)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        )
        .toList();
  }
}
