class CategoryDealModel {
  final String id;
  final String title;
  final double price;
  final double discount;
  final List<String> images;
  final String businessName;
  final String businessLogo;
  final double distance;
  final DateTime? promotedUntil;

  CategoryDealModel({
    required this.id,
    required this.title,
    required this.price,
    required this.discount,
    required this.images,
    required this.businessName,
    required this.businessLogo,
    required this.distance,
    this.promotedUntil,
  });

  factory CategoryDealModel.fromJson(Map<String, dynamic> json) {
    return CategoryDealModel(
      id: json["deal"]["_id"] ?? "",
      title: json["deal"]["title"] ?? "",
      price: (json["deal"]["reguler_price"] ?? 0).toDouble(),
      discount: (json["deal"]["discount"] ?? 0).toDouble(),
      images: List<String>.from(json["deal"]["images"] ?? []),
      businessName: json["shop"]["business_name"] ?? "",
      businessLogo: json["shop"]["business_logo"] ?? "",
      distance: (json["distance"] ?? 0).toDouble(),
      promotedUntil: json["deal"]["promotedUntil"] != null
          ? DateTime.parse(json["deal"]["promotedUntil"])
          : null,
    );
  }



  /// Final price after discount
  double get finalPrice => price - (price * discount / 100);
}