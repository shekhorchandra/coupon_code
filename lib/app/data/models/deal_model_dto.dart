// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class DealModelDTO {
  final String id;
  final String shopId;
  final String userId;
  final String categoryId;
  final bool? activePromotion;
  final String title;
  final double regularPrice;
  final double discountPercent;
  final List<String> highlights;
  final String description;
  final List<String> images;
  final bool? isPromoted;
  final DateTime? promotedUntil;
  final int totalViews;
  final int totalImpression;
  DealModelDTO({
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
    required this.totalViews,
    required this.totalImpression,
  });

  DealModelDTO copyWith({
    String? id,
    String? shopId,
    String? userId,
    String? categoryId,
    bool? activePromotion,
    String? title,
    double? regularPrice,
    double? discountPercent,
    List<String>? highlights,
    String? description,
    List<String>? images,
    bool? isPromoted,
    DateTime? promotedUntil,
    int? totalViews,
    int? totalImpression,
  }) {
    return DealModelDTO(
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
      'totalViews': totalViews,
      'totalImpression': totalImpression,
    };
  }

  factory DealModelDTO.fromMap(Map<String, dynamic> map) {
    return DealModelDTO(
      id: map['_id'] as String,
      shopId: map['shop'] as String,
      userId: map['user'] as String,
      categoryId: map['category'] as String,
      activePromotion: map['activePromotion'] != null ? map['activePromotion'] as bool : null,
      title: map['title'] as String,
      regularPrice: (map['reguler_price'] as num?)?.toDouble() ?? 0.0,
      discountPercent: (map['discount'] as num?)?.toDouble() ?? 0.0,
      highlights: List<String>.from(map['highlight'] ?? []),
      description: map['description'] as String,
      images: List<String>.from(map['images'] ?? []),
      isPromoted: map['isPromoted'] != null ? map['isPromoted'] as bool : null,
      promotedUntil: map['promotedUntil'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['promotedUntil'] as int)
          : null,
      totalViews: int.tryParse(map['total_views'].toString()) ?? 0,
      totalImpression: int.tryParse(map['total_impression'].toString()) ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DealModelDTO.fromJson(String source) =>
      DealModelDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DealModel(id: $id, shopId: $shopId, userId: $userId, categoryId: $categoryId, activePromotion: $activePromotion, title: $title, regularPrice: $regularPrice, discountPercent: $discountPercent, highlights: $highlights, description: $description, images: $images, isPromoted: $isPromoted, promotedUntil: $promotedUntil, totalViews: $totalViews, totalImpression: $totalImpression)';
  }

  @override
  bool operator ==(covariant DealModelDTO other) {
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
        totalViews.hashCode ^
        totalImpression.hashCode;
  }

  static double afterDiscountPrice(double regularPrice, double discountPercent) {
    return regularPrice - (regularPrice * discountPercent / 100);
  }
}
