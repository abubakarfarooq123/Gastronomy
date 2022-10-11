import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/ResponseModel.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:reserved4u/Helper/commanFuncation.dart';
import 'package:reserved4u/Helper/preferences.dart';
import 'package:reserved4u/Helper/url.dart';

class GuestUserController extends GetxController {
  TextEditingController emailText;
  TextEditingController phnNoText;
  TextEditingController fname;
  TextEditingController lname;
  var deviceid;
  BuildContext context;
  var showLoader = false.obs;

  @override
  // ignore: must_call_super
  void onInit() {
    getId();
    emailText = TextEditingController();
    phnNoText = TextEditingController();
    fname = TextEditingController();
    lname = TextEditingController();
  }

  void getId() async {
    if (Platform.isIOS == true) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;

      deviceid = iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;

      deviceid = androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  void checkValidation() {
    if (fname.text.isEmpty) {
      showTostMessage(message: 'tostfirstname'.tr);
    } else if (lname.text.isEmpty) {
      showTostMessage(message: 'tostlastname'.tr);
    } else if (emailText.text.isEmpty) {
      showTostMessage(message: 'tostemail'.tr);
    } else if (CommonVariables(context: context)
            .validationEmail(input: emailText.text) ==
        false) {
      showTostMessage(message: 'tostVemail'.tr);
    } else if (phnNoText.text.length < 11) {
      showTostMessage(message: 'phoneNumberValid'.tr);
    } else {
      sendGuestuserToServer();
    }
  }

  void sendGuestuserToServer() async {
    ApiProvider apiProvider = ApiProvider();

    await apiProvider.post(ApiUrl.guestuser, {
      'email': emailText.text.trim(),
      'first_name': fname.text.trim(),
      'last_name': lname.text.trim(),
      'phone_number': phnNoText.text.trim(),
      'device_token': "",
      'device_id': deviceid,
      'device_type': Platform.isIOS ? "ios" : "Android",
      'user_type': "guest",
    }).then(
      (value) {
        var responseJson = json.decode(value.body);
        print(responseJson);
        ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
        if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
          Preferences.preferences
              .saveBool(key: PrefernceKey.isGuestUser, value: true);
          var token = responseJson["ResponseData"]["token"];
          var user = responseJson["ResponseData"]["user"];

          Preferences.preferences
              .saveString(key: PrefernceKey.loginToken, value: token);

          Preferences.preferences
              .saveString(value: jsonEncode(user), key: PrefernceKey.userData);
          Get.back();
          Get.toNamed('/checkoutProcess');
        }

        showTostMessage(message: _responseModel.responseText);
        showLoader.value = false;
      },
    );
  }
}
