// To parse this JSON data, do
//
//     final selectedMenuItem = selectedMenuItemFromJson(jsonString);

import 'dart:convert';

SelectedMenuItem selectedMenuItemFromJson(String str) =>
    SelectedMenuItem.fromJson(json.decode(str));

String selectedMenuItemToJson(SelectedMenuItem data) =>
    json.encode(data.toJson());

class SelectedMenuItem {
  SelectedMenuItem({
    this.responseCode,
    this.responseText,
    this.responseData,
  });

  int responseCode;
  String responseText;
  List<ResponseDatum> responseData;

  factory SelectedMenuItem.fromJson(Map<String, dynamic> json) =>
      SelectedMenuItem(
        responseCode: json["ResponseCode"],
        responseText: json["ResponseText"],
        responseData: List<ResponseDatum>.from(
            json["ResponseData"].map((x) => ResponseDatum.fromJson(x))),
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
    this.storeId,
    this.categoryId,
    this.subcategoryId,
    this.menuId,
    this.menuVariantId,
    this.deviceToken,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.quantity,
    this.note,
    this.extras,
    this.totalTime,
    this.menuData,
    this.menuVariant,
  });

  int id;
  int storeId;
  int categoryId;
  int subcategoryId;
  int menuId;
  int menuVariantId;
  dynamic deviceToken;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;
  int quantity;
  dynamic note;
  String extras;
  dynamic totalTime;
  MenuData menuData;
  MenuVariant menuVariant;

  factory ResponseDatum.fromJson(Map<String, dynamic> json) => ResponseDatum(
        id: json["id"],
        storeId: json["store_id"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        menuId: json["menu_id"],
        menuVariantId:
            json["menu_variant_id"] == null ? null : json["menu_variant_id"],
        deviceToken: json["device_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        quantity: json["quantity"],
        note: json["note"],
        extras: json["extras"],
        totalTime: json["totalTime"],
        menuData: MenuData.fromJson(json["menu_data"]),
        menuVariant: json["menu_variant"] == null
            ? null
            : MenuVariant.fromJson(json["menu_variant"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "menu_id": menuId,
        "menu_variant_id": menuVariantId == null ? null : menuVariantId,
        "device_token": deviceToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_id": userId,
        "quantity": quantity,
        "note": note,
        "extras": extras,
        "totalTime": totalTime,
        "menu_data": menuData.toJson(),
        "menu_variant": menuVariant == null ? null : menuVariant.toJson(),
      };
}

class MenuData {
  MenuData({
    this.id,
    this.storeId,
    this.itemName,
    this.price,
    this.discount,
    this.image,
    this.menuImagePath,
    this.minPrice,
  });

  int id;
  int storeId;
  String itemName;
  dynamic price;
  int discount;
  String image;
  String menuImagePath;
  String minPrice;

  factory MenuData.fromJson(Map<String, dynamic> json) => MenuData(
        id: json["id"],
        storeId: json["store_id"],
        itemName: json["item_name"],
        price: json["price"],
        discount: json["discount"] == null ? null : json["discount"],
        image: json["image"],
        menuImagePath: json["menu_image_path"],
        minPrice: json["min_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "item_name": itemName,
        "price": price,
        "discount": discount == null ? null : discount,
        "image": image,
        "menu_image_path": menuImagePath,
        "min_price": minPrice,
      };
}

class MenuVariant {
  MenuVariant({
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
  String name;
  double price;
  String image;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String finalPrice;
  String fullImagePath;

  factory MenuVariant.fromJson(Map<String, dynamic> json) => MenuVariant(
        id: json["id"],
        storeId: json["store_id"],
        menuId: json["menu_id"],
        name: json["name"] == null ? null : json["name"],
        price: json["price"].toDouble(),
        image: json["image"] == null ? null : json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        finalPrice: json["final_price"],
        fullImagePath:
            json["full_image_path"] == null ? null : json["full_image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "menu_id": menuId,
        "name": name == null ? null : name,
        "price": price,
        "image": image == null ? null : image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "final_price": finalPrice,
        "full_image_path": fullImagePath == null ? null : fullImagePath,
      };
}
