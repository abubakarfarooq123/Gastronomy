class LoginModel {
  int iId;
  String firstName;
  String lastName;
  String email;
  String token;
  String phonenumber;

  LoginModel({this.iId, this.firstName, this.lastName, this.email, this.token, this.phonenumber});

  LoginModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    token = json['token'];
    phonenumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }
}
