import 'dart:convert';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Pages/DashBoard/DashBoardController.dart';
import 'package:reserved4u/Pages/DashBoard/DashBoardModel.dart';
import 'package:reserved4u/Helper/ResponseModel.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:reserved4u/Helper/preferences.dart';
import 'package:reserved4u/Helper/url.dart';
import 'package:get/get.dart';

import '../DashBoard/Resturant/models/resturant_model.dart';

class FavouriteController extends GetxController {
  var resturantArray = <ResturantModel>[].obs;

  var refreshController = RefreshController();
  // var dasboardController = DashBoardController();

  var isLoader = false.obs;

  @override
  void onInit() {
    super.onInit();
    getFavList();
    checkIfLoginOrNot();
  }

  void checkIfLoginOrNot() async {
    // refreshHomePage();
    refreshController = RefreshController();
    var isLogin = await Preferences.preferences
        .getBool(key: PrefernceKey.isUserLogin, defValue: false);

    if (isLogin) {
      getFavList();
    } else {
      //Get.back();
      Get.offAllNamed('/login', arguments: true);
    }
  }

  void doFavouriteFromServer(String storeid, String url) {
    ApiProvider apiProvider = ApiProvider();

    var body = {"store_id": storeid};
    // print(body);
    apiProvider.post(url, body).then((value) {
      var responseJson = json.decode(value.body);
      // print(responseJson);
      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        // dasboardController.getFavList();
        getFavList();
        refreshHomePage();
      } else {}

      showTostMessage(message: _responseModel.responseText);
    });
  }

  // getFavData() {
  //   isLoader.value = true;
  //   ApiProvider apiProvider = ApiProvider();
  //   resturantFav.clear();
  //   var url = ApiUrl.favoriteslist;
  //   var body = {};
  //   apiProvider.post(url, body).then((value) {
  //     var responseJson = json.decode(value.body);
  //     // print(responseJson);
  //     ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
  //     if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
  //       var responsedata = responseJson["ResponseData"];

  //       responseJson["ResponseData"].forEach((data) {
  //         responseJson = ResturantModel.fromJson(data);
  //         resturantFav.add(responseJson);
  //       });
  //       isLoader.value = false;
  //       refreshController.refreshCompleted();

  //       print(
  //           "ressssssssssssssssssssssssssss::::${resturantFav.length == 0 ? true : false}");

  //       //   // return resturantFav;
  //       // } else {
  //       //   return resturantFav;
  //     }
  //   });
  // }

  // Future<ResturantModel> getFavDataRefresh() {
  //   ApiProvider apiProvider = ApiProvider();

  //   resturantFav.clear();

  //   var url = ApiUrl.favoriteslist;
  //   var body = {};

  //   apiProvider.post(url, body).then((value) {
  //     var responseJson = json.decode(value.body);
  //     print(responseJson);
  //     ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
  //     if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
  //       ResturantModel _resturantModel = ResturantModel();
  //       responseJson["ResponseData"].forEach((data) {
  //         _resturantModel = ResturantModel.fromJson(data);

  //         resturantFav.add(_resturantModel);
  //       });
  //       return resturantFav;
  //     } else {
  //       return resturantFav;
  //     }
  //   });
  // }
  getFavList() async {
    isLoader.value = true;
    var api = ApiProvider();

    var res = await api.getApiCall(ApiUrl.getFav);
    print(res.body);
    final jsonString = json.decode(res.body);
    ResturantModel resturantModelx = ResturantModel();

    // print("resturantModelx::::::::::::::::$jsonString");
    print(" jsonString:::${jsonString["ResponseData"]}");
    resturantArray.clear();
    jsonString["ResponseData"] == null
        ? print("true")
        : jsonString["ResponseData"].forEach((data) {
            resturantModelx = ResturantModel.fromJson(data);
            jsonString["ResponseData"] == null
                ? resturantArray = null
                : resturantArray.add(resturantModelx);
            // print(resturantArray.length);
          });
    isLoader.value = false;
    refreshController.refreshCompleted();
    return resturantArray;

    // Preferences.preferences.clearPref();
  }

  void refreshHomePage() {
    DashBoardController _dashboar = Get.find();
    _dashboar.getAllDataForDashboard();
  }
}
