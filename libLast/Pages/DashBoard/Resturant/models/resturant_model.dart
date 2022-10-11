import 'package:get/get.dart';

class ResturantModel {
  int id;
  int userId;
  String storeName;
  String storeDescription;
  String storeProfile;
  String storeBanner;
  String storeStatus;
  String storeAddress;
  String categoryId;
  String storeActivePlan;
  String isValue;
  String latitude;
  String longitude;
  int storeDelivery;
  int storeDeliveryCost;
  String storeMinDeliveryTime;
  int storeMinOrderAmount;
  String deliveryAreaRadius;
  var favourite = false.obs;
  String categoryName;
  String avgRating;
  int totalFeedback;
  bool discountFlag;
  String discount;
  String storeBannerImagePath;
  String storeProfileImagePath;
  List<StoreCategory> storeCategory;
  List<StoreGallery> storeGallery;

  ResturantModel(
      {this.id,
      this.userId,
      this.storeName,
      this.storeDescription,
      this.storeProfile,
      this.storeBanner,
      this.storeStatus,
      this.storeAddress,
      this.categoryId,
      this.storeActivePlan,
      this.isValue,
      this.latitude,
      this.longitude,
      this.storeDelivery,
      this.storeDeliveryCost,
      this.storeMinDeliveryTime,
      this.storeMinOrderAmount,
      this.deliveryAreaRadius,
      this.favourite,
      this.categoryName,
      this.avgRating,
      this.totalFeedback,
      this.discountFlag,
      this.discount,
      this.storeBannerImagePath,
      this.storeProfileImagePath,
      this.storeCategory,
      this.storeGallery});

  ResturantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    storeName = json['store_name'];
    storeDescription = json['store_description'];
    storeProfile = json['store_profile'];
    storeBanner = json['store_banner'];
    storeStatus = json['store_status'];
    storeAddress = json['store_address'];
    categoryId = json['category_id'];
    storeActivePlan = json['store_active_plan'];
    isValue = json['is_value'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    storeDelivery = json['store_delivery'];
    storeDeliveryCost = json['store_delivery_cost'];
    storeMinDeliveryTime = json['store_min_delivery_time'];
    storeMinOrderAmount = json['store_min_order_amount'];
    deliveryAreaRadius = json['delivery_area_radius'];
    favourite.value = json['favourite'];
    categoryName = json['category_name'];
    avgRating = json['avg_rating'];
    totalFeedback = json['total_feedback'];
    discountFlag = json['discount_flag'];
    discount = json['discount'];
    storeBannerImagePath = json['store_banner_image_path'];
    storeProfileImagePath = json['store_profile_image_path'];
    if (json['store_category'] != null) {
      storeCategory = <StoreCategory>[];
      json['store_category'].forEach((v) {
        storeCategory.add(new StoreCategory.fromJson(v));
      });
    }
    if (json['store_gallery'] != null) {
      storeGallery = <StoreGallery>[];
      json['store_gallery'].forEach((v) {
        storeGallery.add(new StoreGallery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['store_name'] = this.storeName;
    data['store_description'] = this.storeDescription;
    data['store_profile'] = this.storeProfile;
    data['store_banner'] = this.storeBanner;
    data['store_status'] = this.storeStatus;
    data['store_address'] = this.storeAddress;
    data['category_id'] = this.categoryId;
    data['store_active_plan'] = this.storeActivePlan;
    data['is_value'] = this.isValue;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['store_delivery'] = this.storeDelivery;
    data['store_delivery_cost'] = this.storeDeliveryCost;
    data['store_min_delivery_time'] = this.storeMinDeliveryTime;
    data['store_min_order_amount'] = this.storeMinOrderAmount;
    data['delivery_area_radius'] = this.deliveryAreaRadius;
    data['favourite'] = this.favourite;
    data['category_name'] = this.categoryName;
    data['avg_rating'] = this.avgRating;
    data['total_feedback'] = this.totalFeedback;
    data['discount_flag'] = this.discountFlag;
    data['discount'] = this.discount;
    data['store_banner_image_path'] = this.storeBannerImagePath;
    data['store_profile_image_path'] = this.storeProfileImagePath;
    if (this.storeCategory != null) {
      data['store_category'] =
          this.storeCategory.map((v) => v.toJson()).toList();
    }
    if (this.storeGallery != null) {
      data['store_gallery'] = this.storeGallery.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StoreCategory {
  int id;
  int storeId;
  int categoryId;
  String name;

  StoreCategory({this.id, this.storeId, this.categoryId, this.name});

  StoreCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    categoryId = json['category_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store_id'] = this.storeId;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    return data;
  }
}

class StoreGallery {
  int id;
  int storeId;
  String file;
  String fileType;
  String createdAt;
  String updatedAt;
  String storeGalleryImagePath;

  StoreGallery(
      {this.id,
      this.storeId,
      this.file,
      this.fileType,
      this.createdAt,
      this.updatedAt,
      this.storeGalleryImagePath});

  StoreGallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    file = json['file'];
    fileType = json['file_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    storeGalleryImagePath = json['store_gallery_image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store_id'] = this.storeId;
    data['file'] = this.file;
    data['file_type'] = this.fileType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['store_gallery_image_path'] = this.storeGalleryImagePath;
    return data;
  }
}
