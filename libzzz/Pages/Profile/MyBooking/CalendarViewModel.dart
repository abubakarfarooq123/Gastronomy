class CalendarViewModel {
  int appId;
  int storeId;
  int categoryId;
  Null subcategoryId;
  int serviceId;
  int variantId;
  Null empId;
  String apooDate;
  String apooTime;
  String start;
  String end;
  String storeName;
  String serviceName;
  String serviceVariantDesc;

  CalendarViewModel(
      {this.appId,
      this.storeId,
      this.categoryId,
      this.subcategoryId,
      this.serviceId,
      this.variantId,
      this.empId,
      this.apooDate,
      this.apooTime,
      this.start,
      this.end,
      this.storeName,
      this.serviceName,
      this.serviceVariantDesc});

  CalendarViewModel.fromJson(Map<String, dynamic> json) {
    appId = json['app_id'];
    storeId = json['store_id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    serviceId = json['service_id'];
    variantId = json['variant_id'];
    empId = json['emp_id'];
    apooDate = json['apoo_date'];
    apooTime = json['apoo_time'];
    start = json['start'];
    end = json['end'];
    storeName = json['store_name'];
    serviceName = json['service_name'];
    serviceVariantDesc = json['service_variant_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_id'] = this.appId;
    data['store_id'] = this.storeId;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['service_id'] = this.serviceId;
    data['variant_id'] = this.variantId;
    data['emp_id'] = this.empId;
    data['apoo_date'] = this.apooDate;
    data['apoo_time'] = this.apooTime;
    data['start'] = this.start;
    data['end'] = this.end;
    data['store_name'] = this.storeName;
    data['service_name'] = this.serviceName;
    data['service_variant_desc'] = this.serviceVariantDesc;
    return data;
  }

  static List<CalendarViewModel> getData(dynamic arrData) {
    List<CalendarViewModel> arrTemp = [];

    arrData.forEach((v) {
      arrTemp.add(new CalendarViewModel.fromJson(v));
    });

    return arrTemp;
  }
}
