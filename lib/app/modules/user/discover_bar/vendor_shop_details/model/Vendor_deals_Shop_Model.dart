
class VendorDetailsModel {
  final String id;
  final String vendorId;
  final String businessName;
  final String businessEmail;
  final BusinessPhoneModel? businessPhone;
  final String businessLogo;
  final String description;
  final List<OutletModel> outlets;
  final List<DealModel> deals;

  VendorDetailsModel({
    required this.id,
    required this.vendorId,
    required this.businessName,
    required this.businessEmail,
    this.businessPhone,
    required this.businessLogo,
    required this.description,
    required this.outlets,
    required this.deals,
  });

  factory VendorDetailsModel.fromJson(Map<String, dynamic> json) {
    return VendorDetailsModel(
      id: json['_id'] ?? '',
      vendorId: json['vendor'] ?? '',
      businessName: json['business_name'] ?? '',
      businessEmail: json['business_email'] ?? '',
      businessPhone: json['business_phone'] != null
          ? BusinessPhoneModel.fromJson(json['business_phone'])
          : null,
      businessLogo: json['business_logo'] ?? '',
      description: json['description'] ?? '',
      outlets: (json['outlets'] as List? ?? [])
          .map((e) => OutletModel.fromJson(e ?? {}))
          .toList(),

      deals: (json['deals'] as List? ?? [])
          .map((e) => DealModel.fromJson(e ?? {}))
          .toList(),
    );
  }
}

class BusinessPhoneModel {
  final String countryCode;
  final String phoneNumber;

  BusinessPhoneModel({
    required this.countryCode,
    required this.phoneNumber,
  });

  factory BusinessPhoneModel.fromJson(Map<String, dynamic> json) {
    return BusinessPhoneModel(
      countryCode: json['country_code'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
    );
  }
}

class OutletModel {
  final String id;
  final String name;
  final String address;
  final double lat;
  final double lng;

  OutletModel({
    required this.id,
    required this.name,
    required this.address,
    required this.lat,
    required this.lng,
  });

  factory OutletModel.fromJson(Map<String, dynamic> json) {

    final location = json['location'] ?? {};
    final coordinates = location['coordinates'] ?? [0.0, 0.0];

    return OutletModel(
      id: json['_id'] ?? '',
      name: json['outlet_name'] ?? 'Outlet',
      address: json['address'] ?? '',
      lng: (coordinates.isNotEmpty ? coordinates[0] : 0.0).toDouble(),
      lat: (coordinates.length > 1 ? coordinates[1] : 0.0).toDouble(),
    );
  }
}

class DealModel {
  final String id;
  final String shopId;
  final String title;
  final double originalPrice;
  final double price;
  final List<String> images;
  final bool isPromoted;
  final String remainingTime;

  DealModel({
    required this.id,
    required this.shopId,
    required this.title,
    required this.originalPrice,
    required this.price,
    required this.images,
    required this.isPromoted,
    required this.remainingTime,
  });

  factory DealModel.fromJson(Map<String, dynamic> json) {
    double regularPrice = (json['reguler_price'] ?? 0).toDouble();
    double discount = (json['discount'] ?? 0).toDouble();

    double price = regularPrice - (regularPrice * discount / 100);

    print("Shop ID------------///--------///---: $json['shop'] ?? json['_id']}");

    return DealModel(
      id: json['_id'] ?? '',
      shopId: json['shop'] ?? '',
      title: json['title'] ?? '',
      originalPrice: regularPrice,
      price: price,
      images: (json['images'] as List? ?? []).map((e) => e.toString()).toList(),
      isPromoted: json['isPromoted'] ?? false,
      remainingTime: _calculateRemainingTime(json['promotedUntil']),
    );
  }

  static String _calculateRemainingTime(String? date) {
    if (date == null) return "";

    final diff = DateTime.parse(date).difference(DateTime.now());

    if (diff.inHours <= 0) return "Expired";

    return "${diff.inHours}h left";
  }
}