import 'dart:convert';

NotificationsModel notificationsModelFromMap(String str) =>
    NotificationsModel.fromMap(json.decode(str));

String notificationsModelToMap(NotificationsModel data) =>
    json.encode(data.toMap());

class NotificationsModel {
  NotificationsModel({
    this.responseCode,
    this.reponseText,
    this.responseData,
  });

  int responseCode;
  String reponseText;
  List<ResponseDatum> responseData;

  factory NotificationsModel.fromMap(Map<String, dynamic> json) =>
      NotificationsModel(
        responseCode: json["ResponseCode"],
        reponseText: json["ReponseText"],
        responseData: List<ResponseDatum>.from(
            json["ResponseData"].map((x) => ResponseDatum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "ResponseCode": responseCode,
        "ReponseText": reponseText,
        "ResponseData": List<dynamic>.from(responseData.map((x) => x.toMap())),
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
    this.appointment,
  });

  int id;
  String title;
  String description;
  Type type;
  String appointmentId;
  String storeId;
  String userId;
  String other;
  VisibleFor visibleFor;
  DateTime createdAt;
  DateTime updatedAt;
  String timeago;
  Appointment appointment;

  factory ResponseDatum.fromMap(Map<String, dynamic> json) => ResponseDatum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        type: typeValues.map[json["type"]],
        appointmentId: json["appointment_id"],
        storeId: json["store_id"],
        userId: json["user_id"],
        other: json["other"],
        visibleFor: visibleForValues.map[json["visible_for"]],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        timeago: json["timeago"],
        appointment: json["appointment"] == null
            ? null
            : Appointment.fromMap(json["appointment"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "type": typeValues.reverse[type],
        "appointment_id": appointmentId,
        "store_id": storeId,
        "user_id": userId,
        "other": other,
        "visible_for": visibleForValues.reverse[visibleFor],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "timeago": timeago,
        "appointment": appointment == null ? null : appointment.toMap(),
      };
}

class Appointment {
  Appointment({
    this.id,
    this.appointmentId,
    this.storeId,
    this.storeEmpId,
    this.serviceId,
    this.serviceName,
    this.empName,
    this.storeName,
    this.storeProfileImagePath,
  });

  int id;
  int appointmentId;
  int storeId;
  int storeEmpId;
  int serviceId;
  String serviceName;
  String empName;
  String storeName;
  String storeProfileImagePath;

  factory Appointment.fromMap(Map<String, dynamic> json) => Appointment(
        id: json["id"],
        appointmentId: json["appointment_id"],
        storeId: json["store_id"],
        storeEmpId: json["store_emp_id"],
        serviceId: json["service_id"],
        serviceName: json["service_name"],
        empName: json["emp_name"],
        storeName: json["store_name"],
        storeProfileImagePath: json["store_profile_image_path"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "appointment_id": appointmentId,
        "store_id": storeId,
        "store_emp_id": storeEmpId,
        "service_id": serviceId,
        "service_name": serviceName,
        "emp_name": empName,
        "store_name": storeName,
        "store_profile_image_path": storeProfileImagePath,
      };
}

enum Type { REVIEW_REQUEST, APPOINTMENT, RATING, CUSTOMER_REQUEST }

final typeValues = EnumValues({
  "appointment": Type.APPOINTMENT,
  "customer_request": Type.CUSTOMER_REQUEST,
  "rating": Type.RATING,
  "review_request": Type.REVIEW_REQUEST
});

enum VisibleFor { USERS }

final visibleForValues = EnumValues({"users": VisibleFor.USERS});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
