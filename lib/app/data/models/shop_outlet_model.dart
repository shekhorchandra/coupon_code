// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:coupon_code/app/data/models/location_model.dart';

class ShopOutletModel {
  String id;
  String shop;
  String address;
  String zipCode;
  LocationModel location;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;

  ShopOutletModel({
    required this.id,
    required this.shop,
    required this.address,
    required this.zipCode,
    required this.location,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  ShopOutletModel copyWith({
    String? id,
    String? shop,
    String? address,
    String? zipCode,
    LocationModel? location,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ShopOutletModel(
      id: id ?? this.id,
      shop: shop ?? this.shop,
      address: address ?? this.address,
      zipCode: zipCode ?? this.zipCode,
      location: location ?? this.location,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'shop': shop,
      'address': address,
      'zipCode': zipCode,
      'location': location.toMap(),
      'isActive': isActive,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory ShopOutletModel.fromMap(Map<String, dynamic> map) {
    return ShopOutletModel(
      id: map['_id'] as String,
      shop: map['shop'] as String,
      address: map['address'] as String,
      zipCode: map['zipCode'] as String,
      location: LocationModel.fromMap(map['location'] as Map<String, dynamic>),
      isActive: map['isActive'] as bool,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopOutletModel.fromJson(String source) =>
      ShopOutletModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShopOutletModel(id: $id, shop: $shop, address: $address, zipCode: $zipCode, location: $location, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant ShopOutletModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.shop == shop &&
        other.address == address &&
        other.zipCode == zipCode &&
        other.location == location &&
        other.isActive == isActive &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        shop.hashCode ^
        address.hashCode ^
        zipCode.hashCode ^
        location.hashCode ^
        isActive.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
