import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:reserved4u/Helper/commanFuncation.dart';
import 'package:reserved4u/Helper/preferences.dart';
import 'package:reserved4u/Helper/url.dart';
import 'package:reserved4u/Pages/Tabbar/BottomNavBar.dart';

class FinishingController extends GetxController {
  TextEditingController emailText = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  Map<String, dynamic> appleResponse = {};
  Map<String, dynamic> deviceData = {};
  RxBool showLoader = false.obs;

  var fnameError = "".obs;
  var lnameError = "".obs;
  var emailError = "".obs;
  bool nameEnable = true;

  FinishingController() {
    if (Get.arguments is List) {
      appleResponse = Get.arguments[0];
      deviceData = Get.arguments[1];
      setData();
    }
  }

  void setData() {
    //fname.text = appleResponse['ResponseData']['user']['first_name'].toString();
    if (appleResponse['ResponseData']['user'] != null) {
      fname.text =
          appleResponse['ResponseData']['user']['first_name'].toString();
      lname.text =
          appleResponse['ResponseData']['user']['last_name'].toString() == ""
              ? appleResponse['ResponseData']['user']['first_name'].toString()
              : appleResponse['ResponseData']['user']['last_name'].toString();
      nameEnable = false;
    }
  }

  Future<void> onSubmit() async {
    showLoader.value = true;

    var token = await FirebaseMessaging.instance.getToken();
    var deviceId = await CommonVariables().getId();
    var user = appleResponse["ResponseData"]["user"];

    Map<String, dynamic> data = appleResponse["ResponseData"]["user"];
    ApiProvider apiProvider = ApiProvider();

    var body = {
      "user_name": fname.text + " " + lname.text, //deviceData['user_name'],
      "device_id": deviceId,
      "device_type": "ios",
      "device_token": token,
      "social_id": deviceData['social_id'],
      "email": emailText.text,
      "social_type": "apple",
      "user_id": deviceData['user_id']
    };
    if (data != null && data['profile_pic'] != null) {
      body['profile_pic'] = data['profile_pic'];
    }
    print(body);
    await apiProvider.post(ApiUrl.sociallogin, body).then((value) {
      showLoader.value = false;
      if (value.statusCode == 200) {
        Preferences.preferences
            .saveBool(key: PrefernceKey.isUserLogin, value: true);
        Preferences.preferences.saveString(
            key: PrefernceKey.loginToken,
            value: jsonDecode(value.body)['ResponseData']['token']);

        Preferences.preferences
            .saveString(value: jsonEncode(user), key: PrefernceKey.userData);
        Get.offAll(() => BottomNavBar());
      }
    });
  }

  void checkValidation() {
    if (fname.text.isEmpty) {
      showTostMessage(message: 'tostfirstname'.tr);
    } else if (lname.text.isEmpty) {
      showTostMessage(message: 'tostlastname'.tr);
    } else if (emailText.text.isEmpty) {
      showTostMessage(message: 'tostemail'.tr);
    } else if (GetUtils.isEmail(emailText.text) == false) {
      showTostMessage(message: 'tostVemail'.tr);
    } else {
      onSubmit();
    }
  }
}
