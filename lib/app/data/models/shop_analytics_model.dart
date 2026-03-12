// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ShopAnalyticsModel {
  final int activeDeals;
  final int totalViews;
  final int totalImpressions;

  ShopAnalyticsModel({
    required this.activeDeals,
    required this.totalViews,
    required this.totalImpressions,
  });

  ShopAnalyticsModel copyWith({int? activeDeals, int? totalViews, int? totalImpressions}) {
    return ShopAnalyticsModel(
      activeDeals: activeDeals ?? this.activeDeals,
      totalViews: totalViews ?? this.totalViews,
      totalImpressions: totalImpressions ?? this.totalImpressions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'activeDeals': activeDeals,
      'totalViews': totalViews,
      'totalImpressions': totalImpressions,
    };
  }

  factory ShopAnalyticsModel.fromMap(Map<String, dynamic> map) {
    return ShopAnalyticsModel(
      activeDeals: map['activeDeals'] as int,
      totalViews: map['totalViews'] as int,
      totalImpressions: map['totalImpressions'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopAnalyticsModel.fromJson(String source) =>
      ShopAnalyticsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ShopAnalyticsModel(activeDeals: $activeDeals, totalViews: $totalViews, totalImpressions: $totalImpressions)';

  @override
  bool operator ==(covariant ShopAnalyticsModel other) {
    if (identical(this, other)) return true;

    return other.activeDeals == activeDeals &&
        other.totalViews == totalViews &&
        other.totalImpressions == totalImpressions;
  }

  @override
  int get hashCode => activeDeals.hashCode ^ totalViews.hashCode ^ totalImpressions.hashCode;
}
