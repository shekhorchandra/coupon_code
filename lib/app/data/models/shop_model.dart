class ShopModel {
  String? sId;
  String? vendor;
  String? businessName;
  String? businessEmail;
  BusinessPhone? businessPhone;
  String? businessLogo;
  String? description;
  String? shopApproval;
  String? website;
  String? createdAt;
  String? updatedAt;
  List<Outlets>? outlets;

  ShopModel({
    this.sId,
    this.vendor,
    this.businessName,
    this.businessEmail,
    this.businessPhone,
    this.businessLogo,
    this.description,
    this.shopApproval,
    this.website,
    this.createdAt,
    this.updatedAt,
    this.outlets,
  });

  ShopModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    vendor = json['vendor'];
    businessName = json['business_name'];
    businessEmail = json['business_email'];
    businessPhone = json['business_phone'] != null
        ? new BusinessPhone.fromJson(json['business_phone'])
        : null;
    businessLogo = json['business_logo'];
    description = json['description'];
    shopApproval = json['shop_approval'];
    website = json['website'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['outlets'] != null) {
      outlets = <Outlets>[];
      json['outlets'].forEach((v) {
        outlets!.add(new Outlets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['vendor'] = this.vendor;
    data['business_name'] = this.businessName;
    data['business_email'] = this.businessEmail;
    if (this.businessPhone != null) {
      data['business_phone'] = this.businessPhone!.toJson();
    }
    data['business_logo'] = this.businessLogo;
    data['description'] = this.description;
    data['shop_approval'] = this.shopApproval;
    data['website'] = this.website;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.outlets != null) {
      data['outlets'] = this.outlets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BusinessPhone {
  String? countryCode;
  String? phoneNumber;

  BusinessPhone({this.countryCode, this.phoneNumber});

  BusinessPhone.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.countryCode;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}

class Outlets {
  String? sId;
  String? name;
  String? address;
  String? zipCode;
  Location? location;
  bool? isActive;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Outlets({
    this.sId,
    this.name,
    this.address,
    this.zipCode,
    this.location,
    this.isActive,
    this.iV,
    this.createdAt,
    this.updatedAt,
  });

  Outlets.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['outlet_name'];
    address = json['address'];
    zipCode = json['zip_code'];
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
    isActive = json['isActive'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['zip_code'] = this.zipCode;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['isActive'] = this.isActive;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}
