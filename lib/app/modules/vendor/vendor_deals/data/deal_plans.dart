import 'package:coupon_code/app/core/values/app_assets.dart';
import 'package:coupon_code/app/data/models/deal_plan_model.dart';

final dealPlans = [
  DealPlanModel(
    id: 1,
    name: 'Quick Start Plan',
    description: 'Ideal for short-term promotion.',
    price: 10,
    icon: AppAssets.sevenDaysDeal,
  ),
  DealPlanModel(
    id: 2,
    name: 'Standard Plan',
    description: 'Great for two-week campaigns.',
    price: 15,
    icon: AppAssets.fourteenDaysDeal,
  ),
  DealPlanModel(
    id: 3,
    name: 'Premium Plan',
    description: 'Great for monthly campaigns.',
    price: 25,
    icon: AppAssets.thirtyDaysDeal,
  ),
];
