// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DealCategoryModel {
  final int id;
  final String name;

  DealCategoryModel({required this.id, required this.name});

  DealCategoryModel copyWith({int? id, String? name}) {
    return DealCategoryModel(id: id ?? this.id, name: name ?? this.name);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name};
  }

  factory DealCategoryModel.fromMap(Map<String, dynamic> map) {
    return DealCategoryModel(id: map['id'] ?? 0, name: map['name'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory DealCategoryModel.fromJson(String source) =>
      DealCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DealCategoryModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant DealCategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
