


class Office {
  String type;
  int userId;
  String streetName;
  String houseNo;
  String city;
  String postcode;
  String bellName;
  String floor;
  String officeNo;
  String entrance;
  String latitude;
  String longitude;
  String updatedAt;
  String createdAt;
  int id;

  Office(
      {this.type,
      this.userId,
      this.streetName,
      this.houseNo,
      this.city,
      this.postcode,
      this.bellName,
      this.floor,
      this.officeNo,
      this.entrance,
      this.latitude,
      this.longitude,
      this.updatedAt,
      this.createdAt,
      this.id});

  Office.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    userId = json['user_id'];
    streetName = json['street_name'];
    houseNo = json['house_no'];
    city = json['city'];
    postcode = json['postcode'];
    bellName = json['bell_name'];
    floor = json['floor'];
    officeNo = json['office_no'];
    entrance = json['entrance'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['user_id'] = this.userId;
    data['street_name'] = this.streetName;
    data['house_no'] = this.houseNo;
    data['city'] = this.city;
    data['postcode'] = this.postcode;
    data['bell_name'] = this.bellName;
    data['floor'] = this.floor;
    data['office_no'] = this.officeNo;
    data['entrance'] = this.entrance;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

