// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class DealModel {
  final String id;
  final String shopId;
  final String userId;
  final String categoryId;
  final String? activePromotion;
  final String title;
  final double regularPrice;
  final double discountPercent;
  final List<String> highlights;
  final String description;
  final List<String> images;
  final bool? isPromoted;
  final DateTime? promotedUntil;
  final String? coupon;
  final int totalViews;
  final int totalImpression;
  final double? distance;

  DealModel({
    required this.id,
    required this.shopId,
    required this.userId,
    required this.categoryId,
    this.activePromotion,
    required this.title,
    required this.regularPrice,
    required this.discountPercent,
    required this.highlights,
    required this.description,
    required this.images,
    this.isPromoted,
    this.promotedUntil,
    this.coupon,
    required this.totalViews,
    required this.totalImpression,
    this.distance,
  });

  DealModel copyWith({
    String? id,
    String? shopId,
    String? userId,
    String? categoryId,
    String? activePromotion,
    String? title,
    double? regularPrice,
    double? discountPercent,
    List<String>? highlights,
    String? description,
    List<String>? images,
    bool? isPromoted,
    DateTime? promotedUntil,
    String? coupon,
    int? totalViews,
    int? totalImpression,
  }) {
    return DealModel(
      id: id ?? this.id,
      shopId: shopId ?? this.shopId,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      activePromotion: activePromotion ?? this.activePromotion,
      title: title ?? this.title,
      regularPrice: regularPrice ?? this.regularPrice,
      discountPercent: discountPercent ?? this.discountPercent,
      highlights: highlights ?? this.highlights,
      description: description ?? this.description,
      images: images ?? this.images,
      isPromoted: isPromoted ?? this.isPromoted,
      promotedUntil: promotedUntil ?? this.promotedUntil,
      coupon: coupon ?? this.coupon,
      totalViews: totalViews ?? this.totalViews,
      totalImpression: totalImpression ?? this.totalImpression,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'shopId': shopId,
      'userId': userId,
      'categoryId': categoryId,
      'activePromotion': activePromotion,
      'title': title,
      'regularPrice': regularPrice,
      'discountPercent': discountPercent,
      'highlights': highlights,
      'description': description,
      'images': images,
      'isPromoted': isPromoted,
      'promotedUntil': promotedUntil?.millisecondsSinceEpoch,
      'coupon': coupon,
      'totalViews': totalViews,
      'totalImpression': totalImpression,
    };
  }

  factory DealModel.fromMap(Map<String, dynamic> map) {

    return DealModel(
      id: map['_id'] as String,
      shopId: map['shop'] as String,
      userId: map['user'] as String,
      categoryId: map['category'] as String,
      activePromotion: map['activePromotion'] != null ? map['activePromotion'] as String : null,
      title: map['title'] as String,
      regularPrice: (map['reguler_price'] as num?)?.toDouble() ?? 0.0,
      discountPercent: (map['discount'] as num?)?.toDouble() ?? 0.0,
      highlights: List<String>.from(map['highlight'] ?? []),
      description: map['description'] as String,
      images: List<String>.from(map['images'] ?? []),
      isPromoted: map['isPromoted'] != null ? map['isPromoted'] as bool : null,
      promotedUntil: map['promotedUntil'] != null
          ? DateTime.parse(map['promotedUntil'] as String)
          : null,
      coupon: map['coupon'] as String? ?? '',
      // Directly assign the fields as they are integers in the response
      totalViews: map['total_views'] as int? ?? 0,
      totalImpression: map['total_impression'] as int? ?? 0,
      distance: (map['distance'] as num?)?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DealModel.fromJson(String source) =>
      DealModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DealModel(id: $id, shopId: $shopId, userId: $userId, categoryId: $categoryId, activePromotion: $activePromotion, title: $title, regularPrice: $regularPrice, discountPercent: $discountPercent, highlights: $highlights, description: $description, images: $images, isPromoted: $isPromoted, promotedUntil: $promotedUntil, coupon: $coupon, totalViews: $totalViews, totalImpression: $totalImpression)';
  }

  @override
  bool operator ==(covariant DealModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.shopId == shopId &&
        other.userId == userId &&
        other.categoryId == categoryId &&
        other.activePromotion == activePromotion &&
        other.title == title &&
        other.regularPrice == regularPrice &&
        other.discountPercent == discountPercent &&
        listEquals(other.highlights, highlights) &&
        other.description == description &&
        listEquals(other.images, images) &&
        other.isPromoted == isPromoted &&
        other.promotedUntil == promotedUntil &&
        other.coupon == coupon &&
        other.totalViews == totalViews &&
        other.totalImpression == totalImpression;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        shopId.hashCode ^
        userId.hashCode ^
        categoryId.hashCode ^
        activePromotion.hashCode ^
        title.hashCode ^
        regularPrice.hashCode ^
        discountPercent.hashCode ^
        highlights.hashCode ^
        description.hashCode ^
        images.hashCode ^
        isPromoted.hashCode ^
        promotedUntil.hashCode ^
        coupon.hashCode ^
        totalViews.hashCode ^
        totalImpression.hashCode;
  }

  static double afterDiscountPrice(double regularPrice, double discountPercent) {
    print("Regular Price: $regularPrice");
    print("Discount: $discountPercent");
    return regularPrice - (regularPrice * discountPercent / 100);
  }
}
