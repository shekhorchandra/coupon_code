import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/controllers/vendor_overview_chart_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class OverviewChart extends GetView<VendorOverviewChartController> {
  const OverviewChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorOverviewChartController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // DROPDOWNS
        Row(
          children: [
            Expanded(child: _buildMetricDropdown(controller)),
            const SizedBox(width: 12),
            Expanded(child: _buildYearDropdown(controller)),
          ],
        ),

        const SizedBox(height: 20),

        // CHART CARD
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F7FC),
            borderRadius: BorderRadius.circular(16),
          ),
          child: SizedBox(
            height: 250,
            width: double.infinity,
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              final lines = controller.getVisibleLines();
              if (lines.isEmpty) return const Center(child: Text("No data available"));

              return RepaintBoundary(child: LineChart(_buildChartData(controller, lines)));
            }),
          ),
        ),

        const SizedBox(height: 16),

        // LEGEND (RESPONSIVE)
        Obx(() {
          final metric = controller.selectedMetric.value;
          final seriesData = controller.allData[metric];

          if (seriesData == null) return const SizedBox.shrink();

          return Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 8,
              children: seriesData.map((series) {
                final isActive = controller.activeYears.contains(series.year);

                return GestureDetector(
                  onTap: () => controller.toggleYear(series.year),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: series.color.withOpacity(isActive ? 1.0 : 0.3),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        series.year,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                          color: isActive ? Colors.black : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        }),
      ],
    );
  }

  // ================= DROPDOWNS =================

  Widget _buildMetricDropdown(VendorOverviewChartController controller) {
    return Obx(
      () => _buildDropdownWrapper(
        child: DropdownButton<String>(
          isExpanded: true,
          value: controller.selectedMetric.value,
          icon: const Icon(Iconsax.arrow_down_1_copy, size: 20),
          underline: const SizedBox(),
          items: [
            'Views',
            'Impressions',
          ].map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
          onChanged: (v) => controller.changeMetric(v),
        ),
      ),
    );
  }

  Widget _buildYearDropdown(VendorOverviewChartController controller) {
    return Obx(
      () => _buildDropdownWrapper(
        child: DropdownButton<String>(
          isExpanded: true,
          value: controller.selectedYear.value,
          icon: const Icon(Iconsax.arrow_down_1_copy, size: 20),
          underline: const SizedBox(),
          items: controller.availableYears
              .map((year) => DropdownMenuItem(value: year, child: Text(year)))
              .toList(),
          onChanged: (v) => controller.changeYear(v),
        ),
      ),
    );
  }

  Widget _buildDropdownWrapper({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7FD),
        border: Border.all(color: AppColor.bw.s400.withOpacity(0.5), width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }

  // ================= CHART DATA =================

  LineChartData _buildChartData(
    VendorOverviewChartController controller,
    List<LineChartBarData> lines,
  ) {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => AppColor.primary.withOpacity(0.8),
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                '${spot.y.toInt()}',
                const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              );
            }).toList();
          },
        ),
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 50, // Adjusted for better visibility
        getDrawingHorizontalLine: (v) =>
            FlLine(color: Colors.grey.withOpacity(0.1), strokeWidth: 1, dashArray: [5, 5]),
      ),
      titlesData: FlTitlesData(
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 35,
            getTitlesWidget: (value, meta) => SideTitleWidget(
              meta: meta,
              space: 4,
              child: Text(
                value.toInt().toString(),
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (val, meta) {
              const months = [
                'Jan',
                'Feb',
                'Mar',
                'Apr',
                'May',
                'Jun',
                'Jul',
                'Aug',
                'Sep',
                'Oct',
                'Nov',
                'Dec',
              ];
              int index = val.toInt();
              if (index < 0 || index >= months.length) return const SizedBox.shrink();

              // Using SideTitleWidget (the one we fixed)
              return SideTitleWidget(
                meta: meta,
                space: 8,
                child: Text(
                  months[index],
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.black12),
          left: BorderSide(color: Colors.black12),
        ),
      ),
      lineBarsData: lines,
    );
  }
}
