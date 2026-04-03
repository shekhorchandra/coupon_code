// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DealPlanModel {
  final int id;
  final String name;
  final String? description;
  final String? icon;
  final double price;
  final bool isCustom;
  final double? pricePerDay;

  DealPlanModel({
    required this.id,
    required this.name,
    this.description,
    this.icon,
    required this.price,
    this.isCustom = false,
    this.pricePerDay,
  });

  DealPlanModel copyWith({
    int? id,
    String? name,
    String? description,
    String? icon,
    double? price,
    bool? isCustom,
    double? pricePerDay,
  }) {
    return DealPlanModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      price: price ?? this.price,
      isCustom: isCustom ?? this.isCustom,
      pricePerDay: pricePerDay ?? this.pricePerDay,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'icon': icon,
      'price': price,
      'isCustom': isCustom,
      'pricePerDay': pricePerDay,
    };
  }

  factory DealPlanModel.fromMap(Map<String, dynamic> map) {
    return DealPlanModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] != null ? map['description'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
      price: map['price'] as double,
      isCustom: map['isCustom'] as bool,
      pricePerDay: map['pricePerDay'] != null ? map['pricePerDay'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DealPlanModel.fromJson(String source) =>
      DealPlanModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DealPlanModel(id: $id, name: $name, description: $description, icon: $icon, price: $price, isCustom: $isCustom, pricePerDay: $pricePerDay)';
  }

  @override
  bool operator ==(covariant DealPlanModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.icon == icon &&
        other.price == price &&
        other.isCustom == isCustom &&
        other.pricePerDay == pricePerDay;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        icon.hashCode ^
        price.hashCode ^
        isCustom.hashCode ^
        pricePerDay.hashCode;
  }
}
