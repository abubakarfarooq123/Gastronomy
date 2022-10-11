// class ResturantDetails {
//   int id;
//   int userId;
//   String storeName;
//   String storeDescription;
//   String storeProfile;
//   String storeContactNumber;
//   String storeBanner;
//   String storeStatus;
//   String storeAddress;
//   String latitude;
//   String longitude;
//   String paymentMethod;
//   String storeActivePlan;
//   String storeLinkId;
//   String storeDistrict;
//   String avgRating;
//   int totalFeedback;
//   bool favourite;
//   bool feedbackFlag;
//   General general;
//   String storeBannerImagePath;
//   String storeProfileImagePath;
//   List<StoreGallery> storeGallery;

//   ResturantDetails(
//       {this.id,
//         this.userId,
//         this.storeName,
//         this.storeDescription,
//         this.storeProfile,
//         this.storeContactNumber,
//         this.storeBanner,
//         this.storeStatus,
//         this.storeAddress,
//         this.latitude,
//         this.longitude,
//         this.paymentMethod,
//         this.storeActivePlan,
//         this.storeLinkId,
//         this.storeDistrict,
//         this.avgRating,
//         this.totalFeedback,
//         this.favourite,
//         this.feedbackFlag,
//         this.general,
//         this.storeBannerImagePath,
//         this.storeProfileImagePath,
//         this.storeGallery});

//   ResturantDetails.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     storeName = json['store_name'];
//     storeDescription = json['store_description'];
//     storeProfile = json['store_profile'];
//     storeContactNumber = json['store_contact_number'];
//     storeContactNumber = json['store_contact_number'];
//     storeBanner = json['store_banner'];
//     storeStatus = json['store_status'];
//     storeAddress = json['store_address'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     paymentMethod = json['payment_method'];
//     storeActivePlan = json['store_active_plan'];
//     storeLinkId = json['store_link_id'];
//     storeDistrict = json['store_district'];
//     avgRating = json['avg_rating'];
//     totalFeedback = json['total_feedback'];
//     favourite = json['favourite'];
//     feedbackFlag = json['feedback_flag'];
//     general = new General.fromJson(json['General']) ;
//     storeBannerImagePath = json['store_banner_image_path'];
//     storeProfileImagePath = json['store_profile_image_path'];
//     if (json['store_gallery'] != null) {
//       storeGallery = <StoreGallery>[];
//       json['store_gallery'].forEach((v) {
//         storeGallery.add(new StoreGallery.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['store_name'] = this.storeName;
//     data['store_description'] = this.storeDescription;
//     data['store_profile'] = this.storeProfile;
//     data['store_contact_number'] = this.storeContactNumber;
//     data['store_banner'] = this.storeBanner;
//     data['store_status'] = this.storeStatus;
//     data['store_address'] = this.storeAddress;
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['payment_method'] = this.paymentMethod;
//     data['store_active_plan'] = this.storeActivePlan;
//     data['store_link_id'] = this.storeLinkId;
//     data['store_district'] = this.storeDistrict;
//     data['avg_rating'] = this.avgRating;
//     data['total_feedback'] = this.totalFeedback;
//     data['favourite'] = this.favourite;
//     data['feedback_flag'] = this.feedbackFlag;
//     if (this.general != null) {
//       data['General'] = this.general.toJson();
//     }
//     data['store_banner_image_path'] = this.storeBannerImagePath;
//     data['store_profile_image_path'] = this.storeProfileImagePath;
//     if (this.storeGallery != null) {
//       data['store_gallery'] =
//           this.storeGallery.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class General {

//   String storeDescription;

//   String latitude;
//   String longitude;
//   String district;
//   List<Null> publicTransportation;
//   String locationByMap;
//   List<OpeningHours> openingHours;
//   String homeUrl;
//   List<Null> diraction;
//   String phoneNumber;

//   General(
//       {
//         this.storeDescription,
//         this.latitude,
//         this.longitude,
//         this.district,
//         this.publicTransportation,
//         this.locationByMap,
//         this.openingHours,
//         this.homeUrl,
//         this.diraction,
//         this.phoneNumber});

//   General.fromJson(Map<String, dynamic> json) {

//     storeDescription = json['store_description'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     district = json['district'];

//     locationByMap = json['location_by_map'];
//     if (json['opening_hours'] != null) {
//       openingHours = <OpeningHours>[];
//       json['opening_hours'].forEach((v) {
//         openingHours.add(new OpeningHours.fromJson(v));
//       });
//     }
//     homeUrl = json['home_url'];

//     phoneNumber = json['phone_number'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();

//     data['store_description'] = this.storeDescription;

//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['district'] = this.district;
//     data['location_by_map'] = this.locationByMap;
//     if (this.openingHours != null) {
//       data['opening_hours'] =
//           this.openingHours.map((v) => v.toJson()).toList();
//     }
//     data['home_url'] = this.homeUrl;

//     data['phone_number'] = this.phoneNumber;
//     return data;
//   }
// }

// class OpeningHours {
//   int id;
//   int storeId;
//   String day;
//   String startTime;
//   String endTime;
//   String isOff;
//   String createdAt;
//   String updatedAt;

//   OpeningHours(
//       {this.id,
//         this.storeId,
//         this.day,
//         this.startTime,
//         this.endTime,
//         this.isOff,
//         this.createdAt,
//         this.updatedAt});

//   OpeningHours.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     storeId = json['store_id'];
//     day = json['day'];
//     startTime = json['start_time'];
//     endTime = json['end_time'];
//     isOff = json['is_off'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['store_id'] = this.storeId;
//     data['day'] = this.day;
//     data['start_time'] = this.startTime;
//     data['end_time'] = this.endTime;
//     data['is_off'] = this.isOff;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class StoreGallery {
//   int id;
//   int storeId;
//   String file;
//   String fileType;
//   String createdAt;
//   String updatedAt;
//   String storeGalleryImagePath;

//   StoreGallery(
//       {this.id,
//         this.storeId,
//         this.file,
//         this.fileType,
//         this.createdAt,
//         this.updatedAt,
//         this.storeGalleryImagePath});

//   StoreGallery.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     storeId = json['store_id'];
//     file = json['file'];
//     fileType = json['file_type'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     storeGalleryImagePath = json['store_gallery_image_path'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['store_id'] = this.storeId;
//     data['file'] = this.file;
//     data['file_type'] = this.fileType;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['store_gallery_image_path'] = this.storeGalleryImagePath;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

class ResturantDetails {
  int id;
  int userId;
  String storeName;
  String storeDescription;
  String storeProfile;
  String storeContactNumber;
  String storeBanner;
  String storeStatus;
  String storeAddress;
  String latitude;
  String longitude;
  String paymentMethod;
  String storeActivePlan;
  String storeLinkId;
  String storeDistrict;
  int minDeliveryCost;
  String minDeliveryTime;
  int minOrderAmount;
  String deliveryAreaRadius;
  String avgRating;
  int totalFeedback;
  var favourite = false.obs;
  bool feedbackFlag;
  General general;
  String storeBannerImagePath;
  String storeProfileImagePath;
  List<StoreGallery> storeGallery;
  ResturantDetails({
    this.id,
    this.userId,
    this.storeName,
    this.storeDescription,
    this.storeProfile,
    this.storeContactNumber,
    this.storeBanner,
    this.storeStatus,
    this.storeAddress,
    this.latitude,
    this.longitude,
    this.paymentMethod,
    this.storeActivePlan,
    this.storeLinkId,
    this.storeDistrict,
    this.minDeliveryCost,
    this.minDeliveryTime,
    this.minOrderAmount,
    this.deliveryAreaRadius,
    this.avgRating,
    this.totalFeedback,
    this.favourite,
    this.feedbackFlag,
    this.general,
    this.storeBannerImagePath,
    this.storeProfileImagePath,
    this.storeGallery,
  });

  ResturantDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    storeName = json["store_name"];
    storeDescription = json["store_description"];
    storeProfile = json["store_profile"];
    storeContactNumber = json["store_contact_number"];
    storeBanner = json["store_banner"];
    storeStatus = json["store_status"];
    storeAddress = json["store_address"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    paymentMethod = json["payment_method"];
    storeActivePlan = json["store_active_plan"];
    storeLinkId = json["store_link_id"];
    storeDistrict = json["store_district"];
    minDeliveryCost = json["min_delivery_cost"];
    minDeliveryTime = json["min_delivery_time"];
    minOrderAmount = json["min_order_amount"];
    deliveryAreaRadius = json["delivery_area_radius"];
    avgRating = json["avg_rating"];
    totalFeedback = json["total_feedback"];
    favourite.value = json['favourite'];
    feedbackFlag = json["feedback_flag"];
    general = General.fromJson(json["General"]);
    storeBannerImagePath = json["store_banner_image_path"];
    storeProfileImagePath = json["store_profile_image_path"];
    storeGallery = List<StoreGallery>.from(
        json["store_gallery"].map((x) => StoreGallery.fromJson(x)));
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["user_id"] = userId;
    data["store_name"] = storeName;
    data["store_description"] = storeDescription;
    data["store_profile"] = storeProfile;
    data["store_contact_number"] = storeContactNumber;
    data["store_banner"] = storeBanner;
    data["store_status"] = storeStatus;
    data["store_address"] = storeAddress;
    data["latitude"] = latitude;
    data["longitude"] = longitude;
    data["payment_method"] = paymentMethod;
    data["store_active_plan"] = storeActivePlan;
    data["store_link_id"] = storeLinkId;
    data["store_district"] = storeDistrict;
    data["min_delivery_cost"] = minDeliveryCost;
    data["min_delivery_time"] = minDeliveryTime;
    data["min_order_amount"] = minOrderAmount;
    data["delivery_area_radius"] = deliveryAreaRadius;
    data["avg_rating"] = avgRating;
    data["total_feedback"] = totalFeedback;
    data["favourite"] = this.favourite;
    data["feedback_flag"] = feedbackFlag;
    data["General"] = general.toJson();
    data["store_banner_image_path"] = storeBannerImagePath;
    data["store_profile_image_path"] = storeProfileImagePath;
    data["store_gallery"] =
        List<dynamic>.from(storeGallery.map((x) => x.toJson()));
  }
}

class General {
  General({
    this.facilities,
    this.categories,
    this.storeDescription,
    this.advantages,
    this.ourServiceExpert,
    this.latitude,
    this.longitude,
    this.district,
    this.publicTransportation,
    this.locationByMap,
    this.openingHours,
    this.storeUrl,
    this.diraction,
    this.phoneNumber,
  });

  List<Facility> facilities;
  String categories;
  String storeDescription;
  List<dynamic> advantages;
  List<dynamic> ourServiceExpert;
  String latitude;
  String longitude;
  String district;
  List<dynamic> publicTransportation;
  String locationByMap;
  List<OpeningHour> openingHours;
  String storeUrl;
  List<dynamic> diraction;
  String phoneNumber;

  factory General.fromJson(Map<String, dynamic> json) => General(
        facilities: List<Facility>.from(
            json["facilities"].map((x) => Facility.fromJson(x))),
        categories: json["categories"],
        storeDescription: json["store_description"],
        advantages: List<dynamic>.from(json["advantages"].map((x) => x)),
        ourServiceExpert:
            List<dynamic>.from(json["our_service_expert"].map((x) => x)),
        latitude: json["latitude"],
        longitude: json["longitude"],
        district: json["district"],
        publicTransportation:
            List<dynamic>.from(json["public_transportation"].map((x) => x)),
        locationByMap: json["location_by_map"],
        openingHours: List<OpeningHour>.from(
            json["opening_hours"].map((x) => OpeningHour.fromJson(x))),
        storeUrl: json["store_url"],
        diraction: List<dynamic>.from(json["diraction"].map((x) => x)),
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "facilities": List<dynamic>.from(facilities.map((x) => x.toJson())),
        "categories": categories,
        "store_description": storeDescription,
        "advantages": List<dynamic>.from(advantages.map((x) => x)),
        "our_service_expert":
            List<dynamic>.from(ourServiceExpert.map((x) => x)),
        "latitude": latitude,
        "longitude": longitude,
        "district": district,
        "public_transportation":
            List<dynamic>.from(publicTransportation.map((x) => x)),
        "location_by_map": locationByMap,
        "opening_hours":
            List<dynamic>.from(openingHours.map((x) => x.toJson())),
        "store_url": storeUrl,
        "diraction": List<dynamic>.from(diraction.map((x) => x)),
        "phone_number": phoneNumber,
      };
}

class Facility {
  Facility({
    this.name,
    this.image,
    this.fullImagePath,
    this.pivot,
  });

  String name;
  String image;
  String fullImagePath;
  Pivot pivot;

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        name: json["name"],
        image: json["image"],
        fullImagePath: json["full_image_path"],
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "full_image_path": fullImagePath,
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  Pivot({
    this.storeId,
    this.featureId,
  });

  int storeId;
  int featureId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        storeId: json["store_id"],
        featureId: json["feature_id"],
      );

  Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "feature_id": featureId,
      };
}

class OpeningHour {
  OpeningHour({
    this.id,
    this.storeId,
    this.day,
    this.startTime,
    this.endTime,
    this.isOff,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int storeId;
  String day;
  String startTime;
  String endTime;
  String isOff;
  DateTime createdAt;
  DateTime updatedAt;

  factory OpeningHour.fromJson(Map<String, dynamic> json) => OpeningHour(
        id: json["id"],
        storeId: json["store_id"],
        day: json["day"],
        startTime: json["start_time"] == null ? null : json["start_time"],
        endTime: json["end_time"] == null ? null : json["end_time"],
        isOff: json["is_off"] == null ? null : json["is_off"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "day": day,
        "start_time": startTime == null ? null : startTime,
        "end_time": endTime == null ? null : endTime,
        "is_off": isOff == null ? null : isOff,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class StoreGallery {
  StoreGallery({
    this.id,
    this.storeId,
    this.file,
    this.fileType,
    this.createdAt,
    this.updatedAt,
    this.storeGalleryImagePath,
  });

  int id;
  int storeId;
  String file;
  String fileType;
  DateTime createdAt;
  DateTime updatedAt;
  String storeGalleryImagePath;

  factory StoreGallery.fromJson(Map<String, dynamic> json) => StoreGallery(
        id: json["id"],
        storeId: json["store_id"],
        file: json["file"],
        fileType: json["file_type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        storeGalleryImagePath: json["store_gallery_image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "file": file,
        "file_type": fileType,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "store_gallery_image_path": storeGalleryImagePath,
      };
}
