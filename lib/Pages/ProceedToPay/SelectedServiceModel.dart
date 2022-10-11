// ignore: unused_import
import 'package:intl/intl.dart';

class SelectedServiceModel {
  int id;
  String name;
  String image;
  String categoryImagePath;

  var formatedDate = "";

  List<Servicecategory> servicecategory = [];
  int empids;
  String appodate = "";
  String appotime = "";
  String empname = "Any Person";
  String empimage;
  String appodatetemp = "";
  String storename = "";

  SelectedServiceModel({
    this.id,
    this.name,
    this.image,
    this.categoryImagePath,
    this.servicecategory,
    this.empids,
    this.appodate,
    this.appotime,
    this.empname,
    this.empimage,
    this.appodatetemp,
    this.storename,
  });

  SelectedServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    categoryImagePath = json['category_image_path'];
    empids = json['emp_ids'];
    appodate = json['appo_date'] ?? "";
    appotime = json['appo_time'] ?? "";
    empname = json['emp_name'] ?? "Any Person";
    empimage = json['emp_image'] ?? "";
    appodatetemp = json['appo_date_temp'] ?? "";
    storename = json['store_name'] ?? "";

    if (appodate.isNotEmpty) {}

    if (json['servicecategory'] != null) {
      json['servicecategory'].forEach((v) {
        servicecategory.add(new Servicecategory.fromJson(v));
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
      data['servicecategory'] =
          this.servicecategory.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static List<SelectedServiceModel> getData(dynamic arrData) {
    List<SelectedServiceModel> arrTemp = [];

    arrData.forEach((v) {
      arrTemp.add(new SelectedServiceModel.fromJson(v));
    });

    return arrTemp;
  }
}

class Servicecategory {
  int id;
  int storeId;
  String categoryId;
  int subcategoryId;
  String serviceName;
  String price;
  Null startTime;
  Null endTime;
  Null startDate;
  Null endDate;
  String discount;
  String image;
  List<SelectedServiceVariant> serviceVariant = [];
  String serviceImagePath;

  Servicecategory(
      {this.id,
      this.storeId,
      this.categoryId,
      this.subcategoryId,
      this.serviceName,
      this.price,
      this.startTime,
      this.endTime,
      this.startDate,
      this.endDate,
      this.discount,
      this.image,
      this.serviceVariant,
      this.serviceImagePath});

  Servicecategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    serviceName = json['service_name'];
    price = json['price'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    discount = json['discount'].toString();
    image = json['image'];
    if (json['service_variant'] != null) {
      json['service_variant'].forEach((v) {
        serviceVariant.add(new SelectedServiceVariant.fromJson(v));
      });
    }
    serviceImagePath = json['service_image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store_id'] = this.storeId;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['service_name'] = this.serviceName;
    data['price'] = this.price;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['discount'] = this.discount;
    data['image'] = this.image;
    if (this.serviceVariant != null) {
      data['service_variant'] =
          this.serviceVariant.map((v) => v.toJson()).toList();
    }
    data['service_image_path'] = this.serviceImagePath;
    return data;
  }
}

class SelectedServiceVariant {
  int id;
  int categoryId;
  int serviceId;
  int storeid;
  int serviceVariantId;
  String deviceToken;
  String createdAt;
  String updatedAt;
  String description;
  String durationOfService;
  String vPrice;
  String vpricefinal;

  SelectedServiceVariant(
      {this.id,
      this.categoryId,
      this.serviceId,
      this.serviceVariantId,
      this.deviceToken,
      this.createdAt,
      this.updatedAt,
      this.description,
      this.durationOfService,
      this.vPrice,
      this.storeid,
      this.vpricefinal});

  SelectedServiceVariant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    serviceId = json['service_id'];
    serviceVariantId = json['service_variant_id'];
    deviceToken = json['device_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    description = json['description'];
    durationOfService = json['duration_of_service'];
    vPrice = removeComma(json['v_price']);
    storeid = json['store_id'];
    vpricefinal = removeComma(json['v_price_final']);
  }

  String removeComma(String vpricefinal) {
    return vpricefinal.replaceAll(",", "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['service_id'] = this.serviceId;
    data['service_variant_id'] = this.serviceVariantId;
    data['device_token'] = this.deviceToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['description'] = this.description;
    data['duration_of_service'] = this.durationOfService;
    data['v_price'] = this.vPrice;
    return data;
  }
}

class AvailableTimeSlot {
  String time;
  String flag;

  AvailableTimeSlot({this.time, this.flag});

  AvailableTimeSlot.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    flag = json['flag'];
    if (time.isNotEmpty) {
      var arr = time.split(":");
      time = "${arr.first}:${arr[1]}";
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['flag'] = this.flag;
    return data;
  }

  static List<AvailableTimeSlot> getData(dynamic arrData) {
    List<AvailableTimeSlot> arrTemp = [];

    arrData.forEach((v) {
      arrTemp.add(new AvailableTimeSlot.fromJson(v));
    });

    return arrTemp;
  }
}

class ServiceViseEmploye {
  int id;
  int storeId;
  String empName;
  Null country;
  Null serviceName;
  String image;
  String status;
  String createdAt;
  String updatedAt;
  String empImagePath;

  ServiceViseEmploye(
      {this.id,
      this.storeId,
      this.empName,
      this.country,
      this.serviceName,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.empImagePath});

  ServiceViseEmploye.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    empName = json['emp_name'];
    country = json['country'];
    serviceName = json['service_name'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    empImagePath = json['emp_image_path'];
  }

  static List<ServiceViseEmploye> getData(dynamic arrData) {
    List<ServiceViseEmploye> arrTemp = [];

    arrData.forEach((v) {
      arrTemp.add(new ServiceViseEmploye.fromJson(v));
    });

    return arrTemp;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store_id'] = this.storeId;
    data['emp_name'] = this.empName;
    data['country'] = this.country;
    data['service_name'] = this.serviceName;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['emp_image_path'] = this.empImagePath;
    return data;
  }
}
