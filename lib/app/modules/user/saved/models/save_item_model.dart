class SaveItem {
  final String id;
  final String title;
  final String subtitle;
  final String imagePath;
  final double price;
  final double originalPrice;
  final String duration;
  final bool isAvailable;
  final String status;

  SaveItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.price,
    required this.originalPrice,
    required this.duration,
    required this.isAvailable,
    required this.status,
  });

  // fromJson
  factory SaveItem.fromJson(Map<String, dynamic> json) {
    return SaveItem(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      imagePath: json['imagePath'] as String,
      price: (json['price'] as num).toDouble(),
      originalPrice: (json['originalPrice'] as num).toDouble(),
      duration: json['duration'] as String,
      isAvailable: json['isAvailable'] as bool,
      status: json['status'] as String,
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'imagePath': imagePath,
      'price': price,
      'originalPrice': originalPrice,
      'duration': duration,
      'isAvailable': isAvailable,
      'status': status,
    };
  }
}