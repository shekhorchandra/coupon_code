// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:coupon_code/app/data/models/deal_category_model.dart';
import 'package:coupon_code/app/data/models/deal_media_model.dart';
import 'package:coupon_code/app/data/models/deal_plan_model.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DealModel {
  final int id;
  final List<DealMediaModel> media;
  final String title;
  final DealCategoryModel category;
  final String highlights;
  final String description;
  final String couponCode;
  final double regularPrice;
  final double discountPercentage;
  final double afterDiscountPrice;
  final DealPlanModel dealPlan;
  final DateTime expireDate;
  final int? views;
  final bool isActive;

  DealModel({
    required this.id,
    required this.media,
    required this.title,
    required this.category,
    required this.highlights,
    required this.description,
    required this.couponCode,
    required this.regularPrice,
    required this.discountPercentage,
    required this.afterDiscountPrice,
    required this.dealPlan,
    required this.expireDate,
    this.views,
    required this.isActive,
  });

  DealModel copyWith({
    int? id,
    List<DealMediaModel>? media,
    String? title,
    DealCategoryModel? category,
    String? highlights,
    String? description,
    String? couponCode,
    int? regularPrice,
    double? discountPercentage,
    int? afterDiscountPrice,
    DealPlanModel? dealPlan,
    DateTime? expireDate,
    int? views,
    bool? isActive,
  }) {
    return DealModel(
      id: id ?? this.id,
      media: media ?? this.media,
      title: title ?? this.title,
      category: category ?? this.category,
      highlights: highlights ?? this.highlights,
      description: description ?? this.description,
      couponCode: couponCode ?? this.couponCode,
      regularPrice: regularPrice?.toDouble() ?? this.regularPrice,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      afterDiscountPrice: afterDiscountPrice?.toDouble() ?? this.afterDiscountPrice,
      dealPlan: dealPlan ?? this.dealPlan,
      expireDate: expireDate ?? this.expireDate,
      views: views ?? this.views,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'media': media.map((x) => x.toMap()).toList(),
      'title': title,
      'category': category.toMap(),
      'highlights': highlights,
      'description': description,
      'couponCode': couponCode,
      'regularPrice': regularPrice,
      'discountPercentage': discountPercentage,
      'afterDiscountPrice': afterDiscountPrice,
      'dealPlan': dealPlan.toMap(),
      'expireDate': expireDate.millisecondsSinceEpoch,
      'views': views,
      'isActive': isActive,
    };
  }

  factory DealModel.fromMap(Map<String, dynamic> map) {
    DateTime parseDate(dynamic dateStr) {
      if (dateStr == null || dateStr.toString().isEmpty) {
        // If no date, return a date far in the future or handle accordingly
        return DateTime.now().add(const Duration(days: 365));
      }
      try {
        // Parse the date (06-Jun-2026)
        DateTime parsed = DateFormat("dd-MMM-yyyy").parse(dateStr.toString());
        // Set to end of day: 2026-06-06 23:59:59
        return DateTime(parsed.year, parsed.month, parsed.day, 23, 59, 59);
      } catch (e) {
        debugPrint("Error parsing date: $dateStr - $e");
        return DateTime.now(); // Fallback
      }
    }

    return DealModel(
      id: map['id'] as int,
      media: (map['media'] as List? ?? [])
          .map((x) => DealMediaModel.fromMap(x as Map<String, dynamic>))
          .toList(),
      title: map['title'] ?? '',
      category: (map['category'] != null && (map['category'] as List).isNotEmpty)
          ? DealCategoryModel.fromMap(map['category'][0])
          : DealCategoryModel(id: 0, name: 'Unknown'),
      highlights: map['highlights'] ?? '',
      description: map['description'] ?? '',
      couponCode: map['couponCode'] ?? '',
      regularPrice: (map['regularPrice'] as num? ?? 0.0).toDouble(),
      discountPercentage: (map['discountPercentage'] as num? ?? 0).toDouble(),
      afterDiscountPrice: (map['afterDiscountPrice'] as num? ?? 0.0).toDouble(),
      dealPlan: (map['dealPlan'] != null && (map['dealPlan'] as List).isNotEmpty)
          ? DealPlanModel.fromMap(map['dealPlan'][0])
          : DealPlanModel(id: 0, name: '', description: '', price: 0.0),

      expireDate: parseDate(map['expireDate']),
      views: map['views'] as int?,
      isActive: map['isActive'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DealModel.fromJson(String source) =>
      DealModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DealModel(id: $id, media: $media, title: $title, category: $category, highlights: $highlights, description: $description, couponCode: $couponCode, regularPrice: $regularPrice, discountPercentage: $discountPercentage, afterDiscountPrice: $afterDiscountPrice, dealPlan: $dealPlan, expireDate: $expireDate, views: $views, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant DealModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.media, media) &&
        other.title == title &&
        other.category == category &&
        other.highlights == highlights &&
        other.description == description &&
        other.couponCode == couponCode &&
        other.regularPrice == regularPrice &&
        other.discountPercentage == discountPercentage &&
        other.afterDiscountPrice == afterDiscountPrice &&
        other.dealPlan == dealPlan &&
        other.expireDate == expireDate &&
        other.views == views &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        media.hashCode ^
        title.hashCode ^
        category.hashCode ^
        highlights.hashCode ^
        description.hashCode ^
        couponCode.hashCode ^
        regularPrice.hashCode ^
        discountPercentage.hashCode ^
        afterDiscountPrice.hashCode ^
        dealPlan.hashCode ^
        expireDate.hashCode ^
        views.hashCode ^
        isActive.hashCode;
  }
}
