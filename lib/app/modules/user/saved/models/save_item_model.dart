import 'dart:ui';

class SaveItem {
  final String id;
  final String title;
  final String businessName;
  final String imagePath;
  final double price; // price after discount
  final double originalPrice; // regular price
  final bool isAvailable;
  final String status;
  final DateTime? promotedUntil;


  SaveItem({
    required this.id,
    this.title = '',
    this.businessName = '',
    this.imagePath = '',
    this.price = 0.0,
    this.originalPrice = 0.0,
    this.isAvailable = false,
    this.status = 'Normal',
    this.promotedUntil,

  });

  // Create SaveItem from API JSON
  factory SaveItem.fromJson(Map<String, dynamic> json) {
    final promotedUntil = json['promotedUntil'] != null
        ? DateTime.tryParse(json['promotedUntil'])
        : null;

    // Parse regular price
    final double regularPrice = (json['reguler_price'] ?? 0).toDouble();

    // Parse discount as percentage
    final double discountPercent = (json['discount'] ?? 0).toDouble();

    // Calculate price after discount
    final double discountedPrice =
        regularPrice - (regularPrice * discountPercent / 100);

    return SaveItem(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      businessName: json['shop']?['business_name'] ?? '',
      imagePath: (json['images'] as List<dynamic>?)?.isNotEmpty == true
          ? json['images'][0]
          : json['shop']?['business_logo'] ?? '',
      price: discountedPrice,
      originalPrice: regularPrice,
      isAvailable: promotedUntil != null
          ? promotedUntil.isAfter(DateTime.now())
          : false,
      status: json['isPromoted'] == true ? 'Promoted' : 'Normal',
      promotedUntil: promotedUntil,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'businessName': businessName,
      'imagePath': imagePath,
      'price': price,
      'originalPrice': originalPrice,
      'isAvailable': isAvailable,
      'status': status,
      'promotedUntil': promotedUntil?.toIso8601String(),
    };
  }
}