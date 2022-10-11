// To parse this JSON data, do
//
//     final RestaurantTypeModel = RestaurantTypeModelFromJson(jsonString);

import 'dart:convert';

// RestaurantTypeModel RestaurantTypeModelFromJson(String str) =>
//     RestaurantTypeModel.fromJson(json.decode(str));

// String RestaurantTypeModelToJson(RestaurantTypeModel data) =>
//     json.encode(data.toJson());

// class RestaurantTypeModel {
//   RestaurantTypeModel({
//     this.responseCode,
//     this.responseText,
//     this.responseData,
//   });

//   int responseCode;
//   String responseText;
//   List<RestaurantTypeModel> responseData;

//   factory RestaurantTypeModel.fromJson(Map<String, dynamic> json) =>
//       RestaurantTypeModel(
//         responseCode: json["ResponseCode"],
//         responseText: json["ResponseText"],
//         responseData: List<RestaurantTypeModel>.from(
//             json["ResponseData"].map((x) => RestaurantTypeModel.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "ResponseCode": responseCode,
//         "ResponseText": responseText,
//         "ResponseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
//       };
// }

class RestaurantTypeModel {
  RestaurantTypeModel({
    this.id,
    this.name,
    this.status,
  });

  int id;
  String name;
  String status;

  factory RestaurantTypeModel.fromJson(Map<String, dynamic> json) =>
      RestaurantTypeModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
      };
}
