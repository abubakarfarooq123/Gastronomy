// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:reserved4u/Helper/NotificatiokKeys.dart';
// import 'package:reserved4u/Helper/ResponseModel.dart';
// import 'package:reserved4u/Helper/apiProvider.dart';
// import 'package:reserved4u/Helper/commanFuncation.dart';
// import 'package:reserved4u/Helper/preferences.dart';
// import 'package:reserved4u/Helper/url.dart';
// import 'package:reserved4u/Pages/DashBoard/DetailPage/resturant_detail_controller.dart';
// import 'package:reserved4u/Pages/ProceedToPay/SelectedServiceModel.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:reserved4u/Pages/Profile/Setting/MyBooking/MyBookinModel.dart';
//
// class ProceedToPayController extends GetxController {
//   BuildContext context;
//
//   var deviceId;
//
//   // ignore: deprecated_member_use
//   var arrSelectedServices = List<SelectedServiceModel>().obs;
//
//   // ignore: deprecated_member_use
//   var arrAvailbleTimeSlote = List<AvailableTimeSlot>().obs;
//   var isDateSelected = false.obs;
//   var currentDate = DateTime.now().obs;
//   var currentSelectedIndex = 0;
//   var currentDateFormated = "".obs;
//   var timeSloteSelectedInd = "".obs;
//   var totalPrice = 0.0.obs;
//   var fabIconNumber = false.obs;
//   var isOpenStylist = false.obs;
//   var selectedStylistName = 'selectStylist'.tr.obs;
//   var selectedStoreid = "";
//   PendingModel reScheduleModel;
//   bool isReSchedule = false;
//   RxBool showErrorBox = false.obs;
//   var slectedStylistImage = ''.obs;
//
//   //StoreDetailController storeDetailsCon = Get.find();
//   // ignore: deprecated_member_use
//   var arrAvailbleEmplloyee = List<ServiceViseEmploye>().obs;
//   var selectedEmpId = "";
//
//   @override
//   void onInit() async {
//     super.onInit();
//
//     await CommonVariables(context: context).getId().then((value) {
//       deviceId = value;
//     });
//
//     if (Get.arguments is String) {
//       isReSchedule = false;
//       selectedStoreid = Get.arguments;
//     } else {
//       isReSchedule = true;
//       if (Get.arguments is PendingModel) {
//         reScheduleModel = Get.arguments;
//       }
//       selectedStoreid = reScheduleModel.storeId.toString();
//     }
//
//     getSelectedServiceDataToServer();
//   }
//
//   void getSelectedServiceDataToServer() {
//     ApiProvider apiProvider = ApiProvider();
//     isLoader.value = true;
//
//     var body = {
//       "device_token": deviceId,
//     };
//     print(body);
//     apiProvider.post(ApiUrl.getselectservice, body).then((value) {
//       var responseJson = json.decode(value.body);
//       print(responseJson);
//       ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
//       arrSelectedServices.clear();
//       totalPrice.value = 0;
//       if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
//         var responsedata = responseJson["ResponseData"];
//         arrSelectedServices.value = SelectedServiceModel.getData(responsedata);
//
//         for (SelectedServiceModel temp in arrSelectedServices) {
//           for (Servicecategory obj in temp.servicecategory) {
//             for (SelectedServiceVariant vObj in obj.serviceVariant) {
//               totalPrice += double.parse(vObj.vpricefinal.replaceAll(",", ""));
//             }
//           }
//         }
//
//         isLoader.value = false;
//       } else {
//         isLoader.value = false;
//       }
//     });
//   }
//
//   var isLoader = false.obs;
//
//   void getAvailbleTimeForStoreWithoutEmp() {
//     ApiProvider apiProvider = ApiProvider();
//     isLoader.value = true;
//
//     var currentDateStr = "${currentDate.value.year}-${currentDate.value.month}-${currentDate.value.day}";
//
//     var serviceId = arrSelectedServices[currentSelectedIndex].id.toString();
//     var subServiceArr = arrSelectedServices[currentSelectedIndex].servicecategory;
//     var totalDuration = 0;
//     for (Servicecategory temp in subServiceArr) {
//       for (SelectedServiceVariant vObj in temp.serviceVariant) {
//         totalDuration += int.parse(vObj.durationOfService);
//       }
//     }
//
//     var body = {
//       "category_id": serviceId,
//       "store_id": arrSelectedServices
//           // ignore: invalid_use_of_protected_member
//           .value[currentSelectedIndex]
//           .servicecategory
//           .first
//           .storeId
//           .toString(),
//       "date": currentDateStr,
//       "time": totalDuration.toString(),
//       "device_token": deviceId,
//       "variant_id": subServiceArr.first.serviceVariant.first.serviceVariantId.toString()
//     };
//     print(body);
//     apiProvider.post(ApiUrl.storebookingavailabletimedirect, body).then((value) {
//       var responseJson = json.decode(value.body);
//       print(responseJson);
//       ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
//       arrAvailbleTimeSlote.clear();
//       if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
//         var responsedata = responseJson["ResponseData"];
//         arrAvailbleTimeSlote.value = AvailableTimeSlot.getData(responsedata);
//       } else {}
//
//       isLoader.value = false;
//     });
//   }
//
//   void getAvailbleTimeForStoreWithEmp({String empid}) {
//     isLoader.value = true;
//     ApiProvider apiProvider = ApiProvider();
//
//     var currentDateStr = "${currentDate.value.year}-${currentDate.value.month}-${currentDate.value.day}";
//
//     var serviceId = arrSelectedServices[currentSelectedIndex].id.toString();
//     var subServiceArr = arrSelectedServices[currentSelectedIndex].servicecategory;
//     var totalDuration = 0;
//     for (Servicecategory temp in subServiceArr) {
//       for (SelectedServiceVariant vObj in temp.serviceVariant) {
//         totalDuration += int.parse(vObj.durationOfService);
//       }
//     }
//     selectedEmpId = empid;
//     timeSloteSelectedInd.value = "";
//
//     var body = {
//       "category_id": serviceId,
//       "store_id": arrSelectedServices[currentSelectedIndex].servicecategory.first.storeId.toString(),
//       "date": currentDateStr,
//       "time": totalDuration.toString(),
//       "emp_id": empid,
//       "device_token": deviceId,
//     };
//     print(body);
//     apiProvider.post(ApiUrl.bookingtimeavailable, body).then((value) {
//       print("got response");
//       var responseJson = json.decode(value.body);
//       print(responseJson);
//       ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
//       arrAvailbleTimeSlote.clear();
//       if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
//         var responsedata = responseJson["ResponseData"];
//         arrAvailbleTimeSlote.value = AvailableTimeSlot.getData(responsedata);
//       } else {}
//
//       isLoader.value = false;
//     });
//   }
//
//   void selectDate(BuildContext context) async {
//     var todaysDate = DateTime.now();
//
//     final DateTime pickedDate = await showDatePicker(
//         context: context,
//         builder: (BuildContext context, Widget child) {
//           return Theme(
//             data: ThemeData().copyWith(
//                 colorScheme: ColorScheme.light(
//               primary: Color(0xffdb8a8a),
//             )),
//             child: child,
//           );
//         },
//         initialDate: currentDate.value,
//         firstDate: todaysDate,
//         lastDate: DateTime(2050));
//
//     var orginalCurrentDate = DateTime.now();
//     DateFormat dateFormat = DateFormat("MMMM dd, yyyy");
//     var strNewDate = dateFormat.format(pickedDate);
//     var strOrignalDate = dateFormat.format(orginalCurrentDate);
//
//     if (strNewDate == strOrignalDate) {
//       isPrevious.value = false;
//     } else {
//       isPrevious.value = true;
//     }
//
//     if (pickedDate != null) {
//       currentDate.value = pickedDate;
//       isDateSelected.value = true;
//     } else {
//       isDateSelected.value = false;
//     }
//     currentDateWithFormate();
//   }
//
//   currentDateWithFormate() {
//     DateFormat dateFormat = DateFormat("dd, MMMM yyyy");
//     List<String> _weekList = [
//       'sun'.tr,
//       'mon'.tr,
//       'tues'.tr,
//       'wed'.tr,
//       'thurs'.tr,
//       'fri'.tr,
//       'sat'.tr,
//       'sun'.tr,
//     ];
//     List<String> _monthList = [
//       'january'.tr,
//       'february'.tr,
//       'march'.tr,
//       'april'.tr,
//       'may'.tr,
//       'june'.tr,
//       'july'.tr,
//       'august'.tr,
//       'september'.tr,
//       'october'.tr,
//       'november'.tr,
//       'december'.tr,
//     ];
//     //currentDateFormated.value = dateFormat.format(currentDate.value) + " (" + _weekList[currentDate.value.weekday] + ")";
//     String day = currentDate.value.day.toString().padLeft(2, "0");
//     String month = _monthList[currentDate.value.month - 1];
//     String year = currentDate.value.year.toString();
//     String dayName = currentDateFormated.value = " (" + _weekList[currentDate.value.weekday] + ")";
//
//     currentDateFormated.value = day + ", " + month + " " + year + dayName;
//     // if (selectedEmpId.isEmpty) {
//     //   getAvailbleTimeForStoreWithoutEmp();
//     // } else {
//
//     // }
//     getAvailbleTimeForStoreWithEmp(empid: selectedEmpId);
//   }
//
//   var isPrevious = false.obs;
//
//   void incrementDecrementDate(bool increment) {
//     if (increment) {
//       // next date
//       currentDate.value = currentDate.value.add(Duration(days: 1));
//       currentDateWithFormate();
//       isPrevious.value = true;
//     } else {
//       // prevoius date
//       // currentDate.value = currentDate.value.add(Duration(days: -1));
//       // currentDateWithFormate();
//
//       var orginalCurrentDate = DateTime.now();
//       var nextDate = currentDate.value.add(Duration(days: -1));
//
//       DateFormat dateFormat = DateFormat("MMMM dd, yyyy");
//       var strNewDate = dateFormat.format(nextDate);
//       var strOrignalDate = dateFormat.format(orginalCurrentDate);
//
//       if (strNewDate == strOrignalDate) {
//         currentDate.value = orginalCurrentDate;
//         currentDateWithFormate();
//         isPrevious.value = false;
//       } else {
//         currentDate.value = currentDate.value.add(Duration(days: -1));
//         currentDateWithFormate();
//         isPrevious.value = true;
//       }
//     }
//
//     // if (selectedEmpId.isEmpty) {
//     //   getAvailbleTimeForStoreWithoutEmp();
//     // } else {
//     // }
//     getAvailbleTimeForStoreWithEmp(empid: selectedEmpId);
//   }
//
//   void getServiceViseEmployee({String serviceid, String storeid}) {
//     ApiProvider apiProvider = ApiProvider();
//
//     var body = {"category_id": serviceid, "store_id": storeid};
//     print(body);
//     apiProvider.post(ApiUrl.getavailableempservice, body).then((value) {
//       var responseJson = json.decode(value.body);
//       print(responseJson);
//       ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
//
//       if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
//         var responsedata = responseJson["ResponseData"];
//         var obj = ServiceViseEmploye();
//         obj.empName = 'selectEmployee'.tr;
//
//         arrAvailbleEmplloyee.value = ServiceViseEmploye.getData(responsedata);
//         selectedStylistName.value = arrAvailbleEmplloyee.first.empName.toString();
//         slectedStylistImage.value = arrAvailbleEmplloyee.first.empImagePath.toString();
//         selectedEmpId = arrAvailbleEmplloyee.first.id.toString();
//         currentDateWithFormate();
//         // arrAvailbleEmplloyee.insert(0, obj);
//       } else {}
//     });
//   }
//
//   void checkIfDateAndTimeSelectedThenGoToNext() async {
//     for (SelectedServiceModel temp in arrSelectedServices) {
//       if (temp.appodate.isEmpty || temp.appodate == "0000-00-00") {
//         showErrorBox.value = true;
//         showTostMessage(message: 'pleaseSelectDateAndTime'.tr);
//         return;
//       }
//     }
//
//     var isLogin = await Preferences.preferences.getBool(key: PrefernceKey.isUserLogin, defValue: false);
//
//     var isGuestuser = await Preferences.preferences.getBool(key: PrefernceKey.isGuestUser, defValue: false);
//
//     if (isLogin || isGuestuser) {
//       if (isReSchedule == false) {
//         Get.toNamed('/checkoutProcess');
//       } else {
//         reScheduleAppointment();
//       }
//     } else {
//       Get.toNamed('/login', arguments: false);
//     }
//   }
//
//   Future<void> reScheduleAppointment() async {
//     ApiProvider apiProvider = ApiProvider();
//     isLoader.value = true;
//     var body = {
//       'id': reScheduleModel.appointmentId.toString(),
//       'date': arrSelectedServices.first.appodate,
//       'time': arrSelectedServices.first.appotime,
//       'totalTime': reScheduleModel.variantData.durationOfService,
//     };
//     print(body);
//     await apiProvider.post(ApiUrl.reschedule, body).then((value) {
//       var responseJson = json.decode(value.body);
//       print(responseJson);
//       ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
//       totalPrice.value = 0;
//       if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
//         isLoader.value = false;
//         Get.back();
//       } else {
//         isLoader.value = false;
//       }
//     });
//
//     /*.then((value){
//       isLoader.value = false;
//       Get.back();
//     });*/
//   }
//
//   void cancelService({String serviceid, String servicevariantid, String storeid}) {
//     ApiProvider apiProvider = ApiProvider();
//     isLoader.value = true;
//
//     var body = {
//       "device_token": deviceId,
//       "store_id": storeid,
//       "service_id": serviceid,
//       "service_variant_id": servicevariantid,
//     };
//     print(body);
//     apiProvider.post(ApiUrl.storecancelservice, body).then((value) {
//       var responseJson = json.decode(value.body);
//       print(responseJson);
//       ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
//
//       if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
//         StoreDetailController storeDetailsCon = Get.find();
//
//         storeDetailsCon.getServiceAccrdingtoCatSubCat();
//         storeDetailsCon.getSelectedServiceDataToServer();
//         getSelectedServiceDataToServer();
//       } else {
//         isLoader.value = false;
//       }
//
//       showTostMessage(message: _responseModel.responseText);
//     });
//   }
//
//   void addDateAndTimeInTheSelectedService({String serviceid, String storeid}) {
//     ApiProvider apiProvider = ApiProvider();
//     DateFormat dateFormat = DateFormat("yyyy-MM-dd");
//     var appDate = dateFormat.format(currentDate.value);
//     var subServiceArr = arrSelectedServices[currentSelectedIndex].servicecategory;
//     var totalDuration = 0;
//     for (Servicecategory temp in subServiceArr) {
//       for (SelectedServiceVariant vObj in temp.serviceVariant) {
//         totalDuration += int.parse(vObj.durationOfService);
//       }
//     }
//     var body = {
//       "device_token": deviceId,
//       "category_id": serviceid,
//       "store_id": storeid,
//       "emp_id": selectedEmpId,
//       "appo_date": appDate,
//       "totalTime": totalDuration.toString(),
//       "appo_date_temp": currentDateFormated.value,
//       "appo_time": arrAvailbleTimeSlote[int.parse(timeSloteSelectedInd.value)].time,
//     };
//     print(body);
//     apiProvider.post(ApiUrl.updatecheckoutdata, body).then((value) {
//       var responseJson = json.decode(value.body);
//       print('responseJsonakshay');
//       print(responseJson);
//       ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
//       if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
//         // ignore: unused_local_variable
//         var responsedata = responseJson["ResponseData"];
//       } else {}
//
//       getSelectedServiceDataToServer();
//     });
//   }
// }
