import 'package:get/get.dart';

class VendorNavigationBarController extends GetxController {
  VendorNavigationBarController();

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  String get obj => _obj.value;
}
