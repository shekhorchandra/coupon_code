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
    final deal = json['deal'] ?? json; // API wraps deal under 'deal'
    final shop = json['shop'] ?? {};

    return DealCardModel(
      id: deal['_id'],
      shopId: json['_id'] ?? '', // shop id can be top level
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