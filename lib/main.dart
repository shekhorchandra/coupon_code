import 'package:coupon_code/app/core/theme/checkbox_theme.dart';
import 'package:coupon_code/app/data/services/notification_service.dart';
import 'package:coupon_code/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/values/app_strings.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Handle FCM messages while in background
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

  runApp(const CouponDiscountApp());
}

class CouponDiscountApp extends StatelessWidget {
  const CouponDiscountApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        checkboxTheme: checkboxTheme,
        fontFamily: 'FontMain',
      ),
      initialRoute: AppRoutes.SPLASH,
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
