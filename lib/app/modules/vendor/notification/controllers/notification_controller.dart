import 'package:coupon_code/app/data/models/notification_model.dart';
import 'package:coupon_code/app/data/network/dio_client.dart';
import 'package:coupon_code/app/modules/services/contants/api_constants.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  DioClient _dioClient = DioClient();

  // Variables to track notifications and pagination
  RxList<NotificationModel> notifications = <NotificationModel>[].obs;
  RxBool isLoading = false.obs;
  RxInt page = 1.obs;
  RxInt limit = 10.obs;
  RxInt unreadCount = 0.obs;

  // Fetch notifications with pagination
  Future<void> fetchNotifications(String userId, {bool isLoadMore = false}) async {
    if (isLoading.value) return; // Prevent multiple API calls simultaneously

    isLoading.value = true;

    try {
      final response = await _dioClient.client.get(
        ApiConstants.notifications,
        queryParameters: {"userId": userId, "page": page.value, "limit": limit.value},
      );

      if (response.statusCode == 200) {
        if (isLoadMore) {
          // If it's a load more request, append new data to the existing list
          var newNotifications = (response.data['data']['notifications'] as List)
              .map((e) => NotificationModel.fromJson(e))
              .toList();
          notifications.addAll(newNotifications);
        } else {
          // If it's the initial request, reset the list
          var newNotifications = (response.data['data']['notifications'] as List)
              .map((e) => NotificationModel.fromJson(e))
              .toList();
          notifications.value = newNotifications;
        }

        // Update unread count if needed
        unreadCount.value = response.data['data']['unreadCount'] ?? 0;
      } else {
        Get.snackbar('Error', 'Failed to fetch notifications!');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Method to load more notifications
  void loadMoreNotifications(String userId) {
    page.value += 1; // Increase page number
    fetchNotifications(userId, isLoadMore: true);
  }
}
