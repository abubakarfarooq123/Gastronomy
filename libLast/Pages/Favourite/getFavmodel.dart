// To parse this JSON data, do
//
//     final GetAllFav = GetAllFavFromJson(jsonString);

import 'dart:convert';

GetAllFav GetAllFavFromJson(String str) => GetAllFav.fromJson(json.decode(str));

String GetAllFavToJson(GetAllFav data) => json.encode(data.toJson());

class GetAllFav {
  GetAllFav({
    this.responseCode,
    this.reponseText,
    this.responseData,
  });

  int responseCode;
  String reponseText;
  List<ResponseDatum> responseData;

  factory GetAllFav.fromJson(Map<String, dynamic> json) => GetAllFav(
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
    this.userId,
    this.storeId,
    this.isValue,
    this.storeName,
    this.storeAddress,
    this.storeProfileImagePath,
    this.storeBannerImagePath,
    this.categoryName,
    this.categoryId,
    this.storeCategory,
    this.totalRating,
    this.avgRating,
    this.totalFeedback,
    this.discountFlag,
    this.discount,
    this.storeGallery,
  });

  int id;
  int userId;
  int storeId;
  String isValue;
  String storeName;
  String storeAddress;
  String storeProfileImagePath;
  String storeBannerImagePath;
  String categoryName;
  String categoryId;
  List<StoreCategory> storeCategory;
  String totalRating;
  String avgRating;
  int totalFeedback;
  bool discountFlag;
  String discount;
  List<dynamic> storeGallery;

  factory ResponseDatum.fromJson(Map<String, dynamic> json) => ResponseDatum(
        id: json["id"],
        userId: json["user_id"],
        storeId: json["store_id"],
        isValue: json["is_value"],
        storeName: json["store_name"],
        storeAddress: json["store_address"],
        storeProfileImagePath: json["store_profile_image_path"],
        storeBannerImagePath: json["store_banner_image_path"],
        categoryName: json["category_name"],
        categoryId: json["category_id"],
        storeCategory: List<StoreCategory>.from(
            json["store_category"].map((x) => StoreCategory.fromJson(x))),
        totalRating: json["total_rating"],
        avgRating: json["avg_rating"],
        totalFeedback: json["total_feedback"],
        discountFlag: json["discount_flag"],
        discount: json["discount"],
        storeGallery: List<dynamic>.from(json["store_gallery"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "store_id": storeId,
        "is_value": isValue,
        "store_name": storeName,
        "store_address": storeAddress,
        "store_profile_image_path": storeProfileImagePath,
        "store_banner_image_path": storeBannerImagePath,
        "category_name": categoryName,
        "category_id": categoryId,
        "store_category":
            List<dynamic>.from(storeCategory.map((x) => x.toJson())),
        "total_rating": totalRating,
        "avg_rating": avgRating,
        "total_feedback": totalFeedback,
        "discount_flag": discountFlag,
        "discount": discount,
        "store_gallery": List<dynamic>.from(storeGallery.map((x) => x)),
      };
}

class StoreCategory {
  StoreCategory({
    this.categoryId,
    this.name,
  });

  int categoryId;
  String name;

  factory StoreCategory.fromJson(Map<String, dynamic> json) => StoreCategory(
        categoryId: json["category_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "name": name,
      };
}
