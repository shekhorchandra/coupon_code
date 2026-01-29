import 'package:get/get.dart';

class VendorDealsController extends GetxController {
  VendorDealsController();

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  String get obj => _obj.value;
}
