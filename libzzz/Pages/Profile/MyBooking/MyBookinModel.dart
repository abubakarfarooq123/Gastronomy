class PendingModel {
  int id;
  int userId;
  int storeId;
  String orderId;
  int totalAmount;
  String firstName;
  String lastName;
  String email;
  String address;
  String zipcode;
  String note;
  String phoneNumber;
  String status;
  String orderType;
  int deliveryCost;
  double deliveryTip = 0.0;
  String deliveryEndTime;
  String appointmentType;
  String cancelReason;
  String cancelledBy;
  String createdAt;
  String updatedAt;
  String paymentStatus;
  List<OrderData> orderData;
  String storeName;
  String storeAddress;
  String storeImage;
  IsReviewed isReviewed;
  String endTime;
  String createdTime;
  int statusNumber;
  bool late;

  PendingModel(
      {this.id,
      this.userId,
      this.storeId,
      this.orderId,
      this.totalAmount,
      this.firstName,
      this.lastName,
      this.email,
      this.address,
      this.zipcode,
      this.note,
      this.phoneNumber,
      this.status,
      this.orderType,
      this.deliveryCost,
      this.deliveryTip,
      this.deliveryEndTime,
      this.appointmentType,
      this.cancelReason,
      this.cancelledBy,
      this.createdAt,
      this.updatedAt,
      this.paymentStatus,
      this.orderData,
      this.storeName,
      this.storeAddress,
      this.storeImage,
      this.isReviewed,
      this.endTime,
      this.createdTime,
      this.statusNumber,
      this.late});

  PendingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    storeId = json['store_id'];
    orderId = json['order_id'];
    totalAmount = json['total_amount'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    address = json['address'];
    zipcode = json['zipcode'];
    note = json['note'];
    phoneNumber = json['phone_number'];
    status = json['status'];
    orderType = json['order_type'];
    deliveryCost = json['delivery_cost'];
    deliveryTip = json['delivery_tip'] == 0 ? 0.0 : json['delivery_tip'];
    deliveryEndTime = json['delivery_end_time'];
    appointmentType = json['appointment_type'];
    cancelReason = json['cancel_reason'];
    cancelledBy = json['cancelled_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    paymentStatus = json['payment_status'];
    if (json['order_data'] != null) {
      orderData = <OrderData>[];
      json['order_data'].forEach((v) {
        orderData.add(new OrderData.fromJson(v));
      });
    }
    storeName = json['store_name'];
    storeAddress = json['store_address'];
    storeImage = json['store_image'];
    isReviewed = json['is_reviewed'] == ""
        ? null
        : new IsReviewed.fromJson(json['is_reviewed']);
    endTime = json['end_time'];
    createdTime = json['created_time'];
    statusNumber = json['status_number'];
    late = json['late'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['store_id'] = this.storeId;
    data['order_id'] = this.orderId;
    data['total_amount'] = this.totalAmount;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['address'] = this.address;
    data['zipcode'] = this.zipcode;
    data['note'] = this.note;
    data['phone_number'] = this.phoneNumber;
    data['status'] = this.status;
    data['order_type'] = this.orderType;
    data['delivery_cost'] = this.deliveryCost;
    data['delivery_tip'] = this.deliveryTip == 0 ? 0.0 : this.deliveryTip;
    data['delivery_end_time'] = this.deliveryEndTime;
    data['appointment_type'] = this.appointmentType;
    data['cancel_reason'] = this.cancelReason;
    data['cancelled_by'] = this.cancelledBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['payment_status'] = this.paymentStatus;
    if (this.orderData != null) {
      data['order_data'] = this.orderData.map((v) => v.toJson()).toList();
    }
    data['store_name'] = this.storeName;
    data['store_address'] = this.storeAddress;
    data['store_image'] = this.storeImage;
    if (this.isReviewed != null) {
      data['is_reviewed'] = this.isReviewed.toJson();
    }
    data['end_time'] = this.endTime;
    data['created_time'] = this.createdTime;
    data['status_number'] = this.statusNumber;
    data['late'] = this.late;
    return data;
  }

  static List<PendingModel> getData(dynamic arrData) {
    List<PendingModel> arrTemp = [];

    arrData.forEach((v) {
      arrTemp.add(new PendingModel.fromJson(v));
    });

    return arrTemp;
  }
}

class OrderData {
  int id;
  int appointmentId;
  int storeId;
  int categoryId;
  int subcategoryId;
  int menuId;
  String menuName;
  int variantId;
  int price;
  int quantity;
  String storeEmpId;
  String createdAt;
  String updatedAt;
  String refundId;
  int isNotified;
  String note;
  VariantData variantData;
  List<OrderExtras> orderExtras;

  OrderData(
      {this.id,
      this.appointmentId,
      this.storeId,
      this.categoryId,
      this.subcategoryId,
      this.menuId,
      this.menuName,
      this.variantId,
      this.price,
      this.quantity,
      this.storeEmpId,
      this.createdAt,
      this.updatedAt,
      this.refundId,
      this.isNotified,
      this.note,
      this.variantData,
      this.orderExtras});

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentId = json['appointment_id'];
    storeId = json['store_id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    menuId = json['menu_id'];
    menuName = json['menu_name'];
    variantId = json['variant_id'];
    price = json['price'];
    quantity = json['quantity'];
    storeEmpId = json['store_emp_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    refundId = json['refund_id'];
    isNotified = json['is_notified'];
    note = json['note'];
    variantData = json['variant_data'] != null
        ? new VariantData.fromJson(json['variant_data'])
        : null;
    if (json['order_extras'] != null) {
      orderExtras = <OrderExtras>[];
      json['order_extras'].forEach((v) {
        orderExtras.add(new OrderExtras.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appointment_id'] = this.appointmentId;
    data['store_id'] = this.storeId;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['menu_id'] = this.menuId;
    data['menu_name'] = this.menuName;
    data['variant_id'] = this.variantId;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['store_emp_id'] = this.storeEmpId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['refund_id'] = this.refundId;
    data['is_notified'] = this.isNotified;
    data['note'] = this.note;
    if (this.variantData != null) {
      data['variant_data'] = this.variantData.toJson();
    }
    if (this.orderExtras != null) {
      data['order_extras'] = this.orderExtras.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VariantData {
  int id;
  String name;
  int price;
  String image;
  int menuId;
  String finalPrice;
  String fullImagePath;
  Menu menu;

  VariantData(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.menuId,
      this.finalPrice,
      this.fullImagePath,
      this.menu});

  VariantData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    menuId = json['menu_id'];
    finalPrice = json['final_price'];
    fullImagePath = json['full_image_path'];
    menu = json['menu'] != null ? new Menu.fromJson(json['menu']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['menu_id'] = this.menuId;
    data['final_price'] = this.finalPrice;
    data['full_image_path'] = this.fullImagePath;
    if (this.menu != null) {
      data['menu'] = this.menu.toJson();
    }
    return data;
  }
}

class Menu {
  int id;
  String image;
  String menuImagePath;
  String minPrice;

  Menu({this.id, this.image, this.menuImagePath, this.minPrice});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    menuImagePath = json['menu_image_path'];
    minPrice = json['min_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['menu_image_path'] = this.menuImagePath;
    data['min_price'] = this.minPrice;
    return data;
  }
}

class OrderExtras {
  int id;
  int appointmentId;
  int storeExtraId;
  String title;
  int price;
  int quantity;
  String createdAt;
  String updatedAt;

  OrderExtras(
      {this.id,
      this.appointmentId,
      this.storeExtraId,
      this.title,
      this.price,
      this.quantity,
      this.createdAt,
      this.updatedAt});

  OrderExtras.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentId = json['appointment_id'];
    storeExtraId = json['store_extra_id'];
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appointment_id'] = this.appointmentId;
    data['store_extra_id'] = this.storeExtraId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class IsReviewed {
  int id;
  int userId;
  int storeId;
  int foodRate;
  int deliveryRate;
  String writeComment;
  String createdAt;
  String updatedAt;
  int totalAvgRating;
  String categoryId;
  String subcategoryId;
  int menuId;
  String empId;
  String storeReplay;
  String appointmentId;

  IsReviewed(
      {this.id,
      this.userId,
      this.storeId,
      this.foodRate,
      this.deliveryRate,
      this.writeComment,
      this.createdAt,
      this.updatedAt,
      this.totalAvgRating,
      this.categoryId,
      this.subcategoryId,
      this.menuId,
      this.empId,
      this.storeReplay,
      this.appointmentId});

  IsReviewed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    storeId = json['store_id'];
    foodRate = json['food_rate'];
    deliveryRate = json['delivery_rate'];
    writeComment = json['write_comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalAvgRating = json['total_avg_rating'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    menuId = json['menu_id'];
    empId = json['emp_id'];
    storeReplay = json['store_replay'];
    appointmentId = json['appointment_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['store_id'] = this.storeId;
    data['food_rate'] = this.foodRate;
    data['delivery_rate'] = this.deliveryRate;
    data['write_comment'] = this.writeComment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['total_avg_rating'] = this.totalAvgRating;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['menu_id'] = this.menuId;
    data['emp_id'] = this.empId;
    data['store_replay'] = this.storeReplay;
    data['appointment_id'] = this.appointmentId;
    return data;
  }
}
