class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String emailVerifiedAt;
  String profilePic;
  String phoneNumber;
  String city;
  String country;
  String zipcode;
  String status;
  String createdAt;
  String updatedAt;
  String customerId;
  String userType;
  String address;
  String state;
  String socialType;
  String facebookId;
  String googleId;
  String appleId;
  String deviceType;
  String deviceId;
  String deviceToken;
  String userRole;
  String userImagePath = "";
  int allowNotifications;
  var userName = "-";

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.emailVerifiedAt,
      this.profilePic,
      this.phoneNumber,
      this.city,
      this.country,
      this.zipcode,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.customerId,
      this.userType,
      this.address,
      this.state,
      this.socialType,
      this.facebookId,
      this.googleId,
      this.appleId,
      this.deviceType,
      this.deviceId,
      this.deviceToken,
      this.userRole,
      this.userImagePath,
      this.allowNotifications});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    profilePic = json['profile_pic'];
    phoneNumber = json['phone_number'];
    city = json['city'];
    country = json['country'];
    zipcode = json['zipcode'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customerId = json['customer_id'];
    userType = json['user_type'];
    address = json['address'];
    state = json['state'];
    socialType = json['social_type'];
    facebookId = json['facebook_id'];
    googleId = json['google_id'];
    appleId = json['apple_id'];
    deviceType = json['device_type'];
    deviceId = json['device_id'];
    deviceToken = json['device_token'];
    userRole = json['user_role'];
    allowNotifications = json['allow_notifications'];
    userImagePath = json['user_image_path'] ?? "";

    if ((socialType == "facebook" || socialType == "google") &&
        (profilePic.contains("http"))) {
      userImagePath = profilePic;
    }

    if (firstName != null &&
        firstName.isNotEmpty &&
        lastName != null &&
        lastName.isNotEmpty) {
      userName = firstName.substring(0, 1).toUpperCase() +
          lastName.substring(0, 1).toUpperCase();
    } else if (firstName != null || firstName.isNotEmpty) {
      userName = firstName.substring(0, 1).toUpperCase();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['profile_pic'] = this.profilePic;
    data['phone_number'] = this.phoneNumber;
    data['city'] = this.city;
    data['country'] = this.country;
    data['zipcode'] = this.zipcode;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['customer_id'] = this.customerId;
    data['user_type'] = this.userType;
    data['address'] = this.address;
    data['state'] = this.state;
    data['social_type'] = this.socialType;
    data['facebook_id'] = this.facebookId;
    data['google_id'] = this.googleId;
    data['apple_id'] = this.appleId;
    data['device_type'] = this.deviceType;
    data['device_id'] = this.deviceId;
    data['device_token'] = this.deviceToken;
    data['user_role'] = this.userRole;
    data['user_image_path'] = this.userImagePath;
    data['allow_notifications'] = this.allowNotifications;
    return data;
  }
}
