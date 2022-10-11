// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:reserved4u/Helper/NotificatiokKeys.dart';
// import 'package:reserved4u/Helper/ResponseModel.dart';
// import 'package:reserved4u/Helper/apiProvider.dart';
// import 'package:reserved4u/Helper/preferences.dart';
// import 'package:reserved4u/Helper/url.dart';
// import 'package:reserved4u/Pages/DashBoard/Resturant/resturant_detail_controller.dart';

// import 'package:reserved4u/Pages/Notification/notification_service.dart';
// import 'package:reserved4u/Pages/Notification/notifications_model.dart';
// import 'package:reserved4u/Pages/Profile/Setting/givenReview.dart';
// import 'package:reserved4u/Pages/Tabbar/bottombar_controller.dart';
// import 'package:http/http.dart' as http;

// class NotificationController extends GetxController {
//   Rx<NotificationModel> notificationModel = NotificationModel().obs;
//   // RefreshController refreshController = RefreshController();
//   RxBool loader = true.obs;
//   Rx<NotificationModel> notification = NotificationModel().obs;
//   @override
//   void onInit() {
//     super.onInit();
//     checkIfLoginOrNot();
//   }

//   void checkIfLoginOrNot() async {
//     var isLogin = await Preferences.preferences
//         .getBool(key: PrefernceKey.isUserLogin, defValue: false);
//     print("object" + isLogin.toString());
//     if (isLogin) {
//       getNotifications();
//     } else {
//       Get.offAllNamed('/login', arguments: true);
//     }
//   }

//   Future<void> getNotifications() async {
//     ApiProvider api = ApiProvider();
//     var res = await api.getApiCall(ApiUrl.notifications);
//     print(res.body);

//     notification.value = notificationModelFromJson(res.body);
//     loader.value = false;
//   }

// // Future<StoreDetails> getStoreDetails(ResponseDatum obj) async {
// //   ApiProvider apiProvider = ApiProvider();
// //
// //   var body = {
// //     'provider_id': obj.storeId,
// //     'emp_name_search': "",
// //   };
// //
// //   print(body);
// //   http.Response response = await apiProvider.post(ApiUrl.getserviceproviderlist, body);
// //   var responseJson = json.decode(response.body);
// //
// //   print(responseJson);
// //   ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
// //   if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
// //     var responsedata = responseJson["ResponseData"];
// //     return StoreDetails.fromJson(responsedata);
// //   }
// //   return null;
// // }
// }

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:reserved4u/Pages/Notification/notification_service.dart';
import 'package:reserved4u/Pages/Notification/notifications_model.dart';
import '../../Helper/NotificatiokKeys.dart';
import '../../Helper/apiProvider.dart';
import '../../Helper/preferences.dart';
import '../../Helper/url.dart';
import '../Profile/MyBooking/MyBooking.dart';
import '../Profile/Setting/givenReview.dart';
import '../Tabbar/bottombar_controller.dart';

class NotificationController extends GetxController {
  Rx<NotificationsModel> notificationModel = NotificationsModel().obs;
  RefreshController refreshController = RefreshController();
  RxBool loader = true.obs;

  @override
  void onInit() {
    super.onInit();
    checkIfLoginOrNot();
  }

  void checkIfLoginOrNot() async {
    refreshController = RefreshController();
    var isLogin = await Preferences.preferences
        .getBool(key: PrefernceKey.isUserLogin, defValue: false);

    if (isLogin) {
      getNotifications();
    } else {
      //Get.back();
      Get.toNamed('/login', arguments: true);
    }
  }

  Future<void> getNotifications() async {
    notificationModel.value =
        await NotificationService.getNotifications().then((value) {
      loader.value = false;
      return value;
    });
    preferences.saveInt(
      key: PrefernceKey.totalNotification,
      value: notificationModel.value.responseData.length,
    );
    bottomBarController.notificationBadge.value = false;
    refreshController.refreshCompleted();
  }

  Future<void> setPermission(ResponseDatum obj, String action) async {
    ApiProvider apiProvider = ApiProvider();
    await apiProvider.post(ApiUrl.permission, {
      "store_id": obj.storeId,
      "user_id": obj.userId,
      "action": action
    }).then((value) {
      print(value.body);
      getNotifications();
    });
  }

  void onNotificationTap(ResponseDatum obj) {
    print('obj.title');
    print(obj.title);
    if (obj.title == "Antwort auf dein Feedback!") {
      Get.to(() => Givenreview());
    } else if (obj.title == 'Termin storniert !' ||
        obj.title == 'Verschoben !') {
      // Get.to(() => MyBooking(), arguments: 'cancel');
      Get.to(() => MyBooking(), arguments: {
        'status': 'cancel',
        'appointment_id': obj.appointmentId,
      });
    } else if (obj.title == "Feedback reply !") {
      // Get.to(
      //   () => StoreDetailsView(),
      //   arguments: {
      //     'storeId': obj.storeId,
      //     'isHome': true,
      //     'id': obj.appointmentId,
      //     'type': obj.type
      //   },
      // );
    } else if (obj.title == 'Bewertungsanfrage !') {
      Get.to(() => MyBooking(), arguments: {
        'status': 'completed',
        'appointment_id': obj.appointmentId,
        'id': obj.id,
        'type': obj.type,
      });
    } else if (obj.title == 'Kundenprofil - Anfrage !') {
    } else {
      Get.to(() => MyBooking(), arguments: {
        'status': 'pending',
        'appointment_id': obj.appointmentId,
      });
    }
  }

  Future<void> giveFeedBack(ResponseDatum obj) async {
    Get.toNamed('/giveFeedback', arguments: [
      obj.storeId,
      obj.appointment.storeName,
      obj.appointment.storeProfileImagePath,
      obj.appointment.serviceId,
      obj.appointment.serviceName,
      obj.appointment.empName,
      obj.appointment.storeEmpId,
      "",
      "",
      obj.appointment.id,
      false,
    ]).then((value) {
      getNotifications();
    });
  }
}
