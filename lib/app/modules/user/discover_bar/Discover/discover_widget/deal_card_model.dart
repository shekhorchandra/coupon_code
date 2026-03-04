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
    return DealCardModel(
      id: json['_id'],
      shopId: json['shop']['_id'],
      shopName: json['shop']['business_name'],
      title: json['title'],
      regularPrice: (json['reguler_price'] ?? 0).toDouble(), // typo fix
      discountPercent: (json['discount'] ?? 0).toDouble(),
      isPromoted: json['isPromoted'] ?? false,
      promotedUntil: json['promotedUntil'] != null
          ? DateTime.parse(json['promotedUntil'])
          : null,
      distance: (json['distance'] ?? 0).toDouble(),
      images: List<String>.from(json['images'] ?? []),
    );
  }

  static double afterDiscountPrice(double price, double discount) {
    return price - (price * discount / 100);
  }
}