// To parse this JSON data, do
//
//     final subCategory = subCategoryFromJson(jsonString);

import 'dart:convert';

SubCategory subCategoryFromJson(String str) => SubCategory.fromJson(json.decode(str));

String subCategoryToJson(SubCategory data) => json.encode(data.toJson());

class SubCategory {
  SubCategory({
    this.responseCode,
    this.responseText,
    this.responseData,
  });

  int responseCode;
  String responseText;
  List<ResponseDatum> responseData;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    responseCode: json["ResponseCode"],
    responseText: json["ResponseText"],
    responseData: List<ResponseDatum>.from(json["ResponseData"].map((x) => ResponseDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ResponseCode": responseCode,
    "ResponseText": responseText,
    "ResponseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
  };
}

class ResponseDatum {
  ResponseDatum({
    this.id,
    this.name,
    this.status,
    this.storeId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String status;
  int storeId;
  DateTime createdAt;
  DateTime updatedAt;

  factory ResponseDatum.fromJson(Map<String, dynamic> json) => ResponseDatum(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    storeId: json["store_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "store_id": storeId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
