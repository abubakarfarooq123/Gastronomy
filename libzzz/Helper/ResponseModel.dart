class ResponseModel {
  int responseCode;
  String responseText;

  ResponseModel({this.responseCode, this.responseText});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    responseText = json['ResponseText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    data['ResponseText'] = this.responseText;
    return data;
  }
}
