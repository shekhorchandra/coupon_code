import 'package:get/get.dart';

class SaveItem {
  final String imagePath;
  final String title;
  final String subtitle;
  final double price;
  final double originalPrice;
  final String duration;
  final bool isAvailable;
  final String Status;

  SaveItem({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.originalPrice,
    required this.duration,
    required this.isAvailable,
    required this.Status,
  });
}

class SavesController extends GetxController {
  SavesController();
  var selectedTab = 0.obs; // 0 = All, 1 = Available, 2 = Expired

  // Sample data
  var savesList = <SaveItem>[
    SaveItem(
      imagePath: 'assets/images/makeup.jpg',
      title: 'The Ultimate Radiance Revival: Luxurious Facial...',
      subtitle: 'Glamour Glow Salon',
      price: 29,
      originalPrice: 50,
      duration: '10d   08h',
      isAvailable: true,
        Status: "Available",
    ),
    SaveItem(
      imagePath: 'assets/images/makeup.jpg',
      title: 'Relaxing Spa Day & Massage Treatment',
      subtitle: 'Bliss Spa',
      price: 40,
      originalPrice: 75,
      duration: '5d    12h',
      isAvailable: false,
      Status: "Expired",
    ),
  ].obs;

  // Filtered lists
  List<SaveItem> get all => savesList;
  List<SaveItem> get available =>
      savesList.where((item) => item.isAvailable).toList();
  List<SaveItem> get expired =>
      savesList.where((item) => !item.isAvailable).toList();

  void changeTab(int index) {
    selectedTab.value = index;
  }
}
