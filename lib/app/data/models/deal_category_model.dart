import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DealCategoryModel {
  final String id;
  final String categoryName;
  final String? categoryImage;
  final bool isDeleted;
  DealCategoryModel({
    required this.id,
    required this.categoryName,
    this.categoryImage,
    required this.isDeleted,
  });

  DealCategoryModel copyWith({
    String? id,
    String? categoryName,
    String? categoryImage,
    bool? isDeleted,
  }) {
    return DealCategoryModel(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
      categoryImage: categoryImage ?? this.categoryImage,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categoryName': categoryName,
      'categoryImage': categoryImage,
      'isDeleted': isDeleted,
    };
  }

  factory DealCategoryModel.fromMap(Map<String, dynamic> map) {
    return DealCategoryModel(
      id: map['_id'] as String,
      categoryName: map['category_name'] as String,
      categoryImage: map['category_image'] != null ? map['category_image'] as String : null,
      isDeleted: map['isDeleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DealCategoryModel.fromJson(String source) =>
      DealCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DealCategoryModel(id: $id, categoryName: $categoryName, categoryImage: $categoryImage, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(covariant DealCategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.categoryName == categoryName &&
        other.categoryImage == categoryImage &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^ categoryName.hashCode ^ categoryImage.hashCode ^ isDeleted.hashCode;
  }
}
