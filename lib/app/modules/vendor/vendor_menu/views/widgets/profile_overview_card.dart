import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/app_circular_avatar.dart';
import 'package:coupon_code/app/modules/vendor/vendor_menu/controllers/vendor_menu_controller.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileOverviewCard extends StatelessWidget {
  const ProfileOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(VendorMenuController());

    return GestureDetector(
      onTap: () => Get.toNamed(
        AppRoutes.CREATE_VENDOR_ACCOUNT,
        parameters: {'shopId': menuController.businessId.value}, // TODO: shop id is not passing
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFFf6f7fd),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              children: [
                // Shop Logo
                SizedBox(
                  width: 60,
                  height: 60,
                  child: AppCircularAvatar(imageUrl: menuController.businessLogo.value),
                ),

                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      menuController.businessName.value,
                      style: AppText.h4.semiBold,
                      overflow: .ellipsis,
                    ),
                    Text(
                      menuController.businessEmail.value,
                      style: AppText.body2.medium,
                      overflow: .ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
