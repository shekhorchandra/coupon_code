class CategoryDealModel {
  final String id;
  final String title;
  final String shopId;
  final double price;
  final double discount;
  final List<String> images;
  final String shop;
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
    required this.shop,
    required this.shopId,
  });

  factory CategoryDealModel.fromJson(Map<String, dynamic> json) {
    final dealJson = json["deal"] ?? {};
    final shopJson = json["shop"] ?? {};

    print("Shop ID------------------: ${shopJson['_id']}"); // for debugging

    return CategoryDealModel(
      id: dealJson["_id"] ?? "",
      title: dealJson["title"] ?? "",
      price: (dealJson["reguler_price"] ?? 0).toDouble(),
      discount: (dealJson["discount"] ?? 0).toDouble(),
      images: List<String>.from(dealJson["images"] ?? []),
      shop: shopJson["_id"] ?? "",      // shop ID
      shopId: shopJson["_id"] ?? "",    // shopId
      businessName: shopJson["business_name"] ?? "",
      businessLogo: shopJson["business_logo"] ?? "",
      distance: (json["distance"] ?? 0).toDouble(),
      promotedUntil: dealJson["promotedUntil"] != null
          ? DateTime.parse(dealJson["promotedUntil"])
          : null,
    );
  }



  /// Final price after discount
  double get finalPrice => price - (price * discount / 100);
}