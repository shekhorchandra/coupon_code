import 'package:get/get.dart';

class VendorDetailsController extends GetxController {
  var selectedTab = 0.obs;

  // Dummy active deals
  var deals = [
    {
      "image": "https://img.freepik.com/premium-photo/woman-shampoo-wash-salon-with-hairdresser-basin-cleaning-hygiene-foam-wellness-people-service-soak-with-soap-hair-care-with-helping-hand-cosmetic-change-growth_590464-506368.jpg?semt=ais_user_personalization&w=740&q=80",
      "title": "Hair Spa Offer",
      "subtitle": "Get 30% off on premium hair spa",
    },
    {
      "image": "https://www.snip.co.in/wp-content/uploads/2025/10/is-hair-spa-good-1.webp",
      "title": "Hair Spa Service",
      "subtitle": "Exclusive Hair Spa Service package discount",
    },
  ].obs;

  // Dummy outlets
  var outlets = [
    {"name": "Outlet 1 - Dhanmondi, B block, Dhaka, Bangladesh", "lat": 23.746, "lng": 90.376},
    {"name": "Outlet 2 - Gulshan, G block, Dhaka, Bangladesh", "lat": 23.780, "lng": 90.419},
    {"name": "Outlet 3 - Uttara, D block, Dhaka, Bangladesh", "lat": 23.880, "lng": 90.396},
  ].obs;

  // Currently selected outlet
  var selectedOutlet = Rx<Map<String, dynamic>?>(null);

  void selectOutlet(Map<String, dynamic> outlet) {
    selectedOutlet.value = outlet;
  }

  void changeTab(int index) {
    selectedTab.value = index;
  }
}