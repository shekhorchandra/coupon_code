enum NotificationType { SHOP, PROMOTE, REMINDER, PAYMENT, SYSTEM }

class NotificationModel {
  String? sId;
  String? user;
  String? title;
  String? body;
  NotificationType? type;
  bool? isRead;
  String? entityId;
  String? webUrl;
  String? deepLink;
  Data? data;
  String? createdAt;
  String? updatedAt;

  NotificationModel({
    this.sId,
    this.user,
    this.title,
    this.body,
    this.type,
    this.isRead,
    this.entityId,
    this.webUrl,
    this.deepLink,
    this.data,
    this.createdAt,
    this.updatedAt,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    title = json['title'];
    body = json['body'];
    type = json['type'] != null
        ? NotificationType.values.firstWhere(
            (e) => e.toString().split('.').last == json['type'],
            orElse: () => NotificationType.SYSTEM,
          )
        : null;
    isRead = json['isRead'];
    entityId = json['entityId'];
    webUrl = json['webUrl'];
    deepLink = json['deepLink'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['title'] = this.title;
    data['body'] = this.body;
    data['type'] = this.type?.toString().split('.').last;
    data['isRead'] = this.isRead;
    data['entityId'] = this.entityId;
    data['webUrl'] = this.webUrl;
    data['deepLink'] = this.deepLink;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }

  DateTime get dateTime => createdAt != null ? DateTime.parse(createdAt!) : DateTime.now();
}

class Data {
  String? dealId;
  String? dealTitle;
  String? dealDescription;

  Data({this.dealId, this.dealTitle, this.dealDescription});

  Data.fromJson(Map<String, dynamic> json) {
    dealId = json['dealId'];
    dealTitle = json['dealTitle'];
    dealDescription = json['dealDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dealId'] = this.dealId;
    data['dealTitle'] = this.dealTitle;
    data['dealDescription'] = this.dealDescription;
    return data;
  }
}
