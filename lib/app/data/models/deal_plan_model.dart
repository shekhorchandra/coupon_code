// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DealPlanModel {
  final int id;
  final String name;
  final String? description;
  final double price;

  DealPlanModel({required this.id, required this.name, this.description, required this.price});

  DealPlanModel copyWith({int? id, String? name, String? description, double? price}) {
    return DealPlanModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'description': description, 'price': price};
  }

  factory DealPlanModel.fromMap(Map<String, dynamic> map) {
    return DealPlanModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] as num? ?? 0.0).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DealPlanModel.fromJson(String source) =>
      DealPlanModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DealPlanModel(id: $id, name: $name, description: $description, price: $price)';
  }

  @override
  bool operator ==(covariant DealPlanModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode ^ price.hashCode;
  }
}
