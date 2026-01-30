import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/widgets/section_heading.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/controllers/vendor_overview_chart_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class OverviewChart extends StatelessWidget {
  const OverviewChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorOverviewChartController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TITLE
        SectionHeading(title: "Personal Overview", subtitle: "last 1 year"),

        const SizedBox(height: 10),

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
              final lines = controller.getVisibleLines();

              if (lines.isEmpty) {
                return const Center(
                  child: Text("No data available", style: TextStyle(color: Colors.grey)),
                );
              }

              return LineChart(_buildChartData(controller));
            }),
          ),
        ),

        const SizedBox(height: 16),

        // LEGEND (BOTTOM CENTER)
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.allData[controller.selectedMetric.value]!.map((series) {
              final isActive = controller.activeYears.contains(series.year);

              return GestureDetector(
                onTap: () => controller.toggleYear(series.year),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(color: series.color, shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        series.year,
                        style: TextStyle(
                          fontSize: 12,
                          color: isActive ? Colors.black : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // ================= DROPDOWNS =================

  Widget _buildMetricDropdown(VendorOverviewChartController controller) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Color(0xFFF6F7FD),
          border: BoxBorder.all(color: AppColor.bw.s400, width: 0.5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButton<String>(
          isExpanded: true,
          value: controller.selectedMetric.value,
          icon: const Icon(Iconsax.arrow_down_1_copy, size: 20),
          underline: const SizedBox(),
          items: [
            'Views',
            'Clicks',
            'Conversions',
          ].map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
          onChanged: controller.changeMetric,
        ),
      ),
    );
  }

  Widget _buildYearDropdown(VendorOverviewChartController controller) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Color(0xFFF6F7FD),
          border: BoxBorder.all(color: AppColor.bw.s400, width: 0.5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButton<String>(
          isExpanded: true,
          value: controller.selectedYear.value,
          icon: const Icon(Iconsax.arrow_down_1_copy, size: 20),
          underline: const SizedBox(),
          items: controller.availableYears
              .map((year) => DropdownMenuItem(value: year, child: Text(year)))
              .toList(),
          onChanged: controller.changeYear,
        ),
      ),
    );
  }

  // ================= CHART DATA =================

  LineChartData _buildChartData(VendorOverviewChartController controller) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 100,
        getDrawingHorizontalLine: (v) =>
            FlLine(color: Colors.grey.withAlpha(30), dashArray: [5, 5]),
      ),
      titlesData: FlTitlesData(
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
              if (val.toInt() < 0 || val.toInt() > 11) {
                return const SizedBox.shrink();
              }
              return Text(
                months[val.toInt()],
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(bottom: BorderSide(color: Colors.black12)),
      ),
      lineBarsData: controller.getVisibleLines(),
    );
  }
}
