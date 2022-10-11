class VochersModel {
  int id;
  String voucherCode;
  int discount;
  String discountType;
  String startPeriod;
  String endPeriod;
  String createdBy;
  String status;
  String voucherImage;
  Images images;

  VochersModel(
      {this.id,
      this.voucherCode,
      this.discount,
      this.discountType,
      this.startPeriod,
      this.endPeriod,
      this.createdBy,
      this.status,
      this.voucherImage,
      this.images});

  VochersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voucherCode = json['voucher_code'];
    discount = json['discount'];
    discountType = json['discount_type'];
    startPeriod = json['start_period'];
    endPeriod = json['end_period'];
    createdBy = json['created_by'];
    status = json['status'];
    voucherImage = json['voucher_image'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['voucher_code'] = this.voucherCode;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['start_period'] = this.startPeriod;
    data['end_period'] = this.endPeriod;
    data['created_by'] = this.createdBy;
    data['status'] = this.status;
    data['voucher_image'] = this.voucherImage;
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    return data;
  }
}

class Images {
  int id;
  String filename;
  int voucherId;
  String createdAt;
  String updatedAt;

  Images(
      {this.id, this.filename, this.voucherId, this.createdAt, this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filename = json['filename'];
    voucherId = json['voucher_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['filename'] = this.filename;
    data['voucher_id'] = this.voucherId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
