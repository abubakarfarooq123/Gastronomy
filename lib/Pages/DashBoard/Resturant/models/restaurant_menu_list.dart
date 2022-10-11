// To parse this JSON data, do
//
//     final RestaurantMenuList = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

RestaurantMenuList restaurantMenuListFromJson(String str) =>
    RestaurantMenuList.fromJson(json.decode(str));

String restaurantMenuListToJson(RestaurantMenuList data) =>
    json.encode(data.toJson());

class RestaurantMenuList {
  RestaurantMenuList({
    this.responseCode,
    this.responseText,
    this.responseData,
  });

  int responseCode;
  String responseText;
  List<ResponseDatum> responseData;

  factory RestaurantMenuList.fromJson(Map<String, dynamic> json) =>
      RestaurantMenuList(
        responseCode:
            json["ResponseCode"] == null ? null : json["ResponseCode"],
        responseText:
            json["ResponseText"] == null ? null : json["ResponseText"],
        responseData: json["ResponseData"] == null
            ? null
            : List<ResponseDatum>.from(
                json["ResponseData"].map((x) => ResponseDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ResponseCode": responseCode == null ? null : responseCode,
        "ResponseText": responseText == null ? null : responseText,
        "ResponseData": responseData == null
            ? null
            : List<dynamic>.from(responseData.map((x) => x.toJson())),
      };
}

class ResponseDatum {
  ResponseDatum({
    this.id,
    this.storeId,
    this.description,
    this.itemName,
    this.price,
    this.discountType,
    this.discount,
    this.isPopular,
    this.image,
    this.rating,
    this.variants,
    this.menuImagePath,
    this.minPrice,
    this.menuExtras,
    this.menuAddition,
  });

  int id;
  int storeId;
  String description;
  String itemName;
  dynamic price;
  String discountType;
  dynamic discount;
  String isPopular;
  String image;
  String rating;
  List<Variant> variants;
  String menuImagePath;
  String minPrice;
  List<MenuExtra> menuExtras;
  List<MenuAddition> menuAddition;

  factory ResponseDatum.fromJson(Map<String, dynamic> json) => ResponseDatum(
        id: json["id"] == null ? null : json["id"],
        storeId: json["store_id"] == null ? null : json["store_id"],
        description: json["description"] == null ? null : json["description"],
        itemName: json["item_name"] == null ? null : json["item_name"],
        price: json["price"],
        discountType:
            json["discount_type"] == null ? null : json["discount_type"],
        discount: json["discount"],
        isPopular: json["is_popular"] == null ? null : json["is_popular"],
        image: json["image"] == null ? null : json["image"],
        rating: json["rating"] == null ? null : json["rating"],
        variants: json["variants"] == null
            ? null
            : List<Variant>.from(
                json["variants"].map((x) => Variant.fromJson(x))),
        menuImagePath:
            json["menu_image_path"] == null ? null : json["menu_image_path"],
        minPrice: json["min_price"] == null ? null : json["min_price"],
        menuExtras: json["menu_extras"] == null
            ? null
            : List<MenuExtra>.from(
                json["menu_extras"].map((x) => MenuExtra.fromJson(x))),
        menuAddition: json["menu_addition"] == null
            ? null
            : List<MenuAddition>.from(
                json["menu_addition"].map((x) => MenuAddition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "store_id": storeId == null ? null : storeId,
        "description": description == null ? null : description,
        "item_name": itemName == null ? null : itemName,
        "price": price,
        "discount_type": discountType == null ? null : discountType,
        "discount": discount,
        "is_popular": isPopular == null ? null : isPopular,
        "image": image == null ? null : image,
        "rating": rating == null ? null : rating,
        "variants": variants == null
            ? null
            : List<dynamic>.from(variants.map((x) => x.toJson())),
        "menu_image_path": menuImagePath == null ? null : menuImagePath,
        "min_price": minPrice == null ? null : minPrice,
        "menu_extras": menuExtras == null
            ? null
            : List<dynamic>.from(menuExtras.map((x) => x.toJson())),
        "menu_addition": menuAddition == null
            ? null
            : List<dynamic>.from(menuAddition.map((x) => x.toJson())),
      };
}

class MenuAddition {
  MenuAddition({
    this.id,
    this.storeId,
    this.title,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int id;
  int storeId;
  String title;
  String type;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  MenuAdditionPivot pivot;

  factory MenuAddition.fromJson(Map<String, dynamic> json) => MenuAddition(
        id: json["id"] == null ? null : json["id"],
        storeId: json["store_id"] == null ? null : json["store_id"],
        title: json["title"] == null ? null : json["title"],
        type: json["type"] == null ? null : json["type"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null
            ? null
            : MenuAdditionPivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "store_id": storeId == null ? null : storeId,
        "title": title == null ? null : title,
        "type": type == null ? null : type,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "pivot": pivot == null ? null : pivot.toJson(),
      };
}

class MenuAdditionPivot {
  MenuAdditionPivot({
    this.menuId,
    this.storeAdditionId,
  });

  int menuId;
  int storeAdditionId;

  factory MenuAdditionPivot.fromJson(Map<String, dynamic> json) =>
      MenuAdditionPivot(
        menuId: json["menu_id"] == null ? null : json["menu_id"],
        storeAdditionId: json["store_addition_id"] == null
            ? null
            : json["store_addition_id"],
      );

  Map<String, dynamic> toJson() => {
        "menu_id": menuId == null ? null : menuId,
        "store_addition_id": storeAdditionId == null ? null : storeAdditionId,
      };
}

class MenuExtra {
  MenuExtra({
    this.id,
    this.storeId,
    this.title,
    this.price,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.pivot,
    this.isCheck,
  });

  int id;
  int storeId;
  String title;
  int price;
  String type;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  MenuExtraPivot pivot;
  bool isCheck;

  factory MenuExtra.fromJson(Map<String, dynamic> json) => MenuExtra(
        id: json["id"] == null ? null : json["id"],
        storeId: json["store_id"] == null ? null : json["store_id"],
        title: json["title"] == null ? null : json["title"],
        price: json["price"] == null ? null : json["price"],
        type: json["type"] == null ? null : json["type"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null
            ? null
            : MenuExtraPivot.fromJson(json["pivot"]),
        isCheck: json["isCheck"] == null ? null : json["isCheck"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "store_id": storeId == null ? null : storeId,
        "title": title == null ? null : title,
        "price": price == null ? null : price,
        "type": type == null ? null : type,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "pivot": pivot == null ? null : pivot.toJson(),
        "isCheck": isCheck == null ? null : isCheck,
      };
}

class MenuExtraPivot {
  MenuExtraPivot({
    this.menuId,
    this.storeExtraId,
  });

  int menuId;
  int storeExtraId;

  factory MenuExtraPivot.fromJson(Map<String, dynamic> json) => MenuExtraPivot(
        menuId: json["menu_id"] == null ? null : json["menu_id"],
        storeExtraId:
            json["store_extra_id"] == null ? null : json["store_extra_id"],
      );

  Map<String, dynamic> toJson() => {
        "menu_id": menuId == null ? null : menuId,
        "store_extra_id": storeExtraId == null ? null : storeExtraId,
      };
}

class Variant {
  Variant({
    this.id,
    this.storeId,
    this.menuId,
    this.name,
    this.price,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.finalPrice,
    this.fullImagePath,
  });

  int id;
  int storeId;
  int menuId;
  dynamic name;
  double price;
  dynamic image;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String finalPrice;
  dynamic fullImagePath;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"] == null ? null : json["id"],
        storeId: json["store_id"] == null ? null : json["store_id"],
        menuId: json["menu_id"] == null ? null : json["menu_id"],
        name: json["name"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        image: json["image"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        finalPrice: json["final_price"] == null ? null : json["final_price"],
        fullImagePath: json["full_image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "store_id": storeId == null ? null : storeId,
        "menu_id": menuId == null ? null : menuId,
        "name": name,
        "price": price == null ? null : price,
        "image": image,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "final_price": finalPrice == null ? null : finalPrice,
        "full_image_path": fullImagePath,
      };
}
