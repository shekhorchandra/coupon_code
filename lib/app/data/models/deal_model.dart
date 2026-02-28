import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DealModel {
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
  final String? coupon;
  final int totalViews;
  final int totalImpression;
  final DateTime createdAt;
  final DateTime updatedAt;
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
    required this.createdAt,
    required this.updatedAt,
  });

  DealModel copyWith({
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
    String? coupon,
    int? totalViews,
    int? totalImpression,
    DateTime? createdAt,
    DateTime? updatedAt,
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
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory DealModel.fromMap(Map<String, dynamic> map) {
    return DealModel(
      id: map['_id'] as String,
      shopId: map['shopId'] as String,
      userId: map['userId'] as String,
      categoryId: map['categoryId'] as String,
      activePromotion: map['activePromotion'] != null ? map['activePromotion'] as bool : null,
      title: map['title'] as String,
      regularPrice: map['regularPrice'] as double,
      discountPercent: map['discountPercent'] as double,
      highlights: List<String>.from((map['highlights'] as List<String>)),
      description: map['description'] as String,
      images: List<String>.from((map['images'] as List<String>)),
      isPromoted: map['isPromoted'] != null ? map['isPromoted'] as bool : null,
      promotedUntil: map['promotedUntil'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['promotedUntil'] as int)
          : null,
      coupon: map['coupon'] != null ? map['coupon'] as String : null,
      totalViews: map['totalViews'] as int,
      totalImpression: map['totalImpression'] as int,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory DealModel.fromJson(String source) =>
      DealModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DealModel(id: $id, shopId: $shopId, userId: $userId, categoryId: $categoryId, activePromotion: $activePromotion, title: $title, regularPrice: $regularPrice, discountPercent: $discountPercent, highlights: $highlights, description: $description, images: $images, isPromoted: $isPromoted, promotedUntil: $promotedUntil, coupon: $coupon, totalViews: $totalViews, totalImpression: $totalImpression, createdAt: $createdAt, updatedAt: $updatedAt)';
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
        other.totalImpression == totalImpression &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
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
        totalImpression.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  static double afterDiscountPrice(double regularPrice, double discountPercent) {
    return regularPrice - (regularPrice * discountPercent / 100);
  }
}
