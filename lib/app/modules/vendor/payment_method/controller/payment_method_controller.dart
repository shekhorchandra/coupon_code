import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  PaymentMethodController();

  Rx<int> selectedPaymentMethod = (-1).obs;
}
