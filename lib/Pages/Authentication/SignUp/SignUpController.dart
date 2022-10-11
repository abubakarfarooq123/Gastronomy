import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/ResponseModel.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:reserved4u/Helper/commanFuncation.dart';
import 'package:reserved4u/Helper/url.dart';
import 'package:reserved4u/Pages/Authentication/SignUp/SignUpView.dart';
import 'package:reserved4u/Pages/Authentication/SignUp/otp_verfication_view.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class SignUpController extends GetxController {
  TextEditingController emailText;
  TextEditingController passwordText;
  TextEditingController cpasswordText;
  TextEditingController phoneText;
  TextEditingController fname;
  TextEditingController lname;
  var fnameError = "".obs;
  var lnameError = "".obs;
  var emailError = "".obs;
  var passwordError = "".obs;
  var cpasswordError = "".obs;
  var phoneError = "".obs;
  var isSelect = false.obs;
  TwilioFlutter twilioFlutter;
  var deviceid;
  var fullPhoneNumber;
  String token;
  BuildContext context;

  @override
  // ignore: must_call_super
  Future<void> onInit() async {
    getId();
    emailText = TextEditingController();
    passwordText = TextEditingController();
    cpasswordText = TextEditingController();
    fname = TextEditingController();
    lname = TextEditingController();
    phoneText = TextEditingController();
    token = Platform.isIOS
        ? (await FirebaseMessaging.instance.getAPNSToken())
        : (await FirebaseMessaging.instance.getToken());
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC40a83e0fadacda88ca315d1e8791abaf',
        authToken: '98deaa9be0e1d9ab23b73e4041be868a',
        twilioNumber: '+19802917656');
  }

  void checkValidation() {
    getErrorText();
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
    } else if (passwordText.text.isEmpty) {
      showTostMessage(message: 'tostPW'.tr);
    } else if (passwordText.text.length < 8) {
      showTostMessage(message: 'tostPW8Chr'.tr);
    } else if (CommonVariables(context: context)
            .checkPasswordnewPass(input: passwordText.text) ==
        false) {
      showTostMessage(
          message: "Password must contain alphabets, character and numbers");
    } else if (passwordText.text != cpasswordText.text) {
      showTostMessage(message: 'tostPWnotmatch'.tr);
    } else if (phoneText.text.isEmpty) {
      showTostMessage(message: 'phoneNum'.tr);
    } else {
      verifyAuth();
    }
  }

  Future<void> verifyAuth() async {
    var errorText = ''.obs;
    Map<String, dynamic> body = {
      'email': emailText.text,
      'phone_number': fullPhoneNumber.toString(),
    };
    try {
      http.Response value = await ApiProvider().post(ApiUrl.emailexist, body);
      var responseJson = json.decode(value.body);
      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        sendSms(phoneNUmber: fullPhoneNumber);
      } else {
        showTostMessage(message: responseJson["ResponseText"]);
        errorText.value = responseJson["ResponseText"];
        Get.offAll('/signup', arguments: true);
        // Navigator.of(context)
        //     .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
        // Get.to(SignUpView());
      }
    } catch (e) {
      print(e);
      showTostMessage(message: errorText.value);
      // showTostMessage(message: e.toString());
      throw e;
    }
  }

  void sendSms({phoneNUmber}) async {
    var rndnumber = "";
    var rnd = new Random();
    for (var i = 0; i < 6; i++) {
      rndnumber = rndnumber + rnd.nextInt(9).toString();
      print("rndnumber");
      print(rndnumber);
    }
    try {
      twilioFlutter.sendSMS(
          toNumber: phoneNUmber,
          messageBody: 'Dein reserved4you Code ist:$rndnumber');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Otp Sent Successfully')));
      Get.to(
        () => OtpVerificationView(
          email: emailText.text.trim(),
          device_id: deviceid,
          device_token: token,
          device_type: Platform.isIOS ? "ios" : "Android",
          first_name: fname.text.trim(),
          join_newsletter: isSelect.value == true ? "1" : "0",
          last_name: lname.text.trim(),
          password: passwordText.text.trim(),
          phone: phoneNUmber,
          otp: rndnumber,
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $error')));
    }
  }

  void rememberOntap() {
    isSelect.value = !isSelect.value;
  }

  void getErrorText() {
    if (fname.text.trim() == "") {
      fnameError.value = 'tostfirstname'.tr;
    } else {
      fnameError.value = '';
    }

    if (lname.text.trim() == "") {
      lnameError.value = 'tostlastname'.tr;
    } else {
      lnameError.value = '';
    }

    if (emailText.text.trim() == "") {
      emailError.value = 'tostemail'.tr;
    } else {
      if (CommonVariables(context: context)
              .validationEmail(input: emailText.text) ==
          false) {
        emailError.value = 'tostVemail'.tr;
      } else {
        emailError.value = '';
      }
    }

    if (passwordText.text.trim() == "") {
      passwordError.value = 'tostPW'.tr;
    } else {
      if (passwordText.text.length < 8) {
        passwordError.value = 'tostPW8Chr'.tr;
      } else {
        passwordError.value = '';
      }
    }

    if (cpasswordText.text.trim() == '') {
      cpasswordError.value = 'tostCPW'.tr;
    } else {
      if (cpasswordText.text != passwordText.text) {
        cpasswordError.value = 'tostPWnotmatch'.tr;
      } else {
        cpasswordError.value = '';
      }
    }
    if (phoneText.text.trim() == "") {
      phoneError.value = 'phoneNum'.tr;
    } else {
      phoneError.value = '';
    }
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
}
