// To parse this JSON data, do
//
//     final AboutFacilites = AboutFacilitesFromJson(jsonString);

import 'dart:convert';

AboutFacilites AboutFacilitesFromJson(String str) =>
    AboutFacilites.fromJson(json.decode(str));

String AboutFacilitesToJson(AboutFacilites data) => json.encode(data.toJson());

class AboutFacilites {
  AboutFacilites({
    this.responseCode,
    this.responseText,
    this.responseData,
  });

  int responseCode;
  String responseText;
  List<ResponseAbout> responseData;

  factory AboutFacilites.fromJson(Map<String, dynamic> json) => AboutFacilites(
        responseCode: json["ResponseCode"],
        responseText: json["ResponseText"],
        responseData: List<ResponseAbout>.from(
            json["ResponseData"].map((x) => ResponseAbout.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ResponseCode": responseCode,
        "ResponseText": responseText,
        "ResponseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
      };
}

class ResponseAbout {
  ResponseAbout({
    this.id,
    this.name,
    this.image,
    this.status,
    this.fullImagePath,
  });

  int id;
  String name;
  String image;
  String status;
  String fullImagePath;

  factory ResponseAbout.fromJson(Map<String, dynamic> json) => ResponseAbout(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
        fullImagePath: json["full_image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": status,
        "full_image_path": fullImagePath,
      };
}
