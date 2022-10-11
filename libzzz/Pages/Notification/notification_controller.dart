import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/ResponseModel.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:reserved4u/Helper/preferences.dart';
import 'package:reserved4u/Helper/url.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/resturant_detail_controller.dart';

import 'package:reserved4u/Pages/Notification/notification_service.dart';
import 'package:reserved4u/Pages/Notification/notifications_model.dart';
import 'package:reserved4u/Pages/Profile/Setting/givenReview.dart';
import 'package:reserved4u/Pages/Tabbar/bottombar_controller.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
  Rx<NotificationModel> notificationModel = NotificationModel().obs;
  // RefreshController refreshController = RefreshController();
  RxBool loader = true.obs;
  Rx<NotificationModel> notification = NotificationModel().obs;
  @override
  void onInit() {
    super.onInit();
    checkIfLoginOrNot();
  }

  void checkIfLoginOrNot() async {
    var isLogin = await Preferences.preferences
        .getBool(key: PrefernceKey.isUserLogin, defValue: false);
    print("object" + isLogin.toString());
    if (isLogin) {
      getNotifications();
    } else {
      Get.offAllNamed('/login', arguments: true);
    }
  }

  Future<void> getNotifications() async {
    ApiProvider api = ApiProvider();
    var res = await api.getApiCall(ApiUrl.notifications);
    print(res.body);

    notification.value = notificationModelFromJson(res.body);
    loader.value = false;
  }

// Future<StoreDetails> getStoreDetails(ResponseDatum obj) async {
//   ApiProvider apiProvider = ApiProvider();
//
//   var body = {
//     'provider_id': obj.storeId,
//     'emp_name_search': "",
//   };
//
//   print(body);
//   http.Response response = await apiProvider.post(ApiUrl.getserviceproviderlist, body);
//   var responseJson = json.decode(response.body);
//
//   print(responseJson);
//   ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
//   if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
//     var responsedata = responseJson["ResponseData"];
//     return StoreDetails.fromJson(responsedata);
//   }
//   return null;
// }
}
