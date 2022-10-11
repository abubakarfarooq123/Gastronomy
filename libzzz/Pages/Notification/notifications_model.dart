// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.responseCode,
    this.reponseText,
    this.responseData,
  });

  int responseCode;
  String reponseText;
  List<ResponseDatum> responseData;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        responseCode: json["ResponseCode"],
        reponseText: json["ReponseText"],
        responseData: List<ResponseDatum>.from(
            json["ResponseData"].map((x) => ResponseDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ResponseCode": responseCode,
        "ReponseText": reponseText,
        "ResponseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
      };
}

class ResponseDatum {
  ResponseDatum({
    this.id,
    this.title,
    this.description,
    this.type,
    this.appointmentId,
    this.storeId,
    this.userId,
    this.other,
    this.visibleFor,
    this.createdAt,
    this.updatedAt,
    this.timeago,
  });

  int id;
  String title;
  String description;
  String type;
  String appointmentId;
  String storeId;
  String userId;
  String other;
  String visibleFor;
  DateTime createdAt;
  DateTime updatedAt;
  String timeago;

  factory ResponseDatum.fromJson(Map<String, dynamic> json) => ResponseDatum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        type: json["type"],
        appointmentId: json["appointment_id"],
        storeId: json["store_id"],
        userId: json["user_id"],
        other: json["other"],
        visibleFor: json["visible_for"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        timeago: json["timeago"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "type": type,
        "appointment_id": appointmentId,
        "store_id": storeId,
        "user_id": userId,
        "other": other,
        "visible_for": visibleFor,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "timeago": timeago,
      };
}
