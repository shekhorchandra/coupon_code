import 'package:get/get.dart';

class VendorAccountController extends GetxController {
  VendorAccountController();

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  String get obj => _obj.value;
}
