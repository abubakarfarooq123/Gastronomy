import 'package:get/get.dart';

class CatgoryData {
  int id;
  String name;
  String image;
  String categoryImagePath;

  CatgoryData({this.id, this.name, this.image, this.categoryImagePath});

  CatgoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    categoryImagePath = json['category_image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['category_image_path'] = this.categoryImagePath;
    return data;
  }

  static List<CatgoryData> getData(dynamic arrData) {
    List<CatgoryData> arrTemp = [];

    arrData.forEach((v) {
      arrTemp.add(new CatgoryData.fromJson(v));
    });

    return arrTemp;
  }
}

class TopRatedStore {
  int catId;
  int id;
  String storeName;
  String storeProfile;
  String storeBanner;
  String storeStatus;
  String categoryId;
  String avgRating;
  int avgRatingCount;
  String storeBannerImagePath;
  String storeProfileImagePath;

  TopRatedStore(
      {this.catId,
      this.id,
      this.storeName,
      this.storeProfile,
      this.storeBanner,
      this.storeStatus,
      this.categoryId,
      this.avgRating,
      this.avgRatingCount,
      this.storeBannerImagePath,
      this.storeProfileImagePath});

  TopRatedStore.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    id = json['id'];
    storeName = json['store_name'];
    storeProfile = json['store_profile'];
    storeBanner = json['store_banner'];
    storeStatus = json['store_status'];
    categoryId = json['category_id'];
    avgRating = json['avg_rating'];
    avgRatingCount = json['avg_rating_count'];
    storeBannerImagePath = json['store_banner_image_path'];
    storeProfileImagePath = json['store_profile_image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['id'] = this.id;
    data['store_name'] = this.storeName;
    data['store_profile'] = this.storeProfile;
    data['store_banner'] = this.storeBanner;
    data['store_status'] = this.storeStatus;
    data['category_id'] = this.categoryId;
    data['avg_rating'] = this.avgRating;
    data['avg_rating_count'] = this.avgRatingCount;
    data['store_banner_image_path'] = this.storeBannerImagePath;
    data['store_profile_image_path'] = this.storeProfileImagePath;
    return data;
  }

  static List<TopRatedStore> getData(dynamic arrData) {
    List<TopRatedStore> arrTemp = [];

    arrData.forEach((v) {
      arrTemp.add(new TopRatedStore.fromJson(v));
    });

    return arrTemp;
  }
}

class StoreList {
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
  String isValue = "-";
  var favourite = false.obs;
  String categoryName;
  String avgRating;
  int totalFeedback;
  bool discountFlage;
  String storeBannerImagePath;
  String storeProfileImagePath;
  List<StoreCategory> storeCategory = [];
  List<StoreGallery> storeGallery = [];
  int storeid;
  String discount;
  String latitude;
  String longitude;

  StoreList({
    this.id,
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
    this.favourite,
    this.categoryName,
    this.avgRating,
    this.totalFeedback,
    this.discountFlage,
    this.storeBannerImagePath,
    this.storeProfileImagePath,
    this.storeCategory,
    this.storeGallery,
    this.storeid,
    this.discount,
    this.longitude,
    this.latitude,
  });

  StoreList.fromJson(Map<String, dynamic> json) {
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
    isValue = json['is_value'] ?? "-";
    favourite.value = json['favourite'];
    categoryName = json['category_name'];
    avgRating = json['avg_rating'];
    totalFeedback = json['total_feedback'];
    discountFlage = json['discountFlage'];
    storeBannerImagePath = json['store_banner_image_path'];
    storeProfileImagePath = json['store_profile_image_path'];
    storeid = json['store_id'];
    discount = json['discount'];
    longitude = json['longitude'];
    latitude = json['latitude'];

    if (json['store_category'] != null) {
      json['store_category'].forEach((v) {
        storeCategory.add(new StoreCategory.fromJson(v));
      });
    }

    if (json['store_gallery'] != null) {
      json['store_gallery'].forEach((v) {
        storeGallery.add(new StoreGallery.fromJson(v));
      });
    }

    var obj = StoreGallery();
    obj.storeGalleryImagePath = storeProfileImagePath;
    storeGallery.insert(0, obj);
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
    data['favourite'] = this.favourite;
    data['category_name'] = this.categoryName;
    data['avg_rating'] = this.avgRating;
    data['total_feedback'] = this.totalFeedback;
    data['discountFlage'] = this.discountFlage;
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

  static List<StoreList> getData(dynamic arrData) {
    List<StoreList> arrTemp = [];

    arrData.forEach((v) {
      arrTemp.add(new StoreList.fromJson(v));
    });

    return arrTemp;
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

// class FliterSpecifics {
//   int id;
//   String name;
//   String image;
//   String status;
//   String specificsImagePath;
//   bool isselected = false;

//   FliterSpecifics(
//       {this.id, this.name, this.image, this.status, this.specificsImagePath});

//   FliterSpecifics.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//     status = json['status'];
//     specificsImagePath = json['specifics_image_path'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     data['status'] = this.status;
//     data['specifics_image_path'] = this.specificsImagePath;
//     return data;
//   }

//   static List<FliterSpecifics> getData(dynamic arrData) {
//     List<FliterSpecifics> arrTemp = [];

//     arrData.forEach((v) {
//       arrTemp.add(new FliterSpecifics.fromJson(v));
//     });

//     return arrTemp;
//   }
// }

class CategoryWiseSubCategory {
  int id;
  int mainCategory;
  String name;
  String image;
  String status;
  String createdAt;
  String updatedAt;
  String categoryType;
  String slug;
  String categoryImagePath;

  CategoryWiseSubCategory(
      {this.id,
      this.mainCategory,
      this.name,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.categoryType,
      this.slug,
      this.categoryImagePath});

  CategoryWiseSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainCategory = json['main_category'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryType = json['category_type'];
    slug = json['slug'];
    categoryImagePath = json['category_image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main_category'] = this.mainCategory;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category_type'] = this.categoryType;
    data['slug'] = this.slug;
    data['category_image_path'] = this.categoryImagePath;
    return data;
  }

  static List<CategoryWiseSubCategory> getData(dynamic arrData) {
    List<CategoryWiseSubCategory> arrTemp = [];

    arrData.forEach((v) {
      arrTemp.add(new CategoryWiseSubCategory.fromJson(v));
    });

    return arrTemp;
  }
}

class SuggestionData {
  int id;
  String name;
  String url;

  SuggestionData({this.id, this.name, this.url});

  SuggestionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;

    return data;
  }

  static List<SuggestionData> getData(dynamic arrData) {
    List<SuggestionData> arrTemp = [];

    arrData.forEach((v) {
      arrTemp.add(new SuggestionData.fromJson(v));
    });

    return arrTemp;
  }
}

class ServiceWiseAllCategory {
  int id;
  int storeId;
  int categoryId;
  String createdAt;
  String updatedAt;
  int categoryWiseServiceCount;
  String categoryName;
  String categoryImagePath;

  ServiceWiseAllCategory(
      {this.id,
      this.storeId,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.categoryWiseServiceCount,
      this.categoryName,
      this.categoryImagePath});

  ServiceWiseAllCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryWiseServiceCount = json['category_wise_service_count'];
    categoryName = json['category_name'];
    categoryImagePath = json['category_image_path'];
  }

  static List<ServiceWiseAllCategory> getData(dynamic arrData) {
    List<ServiceWiseAllCategory> arrTemp = [];

    arrData.forEach((v) {
      arrTemp.add(new ServiceWiseAllCategory.fromJson(v));
    });

    return arrTemp;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store_id'] = this.storeId;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category_wise_service_count'] = this.categoryWiseServiceCount;
    data['category_name'] = this.categoryName;
    data['category_image_path'] = this.categoryImagePath;
    return data;
  }
}
