import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:reserved4u/Helper/url.dart';
import 'package:reserved4u/Pages/DashBoard/DashBoardController.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/models/restaurant_menu.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/models/restaurant_menu_list.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/models/subcategory.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/resturant_details_model.dart';
import 'package:reserved4u/Pages/Favourite/FavController.dart';
import 'package:reserved4u/Pages/Profile/Profiile_Model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Helper/NotificatiokKeys.dart';
import '../../../Helper/ResponseModel.dart';
import '../../../Helper/preferences.dart';
import 'models/aboutFacilitesModel.dart';
import 'models/review_model.dart';

class ResturantController extends GetxController {
  RxString selectedTabName = 'Menu'.obs;
  var revierTextEditing = TextEditingController();
  RxString storeID = ''.obs;
  var isLoader = false.obs;
  var menuLoader = false.obs;
  RxList<bool> selectedmenuName = [true, false, false, false].obs;
  var cartButtonVisbility = false.obs;
  RxString selectedDate = 'Monday'.obs;
  RxInt starRatingNumber = 0.obs;
  var selectRadio = "Diced Chiken".obs;

  var ExtraValue = [
    // "Diced Chiken",
    // "Cilantro",
    // "Cheese",
    // "Peppers",
    // "Olives",
    // "Chilli Sauce",
  ].obs;
  var reviewButtonText = 'giveFeedBack'.tr.obs;

  RxInt selectedCategoryIndex = 0.obs;
  RxInt selectedSubCategoryIndex = 0.obs;
  RxInt selectedCategoryID = 0.obs;
  RxInt selectedSubCategoryID = 0.obs;
  RxString selectedCategoryName = ''.obs;
  // RxInt selectedSubCategoryName = 0.obs;
  var userDataObj = User().obs;

  Rx<SubCategory> subCategory = SubCategory().obs;

  RxString selectedSubCategoryName = ''.obs;
  var restaurantMenu = ResturantMenu().obs;
  Rx<RestaurantMenuList> menuList = RestaurantMenuList().obs;

  List<Map<String, dynamic>> checkBoxListData = [
    {"title": "Diced Chiken", "isCheck": false.obs},
    {"title": "Cilantro", "isCheck": false.obs},
    {"title": "Cheese", "isCheck": false.obs},
    {"title": "Peppers", "isCheck": false.obs},
    {"title": "Olives", "isCheck": false.obs},
    {"title": "Chilli Sauce", "isCheck": false.obs},
  ];
  List selectedList = [''.obs, false.obs];
  // Rx<ListTileModel> items = ListTileModel(false, '').obs;

  var type = "";
  PageController pageController = PageController(initialPage: 0);

  var extrasValue = 0.obs;
  var radioValue = [].obs;
  increment() {}
  var resturantDetails = ResturantDetails().obs;
  var aboutFacilites = <ResponseAbout>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    // getRestuarantDetails(20001);
    // checkIfLoginOrNot();

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));

    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<ResturantController>();
  }

  void checkIfLoginOrNot() async {
    var isLogin = await Preferences.preferences
        .getBool(key: PrefernceKey.isUserLogin, defValue: false);

    if (isLogin) {
      // ignore: unrelated_type_equality_checks
      var url = resturantDetails.value.favourite == true
          ? ApiUrl.removefav
          : ApiUrl.addFav;
      doFavouriteFromServer(
        url,
      );
      // _Controller.getAllRestaurantssort();
      // refreshHomePage();
    } else {
      Get.toNamed("/login", arguments: true);
    }
  }

  void doFavouriteFromServer(String url) {
    ApiProvider apiProvider = ApiProvider();

    var body = {"store_id": storeID.value};
    print(body);
    apiProvider.post(url, body).then((value) {
      var responseJson = json.decode(value.body);
      print(responseJson);
      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        resturantDetails.value.favourite.value =
            !resturantDetails.value.favourite.value;

        DashBoardController _dashBoardController = Get.find();
        _dashBoardController.getAllRestaurantssort();
        showTostMessage(message: _responseModel.responseText);
      } else {}
    });
  }

  getRestuarantDetails(store_id) async {
    final api = ApiProvider();
    var res =
        await api.getApiCall(ApiUrl.genralDetails + "?store_id=${store_id}");

    print("here is response");
    print(res.body);
    final jsonString = json.decode(res.body);

    resturantDetails.value =
        ResturantDetails.fromJson(jsonString["ResponseData"]);
    storeID.value = store_id;

    // print(resturantDetails.value.storeAddress);
  }

  openGoogelMap() async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${resturantDetails.value.latitude},${resturantDetails.value.longitude}';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  getfacilities() async {
    final api = ApiProvider();
    var res = await api.getApiCall(ApiUrl.getFacilites);

    aboutFacilites.clear();
    print("here is response");
    print(res.body);
    final jsonString = json.decode(res.body);

    jsonString["ResponseData"].forEach((data) {
      print(data);
      ResponseAbout model = ResponseAbout();

      model = ResponseAbout.fromJson(data);
      aboutFacilites.add(model);
    });
    print(aboutFacilites.first.id);
  }

  var startTime = "".obs;
  var endTime = "".obs;

  isOpen() async {
    DateTime dt = DateTime.now();
    var currenthour = dt.hour;
    var currentmint = dt.minute;
    print("currentTime");
    String time = currenthour.toString() + ":" + currentmint.toString();
    print(currenthour.toString() + ":" + currentmint.toString());

    if (resturantDetails.value.general.openingHours != null) {
      resturantDetails.value.general.openingHours.forEach((element) {
        if (element.startTime != null && element.endTime != null) {
          if (double.parse(element.startTime.split(":")[0]) >=
              double.parse(time.split(":")[0])) {
            print("here break");

            if (element.day == DateFormat('EEEE').format(DateTime.now())) {
              print("Start Time" + element.startTime);
              startTime.value =
                  element.startTime == null ? "00:00" : element.startTime;
              endTime.value =
                  element.endTime == null ? "00:00" : element.endTime;
              print("ID: " + element.id.toString());
            }
            print("CURRENT DAY: " + DateFormat('EEEE').format(DateTime.now()));

            return true;
          }
          return true;
        }
      });
      // print("Null Execution");
    } else {
      print("Null Execution");
    }
  }

  void launchUrls(url) async {
    if (!url.startsWith("http://") && !url.startsWith("https://")) {
      if (!await launchUrl(Uri.parse("http://" + url))) {
        throw 'Could not launch $url';
      }
    }
  }

  var reviews = ResturantReviewModel().obs;
  // ignore: deprecated_member_use
  // var reviews2 = List<CustomerReview>().obs;
  void getResturantReviews({String id, String searchText = ''}) async {
    ApiProvider api = ApiProvider();

    var res = await api.post(
        ApiUrl.resturantsReviews, {"store_id": id, "search_text": searchText});
    print(res.body);
    final jsonString = jsonDecode(res.body);
    // var responseData = jsonString["ResponseData"];
    reviews.value = ResturantReviewModel.fromJson(jsonString["ResponseData"]);
    // reviews2.value = CustomerReview.getData(responseData);
  }

  Future getRestaurantMenu({storeID}) async {
    var response = await ApiProvider()
        .getApiCall(ApiUrl.restaurantMenuApi + "?store_id=$storeID");
    print(ApiUrl.restaurantMenuApi + storeID);
    var jsonBody = json.decode(response.body);
    if (jsonBody['ResponseCode'] == 1) {
      print(jsonBody);
      if (jsonBody['ResponseData'] != null) {
        print(".........................................");
        print("dataaaaaaaaaaaaaaaaa${response.body}");
        // ResturantMenu model = ResturantMenu();
        print(".........................................");

        restaurantMenu.value = ResturantMenuFromJson(response.body);
      } else {}
      selectedCategoryID.value =
          restaurantMenu.value.responseData.categoryData[0].id;
      selectedSubCategoryID.value =
          restaurantMenu.value.responseData.subcategoryList[0].id;

      selectedCategoryName.value =
          restaurantMenu.value.responseData.categoryData[0].name;
      selectedSubCategoryName.value =
          restaurantMenu.value.responseData.subcategoryList[0].name;
    } else {
      print("ELSE(): RESTAURANT DETAIL PAGE: " + response.body.toString());

      /// do some stuff
    }
  }

  Future getRestaurantMenuList(
      {String storeID, String categoryID, String subCategoryID}) async {
    var response = await ApiProvider().getApiCall(ApiUrl.restaurantMenuListApi +
        "?store_id=$storeID&category_id=$categoryID&subcategory_id=$subCategoryID");
    var jsonBody = json.decode(response.body);
    if (jsonBody['ResponseCode'] == 1) {
      if (jsonBody['ResponseData'] != null) {
        print(".........................................");
        print(response.body);
        print(".........................................");
        menuList.value = restaurantMenuListFromJson(response.body);
      }
    } else {}
  }

  Future getSubcategoryByCategoryID({String storeID, String categoryID}) async {
    Map<String, dynamic> body = {
      "store_id": storeID,
      "category_id": categoryID
    };

    var response =
        await ApiProvider().post(ApiUrl.getSubcategoryByCategoryIDAPI, body);
    var jsonBody = json.decode(response.body);
    if (jsonBody['ResponseCode'] == 1) {
      print("getSubCategoryByID(): " + response.body);
      if (jsonBody['ResponseData'] != null) {
        print("getSubCategoryByID(): " + response.body);
        subCategory.value = subCategoryFromJson(response.body);
      } else {}
    } else {
      /// show some server error
    }
  }

  void refreshHomePage() {
    ResturantController _restaurantController = Get.find();

    _restaurantController.getRestuarantDetails(storeID);
  }
}
