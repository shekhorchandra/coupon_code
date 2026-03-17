import 'package:coupon_code/app/core/widgets/common_app_bar.dart';
import 'package:coupon_code/app/data/models/notification_model.dart';
import 'package:coupon_code/app/modules/vendor/notification/controllers/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? userId = Get.parameters['userId'];
    final ScrollController scrollController = ScrollController();

    // Fetch data and setup listener
    if (userId != null) {
      controller.fetchNotifications(userId);
      scrollController.addListener(() {
        if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
          controller.loadMoreNotifications(userId);
        }
      });
    }

    if (userId == null) {
      return const Scaffold(body: Center(child: Text('User ID is missing')));
    }

    controller.fetchNotifications(userId);

    return Scaffold(
      appBar: CommonAppBar(title: 'Notifications'),
      body: Obx(() {
        if (controller.isLoading.value && controller.notifications.isEmpty) {
          return _buildShimmerList();
        }

        if (controller.notifications.isEmpty) {
          return _buildEmptyState();
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchNotifications(userId),
          child: ListView.separated(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemCount: controller.notifications.length + (controller.isLoading.value ? 1 : 0),
            separatorBuilder: (context, index) =>
                const Divider(height: 1, indent: 70, color: Color(0xFFEDF2F7)),
            itemBuilder: (context, index) {
              if (index == controller.notifications.length) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                );
              }

              final notification = controller.notifications[index];
              return _NotificationTile(notification: notification);
            },
          ),
        );
      }),
    );
  }

  // --- Helper Widgets ---

  Widget _buildShimmerList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListTile(
          leading: const CircleAvatar(backgroundColor: Colors.white),
          title: Container(height: 12, color: Colors.white, width: 150),
          subtitle: Container(height: 10, color: Colors.white, width: double.infinity),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_none_rounded, size: 100, color: Colors.blueGrey[100]),
          const SizedBox(height: 16),
          const Text(
            "Inbox is empty",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final NotificationModel notification;

  const _NotificationTile({required this.notification});

  @override
  Widget build(BuildContext context) {
    // Determine style based on type
    final typeData = _getTypeDetails(notification.type);

    return Container(
      // color: notification.isRead == false ? Colors.blue.withOpacity(0.03) : Colors.transparent,
      child: ListTile(
        onTap: () {},
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Stack(
          children: [
            CircleAvatar(
              backgroundColor: typeData.color.withOpacity(0.15),
              child: Icon(typeData.icon, color: typeData.color, size: 20),
            ),
            if (notification.isRead == false)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
          ],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                notification.title ?? 'No Title',
                style: TextStyle(
                  fontWeight: notification.isRead == false ? FontWeight.bold : FontWeight.w500,
                  fontSize: 15,
                ),
                maxLines: 2,
                overflow: .ellipsis,
              ),
            ),
            Text(
              timeago.format(DateTime.parse(notification.createdAt!)),
              style: TextStyle(fontSize: 11, color: Colors.grey[500]),
              overflow: .ellipsis,
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              notification.body ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey[700], fontSize: 13, height: 1.3),
            ),
            const SizedBox(height: 4),
            Text(
              DateFormat('MMM dd, yyyy • hh:mm a').format(DateTime.parse(notification.createdAt!)),
              style: TextStyle(fontSize: 10, color: Colors.grey[400]),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to get Icons and Colors based on the Enum
  _TypeDetails _getTypeDetails(NotificationType? type) {
    switch (type) {
      case NotificationType.SHOP:
        return _TypeDetails(Icons.shopping_bag_outlined, Colors.orange);
      case NotificationType.PROMOTE:
        return _TypeDetails(Icons.campaign_outlined, Colors.purple);
      case NotificationType.REMINDER:
        return _TypeDetails(Icons.alarm, Colors.blue);
      case NotificationType.PAYMENT:
        return _TypeDetails(Icons.account_balance_wallet_outlined, Colors.green);
      case NotificationType.SYSTEM:
      default:
        return _TypeDetails(Icons.settings_suggest_outlined, Colors.blueGrey);
    }
  }
}

class _TypeDetails {
  final IconData icon;
  final Color color;
  _TypeDetails(this.icon, this.color);
}
