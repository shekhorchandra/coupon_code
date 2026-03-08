class SaveItem {
  final String id;
  final String imagePath;
  final String title;
  final String subtitle;
  final double price;
  final double originalPrice;
  final String duration;
  final bool isAvailable;
  final String status;

  SaveItem({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.originalPrice,
    required this.duration,
    required this.isAvailable,
    required this.status,
  });

  factory SaveItem.fromJson(Map<String, dynamic> json) {
    return SaveItem(
      id: json['_id'],
      imagePath: json['images'] != null && json['images'].isNotEmpty
          ? json['images'][0]
          : "",
      title: json['title'] ?? "",
      subtitle: "Shop", // API didn't return shop name
      price: (json['reguler_price'] ?? 0).toDouble(),
      originalPrice: (json['reguler_price'] ?? 0).toDouble(),
      duration: "Active",
      isAvailable: json['coupon'] != null,
      status: json['coupon'] != null ? "Available" : "Expired",
    );
  }
}