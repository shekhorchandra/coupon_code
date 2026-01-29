import 'package:get/get.dart';

class VendorDashboardController extends GetxController {
  VendorDashboardController();

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  String get obj => _obj.value;
}
