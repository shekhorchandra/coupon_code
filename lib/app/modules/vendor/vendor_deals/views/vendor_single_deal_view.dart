import 'package:cached_network_image/cached_network_image.dart';
import 'package:coupon_code/app/core/values/app_color.dart';
import 'package:coupon_code/app/core/values/app_sizes.dart';
import 'package:coupon_code/app/core/values/app_text.dart';
import 'package:coupon_code/app/core/widgets/App_button.dart';
import 'package:coupon_code/app/core/widgets/app_chip.dart';
import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/core/widgets/section_heading.dart';
import 'package:coupon_code/app/data/models/deal_model_dto.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/views/widgets/overview_card.dart';
import 'package:coupon_code/app/modules/vendor/vendor_dashboard/views/widgets/overview_chart.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorSingleDealView extends StatelessWidget {
  const VendorSingleDealView({super.key, required this.deal});

  final DealModelDTO deal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Deal Details'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.screenPadding),
        child: Column(
          children: [
            // Header
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Hero(
                    tag: 'top-deals-grid-${deal.id}',
                    child: CachedNetworkImage(imageUrl: deal.images.first, fit: BoxFit.cover),
                  ),
                ),

                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .start,
                    children: [
                      AppChip(text: deal.activePromotion ?? false ? 'Active' : 'Expired'),
                      const SizedBox(height: 10),
                      Text(deal.title, overflow: .ellipsis, maxLines: 3, style: AppText.body1.bold),
                    ],
                  ),
                ),
              ],
            ),

            // Price row
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "\$${DealModelDTO.afterDiscountPrice(deal.regularPrice, deal.discountPercent).toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "\$${deal.regularPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: AppButton(
                    text: 'Edit Details',
                    leading: Icon(Icons.edit_rounded),
                    height: 50,
                    onPressed: () => Get.toNamed(AppRoutes.UPDATE_DEAL, arguments: {'deal': deal}),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Discount and countdown
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "${deal.discountPercent.toStringAsFixed(0)}% off",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                if (deal.promotedUntil != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.withAlpha(45),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(10),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      '${deal.promotedUntil}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        fontSize: 14,
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 5),
            Divider(),
            const SizedBox(height: 5),

            // Analytics cards
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.4,
              children: [
                OverviewCard(title: 'Impressions', number: '${deal.totalImpression}'),
                OverviewCard(title: 'Views', number: '${deal.totalViews}'),
                OverviewCard(title: 'CTR', number: '20%'), // TODO: fix this value
              ],
            ),

            // Deals overview graph
            SectionHeading(title: "Deal Overview", subtitle: "last 7 days"),
            const SizedBox(height: 10),

            OverviewChart(),
          ],
        ),
      ),
    );
  }
}
