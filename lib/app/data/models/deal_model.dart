// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../modules/user/discover_bar/coupon_code/model/CouponOption_model.dart';

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
  final List<String>? tags;
  final bool? isPromoted;
  final DateTime? promotedUntil;
  final String? coupon;
  final int totalViews;
  final int totalImpression;
  final double? distance;
  final String? website;
  final String? address;
  final String? businessName;
  final CouponOption? couponOption;

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
    this.tags,
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
    this.couponOption,
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
    List<String>? tags,
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
    CouponOption? couponOption,
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
      tags: tags ?? this.tags,
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
      couponOption: couponOption ?? this.couponOption,
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
      'tags': tags,
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
      'coupon_option': couponOption != null
          ? {'qr': couponOption!.qr, 'upc': couponOption!.upc}
          : null,
    };
  }

  factory DealModel.fromMap(Map<String, dynamic> map) {
    // 1. Safe parsing for Lists
    List<String> parseStringList(dynamic list) {
      if (list == null || list is! List) return [];
      return list.map((e) => e.toString()).toList();
    }

    final imagesList = parseStringList(map['images']);
    final tagsList = parseStringList(map['tags']);
    final highlightList = parseStringList(map['highlight']);

    // 2. Safe parsing for Outlets (The JSON key is 'available_in_outlet')
    final outlets = map['available_outlet'] as List?;
    String? address;
    double? distance;

    if (outlets != null && outlets.isNotEmpty) {
      // Check if first element is a Map before accessing it
      if (outlets.first is Map) {
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
    }

    // 3. Handle 'shop' being either a String (ID) or a Map (Populated object)
    final shopData = map['shop'];
    String? shopId;
    String? businessName;
    String? website;

    if (shopData is Map) {
      shopId = shopData['_id']?.toString();
      businessName = shopData['business_name']?.toString();
      website = shopData['website']?.toString();
    } else {
      shopId = shopData?.toString();
    }

    // Use 'reguler_price' as per your JSON spelling
    final double regPrice = (map['reguler_price'] ?? 0).toDouble();
    final double disc = (map['discount'] ?? 0).toDouble();

    CouponOption? couponOption;
    if (map['coupon_option'] != null && map['coupon_option'] is Map) {
      couponOption = CouponOption.fromMap(map['coupon_option']);
    }

    return DealModel(
      id: map['_id']?.toString() ?? '',
      shopId: shopId ?? '',
      userId: map['user']?.toString() ?? '',
      categoryId: map['category']?.toString() ?? '',
      activePromotion: map['activePromotion']?.toString(),
      title: map['title']?.toString() ?? '',
      regular_price: regPrice,
      discountPercent: disc,
      highlights: highlightList,
      description: map['description']?.toString() ?? '',
      tags: tagsList,
      images: imagesList,
      isPromoted: map['isPromoted'] as bool? ?? false,
      promotedUntil: map['promotedUntil'] != null
          ? DateTime.tryParse(map['promotedUntil'].toString())
          : null,
      coupon: map['coupon']?.toString() ?? '',
      totalViews: map['total_views'] ?? 0,
      totalImpression: map['total_impression'] ?? 0,
      website: website,
      address: address,
      distance: distance,
      businessName: businessName ?? '',
      subtitle: map['description']?.toString() ?? '',
      image: imagesList.isNotEmpty ? imagesList.first : '',
      price: DealModel.afterDiscountPrice(regPrice, disc),
      originalPrice: regPrice,
      duration: "N/A",
      couponOption: couponOption,
    );
  }

  String toJson() => json.encode(toMap());

  factory DealModel.fromJson(String source) =>
      DealModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DealModel(id: $id, shopId: $shopId, userId: $userId, categoryId: $categoryId, activePromotion: $activePromotion, title: $title, regularPrice: $regular_price, discountPercent: $discountPercent, highlights: $highlights, description: $description, tags: $tags images: $images, isPromoted: $isPromoted, promotedUntil: $promotedUntil, coupon: $coupon, totalViews: $totalViews, totalImpression: $totalImpression), subtitle: $subtitle, image: $image, price: $price, originalPrice: $originalPrice, duration: $duration)';
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
        listEquals(other.tags, tags) &&
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
        tags.hashCode ^
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
