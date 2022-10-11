// To parse this JSON data, do
//
//     final ResturantMenu = ResturantMenuFromJson(jsonString);

import 'dart:convert';

ResturantMenu ResturantMenuFromJson(String str) =>
    ResturantMenu.fromJson(json.decode(str));

String ResturantMenuToJson(ResturantMenu data) => json.encode(data.toJson());

class ResturantMenu {
  ResturantMenu({
    this.responseCode,
    this.responseText,
    this.responseData,
  });

  int responseCode;
  String responseText;
  ResponseData responseData;

  factory ResturantMenu.fromJson(Map<String, dynamic> json) => ResturantMenu(
        responseCode:
            json["ResponseCode"] == null ? null : json["ResponseCode"],
        responseText:
            json["ResponseText"] == null ? null : json["ResponseText"],
        responseData: json["ResponseData"] == null
            ? null
            : ResponseData.fromJson(json["ResponseData"]),
      );

  Map<String, dynamic> toJson() => {
        "ResponseCode": responseCode == null ? null : responseCode,
        "ResponseText": responseText == null ? null : responseText,
        "ResponseData": responseData == null ? null : responseData.toJson(),
      };
}

class ResponseData {
  ResponseData({
    this.categoryData,
    this.subcategoryList,
    this.menuList,
  });

  List<CategoryDatum> categoryData;
  List<SubcategoryList> subcategoryList;
  MenuList menuList;

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
        categoryData: json["category_data"] == null
            ? null
            : List<CategoryDatum>.from(
                json["category_data"].map((x) => CategoryDatum.fromJson(x))),
        subcategoryList: json["subcategory_list"] == null
            ? null
            : List<SubcategoryList>.from(json["subcategory_list"]
                .map((x) => SubcategoryList.fromJson(x))),
        menuList: json["menu_list"] == null
            ? null
            : MenuList.fromJson(json["menu_list"]),
      );

  Map<String, dynamic> toJson() => {
        "category_data": categoryData == null
            ? null
            : List<dynamic>.from(categoryData.map((x) => x.toJson())),
        "subcategory_list": subcategoryList == null
            ? null
            : List<dynamic>.from(subcategoryList.map((x) => x.toJson())),
        "menu_list": menuList == null ? null : menuList.toJson(),
      };
}

class CategoryDatum {
  CategoryDatum({
    this.id,
    this.name,
    this.image,
    this.categoryType,
    this.categoryImagePath,
  });

  int id;
  String name;
  String image;
  String categoryType;
  String categoryImagePath;

  factory CategoryDatum.fromJson(Map<String, dynamic> json) => CategoryDatum(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
        categoryType:
            json["category_type"] == null ? null : json["category_type"],
        categoryImagePath: json["category_image_path"] == null
            ? null
            : json["category_image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
        "category_type": categoryType == null ? null : categoryType,
        "category_image_path":
            categoryImagePath == null ? null : categoryImagePath,
      };
}

class MenuList {
  MenuList({
    this.tomatoes,
    this.specials,
    this.chicken,
    this.newTest,
  });

  List<Chicken> tomatoes;
  List<Chicken> specials;
  List<Chicken> chicken;
  List<Chicken> newTest;

  factory MenuList.fromJson(Map<String, dynamic> json) => MenuList(
        tomatoes: json["tomatoes"] == null
            ? null
            : List<Chicken>.from(
                json["tomatoes"].map((x) => Chicken.fromJson(x))),
        specials: json["specials"] == null
            ? null
            : List<Chicken>.from(
                json["specials"].map((x) => Chicken.fromJson(x))),
        chicken: json["chicken"] == null
            ? null
            : List<Chicken>.from(
                json["chicken"].map((x) => Chicken.fromJson(x))),
        newTest: json["new test"] == null
            ? null
            : List<Chicken>.from(
                json["new test"].map((x) => Chicken.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tomatoes": tomatoes == null
            ? null
            : List<dynamic>.from(tomatoes.map((x) => x.toJson())),
        "specials": specials == null
            ? null
            : List<dynamic>.from(specials.map((x) => x.toJson())),
        "chicken": chicken == null
            ? null
            : List<dynamic>.from(chicken.map((x) => x.toJson())),
        "new test": newTest == null
            ? null
            : List<dynamic>.from(newTest.map((x) => x.toJson())),
      };
}

class Chicken {
  Chicken({
    this.id,
    this.storeId,
    this.itemName,
    this.price,
    this.discountType,
    this.discount,
    this.image,
    this.isPopular,
    this.rating,
    this.variants,
    this.menuImagePath,
    this.minPrice,
    this.pivot,
    this.menuExtras,
    this.menuAddition,
  });

  int id;
  int storeId;
  String itemName;
  dynamic price;
  String discountType;
  int discount;
  String image;
  String isPopular;
  String rating;
  List<Variant> variants;
  String menuImagePath;
  String minPrice;
  ChickenPivot pivot;
  List<MenuExtra> menuExtras;
  List<MenuAddition> menuAddition;

  factory Chicken.fromJson(Map<String, dynamic> json) => Chicken(
        id: json["id"] == null ? null : json["id"],
        storeId: json["store_id"] == null ? null : json["store_id"],
        itemName: json["item_name"] == null ? null : json["item_name"],
        price: json["price"],
        discountType:
            json["discount_type"] == null ? null : json["discount_type"],
        discount: json["discount"] == null ? null : json["discount"],
        image: json["image"] == null ? null : json["image"],
        isPopular: json["is_popular"] == null ? null : json["is_popular"],
        rating: json["rating"] == null ? null : json["rating"],
        variants: json["variants"] == null
            ? null
            : List<Variant>.from(
                json["variants"].map((x) => Variant.fromJson(x))),
        menuImagePath:
            json["menu_image_path"] == null ? null : json["menu_image_path"],
        minPrice: json["min_price"] == null ? null : json["min_price"],
        pivot:
            json["pivot"] == null ? null : ChickenPivot.fromJson(json["pivot"]),
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
        "item_name": itemName == null ? null : itemName,
        "price": price,
        "discount_type": discountType == null ? null : discountType,
        "discount": discount == null ? null : discount,
        "image": image == null ? null : image,
        "is_popular": isPopular == null ? null : isPopular,
        "rating": rating == null ? null : rating,
        "variants": variants == null
            ? null
            : List<dynamic>.from(variants.map((x) => x.toJson())),
        "menu_image_path": menuImagePath == null ? null : menuImagePath,
        "min_price": minPrice == null ? null : minPrice,
        "pivot": pivot == null ? null : pivot.toJson(),
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
  MenuAdditionType type;
  Status status;
  DateTime createdAt;
  DateTime updatedAt;
  MenuAdditionPivot pivot;

  factory MenuAddition.fromJson(Map<String, dynamic> json) => MenuAddition(
        id: json["id"] == null ? null : json["id"],
        storeId: json["store_id"] == null ? null : json["store_id"],
        title: json["title"] == null ? null : json["title"],
        type: json["type"] == null
            ? null
            : menuAdditionTypeValues.map[json["type"]],
        status:
            json["status"] == null ? null : statusValues.map[json["status"]],
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
        "type": type == null ? null : menuAdditionTypeValues.reverse[type],
        "status": status == null ? null : statusValues.reverse[status],
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

enum Status { ACTIVE }

final statusValues = EnumValues({"active": Status.ACTIVE});

enum MenuAdditionType { ALLERGY, ADDITIVE }

final menuAdditionTypeValues = EnumValues({
  "additive": MenuAdditionType.ADDITIVE,
  "allergy": MenuAdditionType.ALLERGY
});

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
  });

  int id;
  int storeId;
  String title;
  int price;
  MenuExtraType type;
  Status status;
  DateTime createdAt;
  DateTime updatedAt;
  MenuExtraPivot pivot;

  factory MenuExtra.fromJson(Map<String, dynamic> json) => MenuExtra(
        id: json["id"] == null ? null : json["id"],
        storeId: json["store_id"] == null ? null : json["store_id"],
        title: json["title"] == null ? null : json["title"],
        price: json["price"] == null ? null : json["price"],
        type:
            json["type"] == null ? null : menuExtraTypeValues.map[json["type"]],
        status:
            json["status"] == null ? null : statusValues.map[json["status"]],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null
            ? null
            : MenuExtraPivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "store_id": storeId == null ? null : storeId,
        "title": title == null ? null : title,
        "price": price == null ? null : price,
        "type": type == null ? null : menuExtraTypeValues.reverse[type],
        "status": status == null ? null : statusValues.reverse[status],
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "pivot": pivot == null ? null : pivot.toJson(),
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

enum MenuExtraType { FOOD, DRINK }

final menuExtraTypeValues =
    EnumValues({"drink": MenuExtraType.DRINK, "food": MenuExtraType.FOOD});

class ChickenPivot {
  ChickenPivot({
    this.storeTagId,
    this.menuId,
  });

  int storeTagId;
  int menuId;

  factory ChickenPivot.fromJson(Map<String, dynamic> json) => ChickenPivot(
        storeTagId: json["store_tag_id"] == null ? null : json["store_tag_id"],
        menuId: json["menu_id"] == null ? null : json["menu_id"],
      );

  Map<String, dynamic> toJson() => {
        "store_tag_id": storeTagId == null ? null : storeTagId,
        "menu_id": menuId == null ? null : menuId,
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
  Status status;
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
        status:
            json["status"] == null ? null : statusValues.map[json["status"]],
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
        "status": status == null ? null : statusValues.reverse[status],
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "final_price": finalPrice == null ? null : finalPrice,
        "full_image_path": fullImagePath,
      };
}

class SubcategoryList {
  SubcategoryList({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory SubcategoryList.fromJson(Map<String, dynamic> json) =>
      SubcategoryList(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}

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
