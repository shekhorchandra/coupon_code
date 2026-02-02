import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_sizes.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/data/mock_data/mock_payment_method.dart';
import 'package:coupon_code/app/modules/vendor/payment_method/view/widgets/payment_method_tile.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Payment Methods'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.screenPadding),
        child: Column(
          children: [
            // Payment methods list
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: mockPaymentMethod.length,
              itemBuilder: (context, index) {
                final paymentMethod = mockPaymentMethod[index];
                return PaymentMethodTile(paymentMethod: paymentMethod);
              },
            ),

            // Add new card
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () => Get.toNamed(AppRoutes.ADD_PAYMENT_METHOD),
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  radius: Radius.circular(100),
                  dashPattern: [15, 5],
                  strokeWidth: 2,
                  padding: EdgeInsets.all(20),
                  color: AppColor.border,
                ),
                child: Row(
                  children: [
                    Icon(Icons.add_rounded, color: AppColor.bw.s400),
                    const SizedBox(width: 5),
                    Text(
                      'Add new card',
                      style: AppText.body2.medium.copyWith(color: AppColor.bw.s400),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
