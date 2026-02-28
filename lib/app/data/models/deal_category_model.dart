import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DealCategoryModel {
  final String id;
  final String categoryName;
  final String? categoryImage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;
  DealCategoryModel({
    required this.id,
    required this.categoryName,
    this.categoryImage,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
  });

  DealCategoryModel copyWith({
    String? id,
    String? categoryName,
    String? categoryImage,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    return DealCategoryModel(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
      categoryImage: categoryImage ?? this.categoryImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categoryName': categoryName,
      'categoryImage': categoryImage,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'isDeleted': isDeleted,
    };
  }

  factory DealCategoryModel.fromMap(Map<String, dynamic> map) {
    return DealCategoryModel(
      id: map['_id'] as String,
      categoryName: map['categoryName'] as String,
      categoryImage: map['categoryImage'] != null ? map['categoryImage'] as String : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      isDeleted: map['isDeleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DealCategoryModel.fromJson(String source) =>
      DealCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DealCategoryModel(id: $id, categoryName: $categoryName, categoryImage: $categoryImage, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(covariant DealCategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.categoryName == categoryName &&
        other.categoryImage == categoryImage &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categoryName.hashCode ^
        categoryImage.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        isDeleted.hashCode;
  }
}
