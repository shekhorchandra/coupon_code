// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DealMediaModel {
  final int id;
  final String imageUrl;
  final bool isPrimary;

  const DealMediaModel({required this.id, required this.imageUrl, required this.isPrimary});

  DealMediaModel copyWith({int? id, String? imageUrl, bool? isPrimary}) {
    return DealMediaModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      isPrimary: isPrimary ?? this.isPrimary,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'imageUrl': imageUrl, 'isPrimary': isPrimary};
  }

  factory DealMediaModel.fromMap(Map<String, dynamic> map) {
    return DealMediaModel(
      id: map['id'] ?? 0,
      imageUrl: map['imageUrl'] ?? '',
      isPrimary: map['isPrimary'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory DealMediaModel.fromJson(String source) =>
      DealMediaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DealMediaModel(id: $id, imageUrl: $imageUrl, isPrimary: $isPrimary)';

  @override
  bool operator ==(covariant DealMediaModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.imageUrl == imageUrl && other.isPrimary == isPrimary;
  }

  @override
  int get hashCode => id.hashCode ^ imageUrl.hashCode ^ isPrimary.hashCode;
}
