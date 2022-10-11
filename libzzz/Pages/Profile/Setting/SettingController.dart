import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/ResponseModel.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/preferences.dart';
import 'package:reserved4u/Helper/url.dart';
import 'package:reserved4u/Pages/Authentication/Login/LoginModel.dart' as user;
import '../../DashBoard/Resturant/models/review_model.dart';

class SettingController extends GetxController {
  var oldPassword = TextEditingController();
  var newPassword = TextEditingController();
  var confimPassword = TextEditingController();
  var showLoader = false.obs;

  // ignore: deprecated_member_use
  var arrgetUserReviews = List<CustomerReview>().obs;
  var name = TextEditingController();
  var email = TextEditingController();
  var message = TextEditingController();
  RxBool isSwitch = false.obs;
  RxString termsConditionCode = ''.obs;
  RxString privacyPolicyCode = ''.obs;
  bool scrollFirstTime = false;

  @override
  void onInit() {
    super.onInit();
    getAllUserReviews();
    setUserDataForLogin();
    getSelectedLanguage();
    getPrivacyPolicyPage();
    getTermConditionCode();
  }

  ScrollController reviewScroll = ScrollController();

  // void onReviewScrollJump() {
  //   Future.delayed(Duration.zero, () {
  //     int index = -1;
  //     bool flag = false;
  //     print(arrgetUserReviews.length);
  //     print(Get.arguments['menu_id'].toString());
  //     for (int i = 0; i < arrgetUserReviews.length; i++) {
  //       print('print');
  //       print(i);
  //       index++;
  //       if (arrgetUserReviews[i].id.toString() == Get.arguments['id']) {
  //         flag = true;
  //         break;
  //       }
  //     }
  //     // ignore: unnecessary_statements
  //     flag ? reviewScroll.jumpTo((index * 388).toDouble()) : null;
  //   });
  // }

  void getSelectedLanguage() async {
    selectedLanguage.value = await Preferences.preferences
        .getString(key: PrefernceKey.savelanguageKey);
  }

  void setUserDataForLogin() async {
    var userData =
        await Preferences.preferences.getString(key: PrefernceKey.userData);

    var loginUserDataObj = user.LoginModel.fromJson(jsonDecode(userData));

    email.text = loginUserDataObj.email;
    name.text =
        (loginUserDataObj.firstName == null ? "" : loginUserDataObj.firstName) +
            (loginUserDataObj.lastName == null
                ? ""
                : " " + loginUserDataObj.lastName);
  }

  void checkValidation() {
    if (oldPassword.text.isEmpty) {
      showTostMessage(message: 'oldPW'.tr);
    } else if (newPassword.text.isEmpty) {
      showTostMessage(message: 'newPW'.tr);
    } else if (newPassword.text != confimPassword.text) {
      showTostMessage(message: 'notMatch'.tr);
    } else {
      showLoader.value = true;
      changePasswordToServer();
    }
  }

  void changePasswordToServer() async {
    ApiProvider apiProvider = ApiProvider();

    await apiProvider.post(ApiUrl.changepassword, {
      'current_password': oldPassword.text.trim(),
      'new_password': newPassword.text.trim(),
      'confirm_password': confimPassword.text.trim()
    }).then(
      (value) {
        var responseJson = json.decode(value.body);
        print(responseJson);
        ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
        if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
          clearData();
          Get.back();
          Get.back();
        }
        showTostMessage(message: _responseModel.responseText);
        showLoader.value = false;
      },
    );
  }

  clearData() {
    oldPassword.text = "";
    newPassword.text = "";
    confimPassword.text = "";
  }

  void getAllUserReviews() async {
    ApiProvider apiProvider = ApiProvider();
    apiProvider.getApiCall(ApiUrl.getuserreviews).then((value) {
      var responseJson = json.decode(value.body);
      ResponseModel responseModel = ResponseModel.fromJson(responseJson);
      if (responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        var getData = responseJson["ResponseData"];
        arrgetUserReviews.value = CustomerReview.getData(getData);
      }
    });
  }

  Future<void> signOut() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    return _firebaseAuth.signOut().whenComplete(() {
      print("SignOut Done");
    }).catchError((error) {
      print("error in signout $error");
    });
  }

  void deleteUserProfile({bool isUserLogout}) async {
    showLoader.value = true;
    ApiProvider apiProvider = ApiProvider();
    var url = ApiUrl.deleteuserprofile;
    if (isUserLogout) {
      url = ApiUrl.logout;
    }

    apiProvider.getApiCall(url).then((value) {
      var responseJson = json.decode(value.body);
      ResponseModel responseModel = ResponseModel.fromJson(responseJson);
      if (responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        Get.offAllNamed('/selectMainCategory');
        Preferences.preferences
            .saveBool(key: PrefernceKey.isUserLogin, value: false);
        Preferences.preferences
            .saveBool(key: PrefernceKey.isGuestUser, value: false);
        Preferences.preferences
            .saveString(key: PrefernceKey.loginToken, value: "");
        signOut();
      }
      showLoader.value = false;
    });
  }

  void checkValidationForAboutUs() {
    if (name.text.isEmpty) {
      showTostMessage(message: 'tostname'.tr);
    } else if (email.text.isEmpty) {
      showTostMessage(message: 'toastSettingemail'.tr);
    } else if (message.text.isEmpty) {
      showTostMessage(message: 'tostquery'.tr);
    } else {
      showLoader.value = true;
      aboutUsFromServer();
    }
  }

  void aboutUsFromServer() async {
    ApiProvider apiProvider = ApiProvider();

    await apiProvider.post(ApiUrl.contactus, {
      'name': name.text.trim(),
      'email': email.text.trim(),
      'message': message.text.trim()
    }).then(
      (value) {
        var responseJson = json.decode(value.body);
        ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
        if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
          getAllUserReviews();
          showLoader.value = false;
          showTostMessage(message: _responseModel.responseText);
          Get.back();
        } else {
          showLoader.value = false;
          showTostMessage(message: _responseModel.responseText);
        }
      },
    );
  }

  var selectedLanguage = "".obs;

  void updateLocal() {
    Preferences.preferences.saveString(
        key: PrefernceKey.savelanguageKey, value: selectedLanguage.value);
    Get.updateLocale(Locale(selectedLanguage.value));
  }

  void getPrivacyPolicyPage() async {
    ApiProvider apiProvider = ApiProvider();
    await apiProvider
        .getApiCall2(
            "https://www.reserved4you.de/api/v1/user/static-pages?page=datenschutz")
        .then((value) {
      if (value.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(value.body);
        privacyPolicyCode.value = data['ResponseData'];
      }
    });
  }

  void getTermConditionCode() async {
    ApiProvider apiProvider = ApiProvider();
    await apiProvider
        .getApiCall2(
            "https://www.reserved4you.de/api/v1/user/static-pages?page=agb")
        .then((value) {
      if (value.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(value.body);
        termsConditionCode.value = data['ResponseData'];
      }
    });
  }

  void onNotificationOnOff() async {
    Map<String, dynamic> body = {};
    ApiProvider apiProvider = ApiProvider();
    await apiProvider
        .post(
            ApiUrl.allowNotification + "=${isSwitch.isTrue ? '1' : '0'}".trim(),
            body)
        .then((value) {
      print('value');
      print(isSwitch.isTrue);
      print(value);
    });
  }
}
