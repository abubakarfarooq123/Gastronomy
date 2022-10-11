import 'package:get/get.dart';

class BookingSummaryData {
  PaymentInfo paymentInfo;
  List<BookingData> bookingData = [];
  var isSuccess = 0;

  BookingSummaryData({this.paymentInfo, this.bookingData});

  BookingSummaryData.fromJson(Map<String, dynamic> json) {
    paymentInfo = json['paymentInfo'] != null ? new PaymentInfo.fromJson(json['paymentInfo']) : null;
    if (json['bookingData'] != null) {
      json['bookingData'].forEach((v) {
        bookingData.add(new BookingData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paymentInfo != null) {
      data['paymentInfo'] = this.paymentInfo.toJson();
    }
    if (this.bookingData != null) {
      data['bookingData'] = this.bookingData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentInfo {
  int id;
  int userId;
  int storeId;
  Null serviceId;
  String orderId = "";
  String paymentId;
  String refundId;
  String totalAmount;
  String status;
  String createdAt;
  String updatedAt;
  int appoinmentId;
  String paymentMethod;
  String paymentType;
  String cardType;
  String storename;
  String storeimage;
  String storeaddress;

  PaymentInfo(
      {this.id,
      this.userId,
      this.storeId,
      this.serviceId,
      this.orderId,
      this.paymentId,
      this.refundId,
      this.totalAmount,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.appoinmentId,
      this.paymentMethod,
      this.cardType,
      this.paymentType});

  PaymentInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    storeId = json['store_id'];
    serviceId = json['service_id'];
    orderId = json['order_id'] ?? "";
    paymentId = json['payment_id'];
    refundId = json['refund_id'];
    totalAmount = json['total_amount'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    appoinmentId = json['appoinment_id'];
    paymentMethod = json['payment_method'];
    paymentType = json['payment_type'];
    storename = json['store_name'];
    storeimage = json['store_image'];
    storeaddress = json['store_address'];
    cardType = json['card_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['store_id'] = this.storeId;
    data['service_id'] = this.serviceId;
    data['order_id'] = this.orderId;
    data['payment_id'] = this.paymentId;
    data['refund_id'] = this.refundId;
    data['total_amount'] = this.totalAmount;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['appoinment_id'] = this.appoinmentId;
    data['payment_method'] = this.paymentMethod;
    data['payment_type'] = this.paymentType;
    data['card_type'] = this.cardType;
    return data;
  }
}

class BookingData {
  int id;
  String name;
  String image;
  String categoryImagePath;
  String empname = "Any Person";
  String empimage;
  String appodate;
  String apptime;
  List<ServicecategoryInBooking> servicecategory = [];
  var isOpenDetails = true.obs;
  BookingData({this.id, this.name, this.image, this.categoryImagePath, this.servicecategory});

  BookingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    categoryImagePath = json['category_image_path'];

    empname = json['emp_name'] ?? "Any Person";
    empimage = json['emp_image'];
    appodate = json['appo_date'];
    apptime = json['appo_time'];

    if (json['servicecategory'] != null) {
      json['servicecategory'].forEach((v) {
        servicecategory.add(new ServicecategoryInBooking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['category_image_path'] = this.categoryImagePath;
    if (this.servicecategory != null) {
      data['servicecategory'] = this.servicecategory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServicecategoryInBooking {
  int id;
  int storeId;
  String categoryId;
  int subcategoryId;
  String serviceName;
  String price;
  String image;
  String serviceImagePath;
  List<ServiceVariantInBooking> serviceVariant = [];

  ServicecategoryInBooking({this.id, this.storeId, this.categoryId, this.subcategoryId, this.serviceName, this.price, this.image, this.serviceImagePath, this.serviceVariant});

  ServicecategoryInBooking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    serviceName = json['service_name'];
    price = json['price'];
    image = json['image'];
    serviceImagePath = json['service_image_path'];
    if (json['service_variant'] != null) {
      json['service_variant'].forEach((v) {
        serviceVariant.add(new ServiceVariantInBooking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store_id'] = this.storeId;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['service_name'] = this.serviceName;
    data['price'] = this.price;
    data['image'] = this.image;
    data['service_image_path'] = this.serviceImagePath;
    if (this.serviceVariant != null) {
      data['service_variant'] = this.serviceVariant.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceVariantInBooking {
  int id;
  int storeId;
  int serviceId;
  String description;
  String durationOfService;
  String price;
  String createdAt;
  String updatedAt;
  String finalPrice = "";

  ServiceVariantInBooking({
    this.id,
    this.storeId,
    this.serviceId,
    this.description,
    this.durationOfService,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.finalPrice,
  });

  ServiceVariantInBooking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    serviceId = json['service_id'];
    description = json['description'];
    durationOfService = json['duration_of_service'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    finalPrice = json['finalPrice'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store_id'] = this.storeId;
    data['service_id'] = this.serviceId;
    data['description'] = this.description;
    data['duration_of_service'] = this.durationOfService;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class KlarnaPaypal {
  String redirecttourl;
  String paymentintent;
  String storeId;
  int appoinmentid;
  String booking;

  KlarnaPaypal({
    this.redirecttourl,
    this.paymentintent,
    this.storeId,
    this.appoinmentid,
  });

  KlarnaPaypal.fromJson(Map<String, dynamic> json) {
    redirecttourl = json['redirect_to_url'];
    paymentintent = json['payment_intent'];
    storeId = json['store_id'];
    appoinmentid = json['appoinment_id'];
    booking = json['booking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['redirect_to_url'] = this.redirecttourl;
    data['payment_intent'] = this.paymentintent;
    data['store_id'] = this.storeId;
    data['appoinment_id'] = this.appoinmentid;

    return data;
  }
}
