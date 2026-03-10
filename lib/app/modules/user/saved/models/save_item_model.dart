class SaveItem {
  final String id;
  final String title;
  final String businessName;
  final String imagePath;
  final double price;
  final double originalPrice;
  final bool isAvailable;
  final String status;

  SaveItem({
    required this.id,
    required this.title,
    required this.businessName,
    required this.imagePath,
    required this.price,
    required this.originalPrice,
    required this.isAvailable,
    required this.status,
  });

  // fromJson
  factory SaveItem.fromJson(Map<String, dynamic> json) {
    return SaveItem(
      id: json['id'] as String,
      title: json['title'] as String,
      businessName: json['businessName'] as String,
      imagePath: json['imagePath'] as String,
      price: (json['price'] as num).toDouble(),
      originalPrice: (json['originalPrice'] as num).toDouble(),
      isAvailable: json['isAvailable'] as bool,
      status: json['status'] as String,
    );
  }

  // toJson
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
    };
  }
}