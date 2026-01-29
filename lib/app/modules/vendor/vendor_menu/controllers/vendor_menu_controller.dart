import 'package:get/get.dart';

class VendorMenuController extends GetxController {
  VendorMenuController();

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  String get obj => _obj.value;
}
