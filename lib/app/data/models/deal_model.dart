// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class DealModel {
  final String? id;
  final String? shopId;
  final String? userId;
  final String categoryId;
  final String? activePromotion;
  final String title;
  final String? subtitle;
  final String? image;
  final double? price;
  final double originalPrice;
  final String? duration;
  final double? regular_price;
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
  final String? website;
  final String? address;
  final String? businessName;

  DealModel({
    this.id,
    this.shopId,
    this.userId,
    required this.categoryId,
    this.activePromotion,
    required this.title,
    this.regular_price,
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
    this.website,
    this.address,
    this.businessName,
    this.subtitle,
    this.image,
    this.price,
    required this.originalPrice,
    this.duration,
  });

  DealModel copyWith({
    String? id,
    String? shopId,
    String? userId,
    String? categoryId,
    String? activePromotion,
    String? title,
    String? subtitle,
    double? regularPrice,
    double? discount,
    double? discountPercent,
    List<String>? highlights,
    String? description,
    String? image,
    double? price,
    double? originalPrice,
    String? duration,
    List<String>? images,
    bool? isPromoted,
    DateTime? promotedUntil,
    String? coupon,
    int? totalViews,
    int? totalImpression,
    String? website,
    String? address,
    String? businessName,
  }) {
    return DealModel(
      id: id ?? this.id,
      shopId: shopId ?? this.shopId,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      activePromotion: activePromotion ?? this.activePromotion,
      title: title ?? this.title,
      regular_price: regularPrice ?? this.regular_price,
      discountPercent: discountPercent ?? this.discountPercent,
      highlights: highlights ?? this.highlights,
      description: description ?? this.description,
      images: images ?? this.images,
      isPromoted: isPromoted ?? this.isPromoted,
      promotedUntil: promotedUntil ?? this.promotedUntil,
      coupon: coupon ?? this.coupon,
      totalViews: totalViews ?? this.totalViews,
      totalImpression: totalImpression ?? this.totalImpression,
      website: website ?? this.website,
      address: address ?? this.address,
      businessName: businessName ?? this.businessName,
      subtitle: subtitle ?? this.subtitle,
      image: image ?? this.image,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      duration: duration ?? this.duration,
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
      'subtitle': subtitle,
      'image': image,
      'price': price,
      'originalPrice': originalPrice,
      'duration': duration,
      'reguler_price': regular_price,
      'discountPercent': discountPercent,
      'highlights': highlights,
      'description': description,
      'images': images,
      'isPromoted': isPromoted,
      'promotedUntil': promotedUntil?.millisecondsSinceEpoch,
      'coupon': coupon,
      'totalViews': totalViews,
      'totalImpression': totalImpression,
      'website': website,
      'address': address,
      'businessName': businessName,
      'distance': distance,
    };
  }

  factory DealModel.fromMap(Map<String, dynamic> map) {
    // 1. Safe parsing for Lists (converts objects to strings if they aren't already)
    List<String> parseStringList(dynamic list) {
      if (list == null || list is! List) return [];
      return list.map((e) => e is Map ? e.toString() : e.toString()).toList();
    }

    final imagesList = parseStringList(map['images']);
    final highlightList = parseStringList(map['highlight']);

    // 2. Safe parsing for Outlets
    final outlets = map['available_outlet'] as List?;
    String? address;
    double? distance;

    if (outlets != null && outlets.isNotEmpty) {
      final nearestOutlet = outlets.reduce((a, b) {
        final distA = (a['distance'] ?? double.infinity) as num;
        final distB = (b['distance'] ?? double.infinity) as num;
        return distA < distB ? a : b;
      });

      address = nearestOutlet['address']?.toString();
      distance = nearestOutlet['distance'] != null
          ? (nearestOutlet['distance'] as num).toDouble()
          : null;
    }

    final List<String> imagesList =
        (map['images'] as List?)?.map((e) => e.toString()).toList() ?? [];

    return DealModel(
      id: map['_id']?.toString() ?? '',
      // shopId: map['shop']?.toString() ?? '',
      shopId: map['shop']['_id'] ?? '',
      userId: map['user']?.toString() ?? '',
      categoryId: map['category']?.toString() ?? '',
      activePromotion: map['activePromotion']?.toString(),
      title: map['title']?.toString() ?? '',
      regular_price: (map['reguler_price'] ?? 0).toDouble(),
      discountPercent: (map['discount'] ?? 0).toDouble(),
      highlights: map['highlight'] != null
          ? (map['highlight'] as List).map((e) => e.toString()).toList()
          : [],
      description: map['description']?.toString() ?? '',
      images: imagesList,
      isPromoted: map['isPromoted'] as bool?,
      promotedUntil: map['promotedUntil'] != null
          ? DateTime.tryParse(map['promotedUntil'])
          : null,
      coupon: map['coupon']?.toString() ?? '',
      totalViews: map['total_views'] ?? 0,
      totalImpression: map['total_impression'] ?? 0,
      website: map['shop'] is Map ? map['shop']['website']?.toString() : null,
      address: address,
      distance: distance,
      businessName: map['shop']?['business_name']?.toString() ?? '',
      subtitle: map['description']?.toString() ?? '',
      image: imagesList.isNotEmpty ? imagesList.first : '',
      price: DealModel.afterDiscountPrice(
        (map['reguler_price'] ?? 0).toDouble(),
        (map['discount'] ?? 0).toDouble(),
      ),
      originalPrice: (map['reguler_price'] ?? 0).toDouble(),
      duration: "N/A",
    );
  }

  String toJson() => json.encode(toMap());

  factory DealModel.fromJson(String source) =>
      DealModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DealModel(id: $id, shopId: $shopId, userId: $userId, categoryId: $categoryId, activePromotion: $activePromotion, title: $title, regularPrice: $regular_price, discountPercent: $discountPercent, highlights: $highlights, description: $description, images: $images, isPromoted: $isPromoted, promotedUntil: $promotedUntil, coupon: $coupon, totalViews: $totalViews, totalImpression: $totalImpression), subtitle: $subtitle, image: $image, price: $price, originalPrice: $originalPrice, duration: $duration)';
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
        other.regular_price == regular_price &&
        other.discountPercent == discountPercent &&
        listEquals(other.highlights, highlights) &&
        other.description == description &&
        listEquals(other.images, images) &&
        other.isPromoted == isPromoted &&
        other.promotedUntil == promotedUntil &&
        other.coupon == coupon &&
        other.totalViews == totalViews &&
        other.subtitle == subtitle &&
        other.image == image &&
        other.price == price &&
        other.originalPrice == originalPrice &&
        other.duration == duration &&
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
        regular_price.hashCode ^
        discountPercent.hashCode ^
        highlights.hashCode ^
        description.hashCode ^
        images.hashCode ^
        isPromoted.hashCode ^
        promotedUntil.hashCode ^
        coupon.hashCode ^
        totalViews.hashCode ^
        totalImpression.hashCode ^
        subtitle.hashCode ^
        image.hashCode ^
        price.hashCode ^
        originalPrice.hashCode ^
        duration.hashCode;
  }

  // ADD THIS METHOD HERE
  String get promotionCountdown {
    if (promotedUntil == null) return '';

    final now = DateTime.now();
    final difference = promotedUntil!.toLocal().difference(now);

    if (difference.isNegative) {
      return "Expired";
    }

    int days = difference.inDays;
    int hours = difference.inHours.remainder(24);
    int minutes = difference.inMinutes.remainder(60);
    int seconds = difference.inSeconds.remainder(60);

    return "${days}d ${hours}h ${minutes}m ${seconds}s";
  }

  static double afterDiscountPrice(double regularPrice, double discountPercent) {
    return regularPrice - (regularPrice * discountPercent / 100);
  }
}
