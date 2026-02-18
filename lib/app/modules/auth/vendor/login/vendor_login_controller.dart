import 'dart:convert';

import 'package:coupon_code/app/modules/services/Helper_status_code/HttpStatusHandler.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:coupon_code/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VendorLoginController extends GetxController {
  final obscure = true.obs;
  /// By default
  final emailController = TextEditingController(text:"shekhor@gmail.com").obs; // By default
  final passwordController = TextEditingController(text:"nayem@@Ahmed017").obs;
  // final isLoading = false.obs;



  Future<void> loginApi() async{
    try {

      final response = await http.post(Uri.parse(ApiConstants.baseUrl + ApiConstants.login),
      body: {
        "email": emailController.value.text,
        "password": passwordController.value.text,
      }
      );

      var data = jsonDecode(response.body);
      print(response.statusCode);
      print(data);

      if(response.statusCode == 200){
        Get.snackbar("Login Successful", "Congratulation");

        Get.offAllNamed(AppRoutes.VENDOR_NAVIGATION_BAR);

      }else{
        Get.snackbar(
          "Login Failed",
          HttpStatusHandler.getMessage(response.statusCode),
        );

      }

    }catch (e, stackTrace) {
      // Debug console (full error)
      debugPrint("Login Error: $e");
      debugPrint("StackTrace: $stackTrace");

      // User-friendly message
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
      );
    }

  }

  void togglePassword() {
    obscure.value = !obscure.value;
  }

}
