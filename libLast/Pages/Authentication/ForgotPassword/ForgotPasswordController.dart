import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/ResponseModel.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:reserved4u/Helper/url.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailText;
  var showLoader = false.obs;
  var emailError = ''.obs;

  @override
  // ignore: must_call_super
  void onInit() {
    emailText = TextEditingController();
  }

  void checkValidation() {
    if (emailText.text.isEmpty) {
      emailError.value = 'enterEmail'.tr;
      showTostMessage(message: 'enterEmail'.tr);
    } else {
      emailError.value = '';
      showLoader.value = true;
      sendFrogotpasswordDataToServer();
    }
  }

  void sendFrogotpasswordDataToServer() async {
    ApiProvider apiProvider = ApiProvider();

    await apiProvider.post(ApiUrl.forgotPassword, {
      'email': emailText.text.trim(),
    }).then(
      (value) {
        var responseJson = json.decode(value.body);
        print(responseJson);
        ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
        if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
          Get.back();
        }

        showTostMessage(message: _responseModel.responseText);
        showLoader.value = false;
      },
    );
  }
}
