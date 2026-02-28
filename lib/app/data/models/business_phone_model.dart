// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BusinessPhoneModel {
  String countryCode;
  String phoneNumber;

  BusinessPhoneModel({required this.countryCode, required this.phoneNumber});

  BusinessPhoneModel copyWith({String? countryCode, String? phoneNumber}) {
    return BusinessPhoneModel(
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'countryCode': countryCode, 'phoneNumber': phoneNumber};
  }

  factory BusinessPhoneModel.fromMap(Map<String, dynamic> map) {
    return BusinessPhoneModel(
      countryCode: map['countryCode'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessPhoneModel.fromJson(String source) =>
      BusinessPhoneModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BusinessPhoneModel(countryCode: $countryCode, phoneNumber: $phoneNumber)';

  @override
  bool operator ==(covariant BusinessPhoneModel other) {
    if (identical(this, other)) return true;

    return other.countryCode == countryCode && other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode => countryCode.hashCode ^ phoneNumber.hashCode;
}
