import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartDataModel {
  final String year;
  final Color color;
  final List<FlSpot> spots;

  ChartDataModel({required this.year, required this.color, required this.spots});
}
