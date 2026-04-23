import 'package:coupon_code/app/core/values/app_assets.dart';
import 'package:coupon_code/app/data/models/payment_method_model.dart';

final List<dynamic> mockPaymentMethod = [
  PaymentMethodModel(
    id: 1,
    name: 'Visa',
    number: '4242424242424242',
    icon: AppAssets.visaPaymentMethod,
  ),
  PaymentMethodModel(
    id: 2,
    name: 'Discover',
    number: '6011111111111117',
    icon: AppAssets.discoverPaymentMethod,
  ),
  PaymentMethodModel(
    id: 3,
    name: 'PayPal',
    number: 'testuser@paypal.com',
    icon: AppAssets.paypalPaymentMethod,
  ),
];
