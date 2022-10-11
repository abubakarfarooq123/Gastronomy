import 'package:get/get.dart';

class ResturantReviewModel {
  String allOverAvg;
  int totalFeedBack;
  List<TotalAvgRating> totalAvgRating;
  // ignore: deprecated_member_use
  var customerReview = List<CustomerReview>().obs;

  ResturantReviewModel(
      {this.allOverAvg,
      this.totalFeedBack,
      this.totalAvgRating,
      this.customerReview});

  ResturantReviewModel.fromJson(Map<String, dynamic> json) {
    allOverAvg = json['allOverAvg'];
    totalFeedBack = json['totalFeedBack'];
    if (json['totalAvgRating'] != null) {
      totalAvgRating = <TotalAvgRating>[];
      json['totalAvgRating'].forEach((v) {
        totalAvgRating.add(new TotalAvgRating.fromJson(v));
      });
    }
    customerReview.value = List<CustomerReview>.from(
        json["customerReview"].map((x) => CustomerReview.fromJson(x))).toList();
    customerReview.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allOverAvg'] = this.allOverAvg;
    data['totalFeedBack'] = this.totalFeedBack;
    if (this.totalAvgRating != null) {
      data['totalAvgRating'] =
          this.totalAvgRating.map((v) => v.toJson()).toList();
    }

    data["customerReview"] =
        List<dynamic>.from(customerReview.map((x) => x.toJson()));
    return data;
  }
}

class CustomerReview {
  int id;
  int userId;
  int storeId;
  String foodRate;
  String deliveryRate;
  String writeComment;
  String totalAvgRating;
  int menuId;
  String empId;
  String storeReply;
  String categoryId;
  String subcategoryId;
  String createdAt;
  String updatedAt;
  String empName;
  String itemName;
  String userName;
  String userImagePath;
  String storeName;
  String storeAddress;
  String storeImage;
  String dayAgo;

  CustomerReview(
      {this.id,
      this.userId,
      this.storeId,
      this.foodRate,
      this.deliveryRate,
      this.writeComment,
      this.totalAvgRating,
      this.menuId,
      this.empId,
      this.storeReply,
      this.categoryId,
      this.subcategoryId,
      this.createdAt,
      this.updatedAt,
      this.empName,
      this.itemName,
      this.userName,
      this.userImagePath,
      this.storeName,
      this.storeAddress,
      this.storeImage,
      this.dayAgo});

  CustomerReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    storeId = json['store_id'];
    foodRate = json['food_rate'];
    deliveryRate = json['delivery_rate'];
    writeComment = json['write_comment'];
    totalAvgRating = json['total_avg_rating'];
    menuId = json['menu_id'];
    empId = json['emp_id'];
    storeReply = json['store_reply'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    empName = json['emp_name'];
    itemName = json['item_name'];
    userName = json['user_name'];
    userImagePath = json['user_image_path'];
    storeName = json['store_name'];
    storeAddress = json['store_address'];
    storeImage = json['store_image'];
    dayAgo = json['dayAgo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['store_id'] = this.storeId;
    data['food_rate'] = this.foodRate;
    data['delivery_rate'] = this.deliveryRate;
    data['write_comment'] = this.writeComment;
    data['total_avg_rating'] = this.totalAvgRating;
    data['menu_id'] = this.menuId;
    data['emp_id'] = this.empId;
    data['store_reply'] = this.storeReply;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['emp_name'] = this.empName;
    data['item_name'] = this.itemName;
    data['user_name'] = this.userName;
    data['user_image_path'] = this.userImagePath;
    data['store_name'] = this.storeName;
    data['store_address'] = this.storeAddress;
    data['store_image'] = this.storeImage;
    data['dayAgo'] = this.dayAgo;
    return data;
  }

  static List<CustomerReview> getData(dynamic arrData) {
    List<CustomerReview> arrTemp = [];

    arrData.forEach((v) {
      arrTemp.add(new CustomerReview.fromJson(v));
    });

    return arrTemp;
  }
}

class TotalAvgRating {
  String foodRate;
  String deliveryRate;

  TotalAvgRating({this.foodRate, this.deliveryRate});

  TotalAvgRating.fromJson(Map<String, dynamic> json) {
    foodRate = json['food_rate'];
    deliveryRate = json['delivery_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['food_rate'] = this.foodRate;
    data['delivery_rate'] = this.deliveryRate;
    return data;
  }
}
