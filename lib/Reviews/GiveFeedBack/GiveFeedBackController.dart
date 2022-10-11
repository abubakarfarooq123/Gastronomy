import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

import '../../Helper/ResponseModel.dart';
import '../../Helper/apiProvider.dart';
import '../../Helper/url.dart';
import '../../Pages/DashBoard/DashBoardModel.dart';
import '../../Pages/DashBoard/Resturant/resturant_detail_controller.dart';
import '../../Pages/ProceedToPay/SelectedServiceModel.dart';
import 'AllServiceDetailsModel.dart';

class GiveFeedBackController extends GetxController {
  TextEditingController searchController = TextEditingController();
  var selectedInd = 0.obs;
  var selectedStoreId = "".obs;
  var arrAvailbleEmplloyee = <ServiceViseEmploye>[].obs;
  var selecedIndexForEmp = "".obs;
  var arrCategory = <ServiceWiseAllCategory>[].obs;
  var servicerate = "0".obs;
  var ambiente = "0".obs;
  var preieleistungsrate = "0".obs;
  var wartezeit = "0".obs;
  var atmosphare = "0".obs;
  var selectedEmployeeName = 'selectEmployee'.tr.obs;
  var selectedServiceName = 'selectServices'.tr.obs;
  var selectedStoreName = "";
  var selectedStoreImage = "";
  var selectedCategoryId = "".obs;
  // var arrAllServiceData = <AllServiceData>[].obs;
  var selectedSubCategoryId = "".obs;
  var selectedSubCategoryWiseServiceID = "".obs;
  var txtTypeYourExep = TextEditingController();
  // var arrSearchService = <AllServiceServiceSubcategory>[].obs;
  var isSearchServicepen = false.obs;
  // var isFromStoreDetails = false;
  var showLoader = false.obs;
  var empId = "";
  var appointmentIOd = "".obs;
  var selectedMenuId = ''.obs;
  var selectedOrderId = ''.obs;
  var foodRating = ''.obs;
  var dilveryRating = ''.obs;

  @override
  void onInit() {
    super.onInit();
    List<dynamic> arr = Get.arguments;
    // isFromStoreDetails = arr.last;
    print("arr-result$arr");

    // selectedStoreId.value = arr.first.toString();
    // selectedStoreName = arr[1].toString();
    // selectedStoreImage = arr[2].toString();
    // if (!isFromStoreDetails) {
    //   selectedSubCategoryWiseServiceID.value = arr[3].toString();
    //   selectedServiceName.value = arr[4].toString();
    //   selectedEmployeeName.value = arr[5];
    //   empId = arr[6].toString();
    //   selectedCategoryId.value = arr[7].toString();
    //   selectedSubCategoryId.value = arr[8].toString();
    //   appointmentIOd.value = arr[9].toString();
    // }

    // getAllCategoryData();
    // getEmployeesFromServer("");
  }

  void getEmployeesFromServer(String searchText) async {
    ApiProvider apiProvider = ApiProvider();

    await apiProvider.post(ApiUrl.storeemployee,
        {'store_id': selectedStoreId, 'search_by_name': searchText}).then(
      (value) {
        var responseJson = json.decode(value.body);
        print(responseJson);
        // ignore: invalid_use_of_protected_member
        arrAvailbleEmplloyee.value.clear();
        ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
        if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
          var responsedata = responseJson["ResponseData"];
          arrAvailbleEmplloyee.value = ServiceViseEmploye.getData(responsedata);
        }
      },
    );
  }

  void getAllCategoryData() {
    ApiProvider apiProvider = ApiProvider();

    var body = {
      'store_id': selectedStoreId,
    };

    apiProvider.post(ApiUrl.storewisecategory, body).then((value) {
      var responseJson = json.decode(value.body);
      print(responseJson);

      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        var responsedata = responseJson["ResponseData"];
        arrCategory.value = ServiceWiseAllCategory.getData(responsedata);
        // if (!isFromStoreDetails) {
        //   getAllServiceDataAccrodingCat();
        // }
      } else {}
    });
  }

  void validateReview() {
    if (selectedMenuId.value == '') {
      showTostMessage(message: 'Choose item from menu');
    } else if (foodRating.value == '') {
      showTostMessage(message: 'Give rating to food');
    } else if (dilveryRating.value == '') {
      showTostMessage(message: 'Give rating to dilvery');
    } else if (txtTypeYourExep.text.isEmpty) {
      showTostMessage(message: 'writeCommentBelow'.tr);
    } else {
      giveFeedBack();
    }
  }

  void giveFeedBack() async {
    ApiProvider apiProvider = ApiProvider();

    var body = {
      'store_id': selectedStoreId.value.toString(),
      'menu_id': selectedMenuId.value.toString(),
      'order_id': selectedOrderId.value.toString(),
      'food_rate': foodRating.value.toString(),
      'delivery_rate': dilveryRating.value.toString(),
      'comment': txtTypeYourExep.text.toString()
    };

    await apiProvider.post(ApiUrl.userstorerating, body).then(
      (value) {
        showLoader.value = true;

        var responseJson = json.decode(value.body);
        print("reponse of api" + responseJson.toString());
        ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
        if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
          showTostMessage(message: "ratingSubmitedSuccessfully".tr);
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

  // void getAllServiceDataAccrodingCat() async {
  //   ApiProvider apiProvider = ApiProvider();

  //   var body = {
  //     'store_id': selectedStoreId,
  //     'category_id': selectedCategoryId.value.toString(),
  //   };
  //   await apiProvider.post(ApiUrl.getsubcateservice, body).then(
  //     (value) {
  //       var responseJson = json.decode(value.body);
  //       print(responseJson);

  //       ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
  //       if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
  //         var responsedata = responseJson["ResponseData"];
  //         arrAllServiceData.value = AllServiceData.getData(responsedata);
  //       }
  //     },
  //   );
  // }

  // void getAllServiceFromSearch(String searchtext) async {
  //   ApiProvider apiProvider = ApiProvider();

  //   var body = {
  //     'store_id': selectedStoreId,
  //     'search_by_name': searchtext,
  //   };
  //   await apiProvider.post(ApiUrl.storeservicesearch, body).then(
  //     (value) {
  //       var responseJson = json.decode(value.body);
  //       print(responseJson);

  //       ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
  //       // ignore: invalid_use_of_protected_member
  //       arrSearchService.value.clear();
  //       if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
  //         var responsedata = responseJson["ResponseData"];
  //         arrSearchService.value =
  //             AllServiceServiceSubcategory.getData(responsedata);
  //         isSearchServicepen.value = true;
  //       } else {
  //         var responsedata = [];
  //         arrSearchService.value =
  //             AllServiceServiceSubcategory.getData(responsedata);
  //         isSearchServicepen.value = false;
  //       }
  //     },
  //   );
  // }

}
