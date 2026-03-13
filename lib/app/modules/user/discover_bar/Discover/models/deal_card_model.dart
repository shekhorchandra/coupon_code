class DealCardModel {
  final String id;
  final String shopId;
  final String shopName;
  final String title;
  final double regularPrice;
  final double discountPercent;
  final bool isPromoted;
  final DateTime? promotedUntil;
  final double distance;
  final List<String> images;

  DealCardModel({
    required this.id,
    required this.shopId,
    required this.shopName,
    required this.title,
    required this.regularPrice,
    required this.discountPercent,
    required this.isPromoted,
    this.promotedUntil,
    required this.distance,
    required this.images,
  });

  factory DealCardModel.fromJson(Map<String, dynamic> json) {
    final deal = json['deals'] ?? json;
    final shop = json['shop'] ?? {};
    // Print all relevant information
    print("===== DealCardModel.fromJson =====");
    print("Full JSON: $json");
    print("Deal JSON: $deal");
    print("Shop JSON: $shop");
    print("Deal ID: ${deal['_id']}");
    print("Shop ID------------------: ${deal['shop'] ?? json['_id']}");
    print("Shop Name: ${shop['business_name']}");
    print("Title: ${deal['title']}");
    print("Regular Price: ${deal['reguler_price']}");
    print("Discount Percent: ${deal['discount']}");
    print("Is Promoted: ${deal['isPromoted']}");
    print("Promoted Until: ${deal['promotedUntil']}");
    print("Distance: ${json['distance']}");
    print("Images: ${deal['images']}");

    return DealCardModel(
      id: deal['_id'],
      shopId: deal['shop']['_id'] ?? '',
      shopName: shop['business_name'] ?? '',
      title: deal['title'] ?? '',
      regularPrice: (deal['reguler_price'] ?? 0).toDouble(),
      discountPercent: (deal['discount'] ?? 0).toDouble(),
      isPromoted: deal['isPromoted'] ?? false,
      promotedUntil: deal['promotedUntil'] != null
          ? DateTime.parse(deal['promotedUntil'])
          : null,
      distance: (json['distance'] ?? 0).toDouble(),
      images: List<String>.from(deal['images'] ?? []),
    );
  }

  static double afterDiscountPrice(double price, double discount) {
    return price - (price * discount / 100);
  }
}