// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class LocationModel {
  String type;
  List<double> coordinates;

  LocationModel({required this.type, required this.coordinates});

  LocationModel copyWith({String? type, List<double>? coordinates}) {
    return LocationModel(type: type ?? this.type, coordinates: coordinates ?? this.coordinates);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'type': type, 'coordinates': coordinates};
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      type: map['type'] as String,
      coordinates: List<double>.from((map['coordinates'] as List<double>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) =>
      LocationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LocationModel(type: $type, coordinates: $coordinates)';

  @override
  bool operator ==(covariant LocationModel other) {
    if (identical(this, other)) return true;

    return other.type == type && listEquals(other.coordinates, coordinates);
  }

  @override
  int get hashCode => type.hashCode ^ coordinates.hashCode;
}
