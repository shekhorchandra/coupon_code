import 'package:get/get.dart';

class CreateVendorAccountController extends GetxController {
  CreateVendorAccountController();

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  String get obj => _obj.value;
}
