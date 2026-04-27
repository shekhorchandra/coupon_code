import 'package:coupon_code/app/core/theme/checkbox_theme.dart';
import 'package:coupon_code/app/data/services/deep_link_service.dart';
import 'package:coupon_code/app/data/services/notification_service.dart';
import 'package:coupon_code/app/data/services/storage_service.dart';
import 'package:coupon_code/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'app/core/values/app_strings.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load .env
  await dotenv.load(fileName: ".env");

  // Firebase initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Get Storage initialization
  await StorageService().init();

  // Handle FCM messages while in background
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

  // Deep Link Initialization
  DeepLinkService().init();

  runApp(const CouponDiscountApp());
}

class CouponDiscountApp extends StatefulWidget {
  const CouponDiscountApp({super.key});

  @override
  State<CouponDiscountApp> createState() => _CouponDiscountAppState();
}

class _CouponDiscountAppState extends State<CouponDiscountApp> {
  // void refreshEverything() {
  //   if (mounted) {
  //     setState(() {
  //       print("!!! GLOBAL REBUILD TRIGGERED !!!");
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 1), () => refreshEverything());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        checkboxTheme: checkboxTheme,
        fontFamily: 'FontMain',
      ),
      initialRoute: AppRoutes.SPLASH,
      // initialRoute: AppRoutes.PURCHASE_TEST,
      // initialRoute: AppRoutes.DEAL_PLAN,
      getPages: AppPages.pages,
    );
  }
}

// Handle background notifications
@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  // If using Firebase services in background, you must initialize Firebase here:
  await Firebase.initializeApp();

  print('Background message Title: ${message.notification?.title}');
  print('Background message Body: ${message.notification?.body}');

  await NotificationService().showNotification(message);
}
