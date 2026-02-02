import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/data/models/payment_method_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  String getMaskedNumber(String number) {
    if (number.length <= 4) return number;
    final masked = '*' * (number.length - 4) + number.substring(number.length - 4);
    return masked.replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          border: BoxBorder.all(color: AppColor.border),
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(paymentMethod.icon),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(paymentMethod.name, style: AppText.body1.semiBold),
                    Text(
                      getMaskedNumber(paymentMethod.number),
                      style: AppText.body1.medium.copyWith(color: Color(0xFF7D7D7D)),
                    ),
                  ],
                ),
              ],
            ),

            PopupMenuButton<String>(
              color: AppColor.cardBackground,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              onSelected: (value) {
                if (value == 'delete') {
                  debugPrint('Delete button pressed!');

                  // TODO: Add delete logic
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete_outline_rounded, color: AppColor.error),
                      const SizedBox(width: 10),
                      Text('Delete', style: AppText.body2.medium.copyWith(color: AppColor.error)),
                    ],
                  ),
                ),
              ],
              child: InkWell(
                // onTap: () {},
                borderRadius: BorderRadius.circular(50),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.more_vert_rounded, size: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
