import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/ResponseModel.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:reserved4u/Helper/commanFuncation.dart';
import 'package:reserved4u/Helper/preferences.dart';
import 'package:reserved4u/Helper/url.dart';
import 'package:reserved4u/Pages/Profile/MyBooking/BookingSummaryModel.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/models/review_model.dart';
import 'package:reserved4u/Pages/ProceedToPay/SelectedServiceModel.dart';
import 'package:reserved4u/Pages/Profile/MyBooking/MyBookinModel.dart';
import 'package:reserved4u/Pages/Profile/MyBooking/TimeSlotReschedule.dart';
import 'package:reserved4u/Pages/Profile/Profiile_Model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'CalendarViewModel.dart';
import 'package:http/http.dart' as http;

class BookingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'pending'.tr),
    Tab(text: 'running'.tr),
    Tab(text: 'completed'.tr),
    Tab(text: 'canceled'.tr),
  ];
  BuildContext context;
  var calenderSelectedIndex = 1.obs;
  var myBookingSelectedIndex = 0.obs;
  var selectedIndex = 0.obs;
  TextEditingController resonTextController;
  var selectedAppoinmentId = "";
  var refresh1Controller = RefreshController();
  var refresh2Controller = RefreshController();
  var refresh3Controller = RefreshController();
  var refresh4Controller = RefreshController();
  var selectedVariantid = "";
  var selectedStatus = "";
  TabController tabController;

  // calender

  var isOpenDate = false.obs;
  var currentDate = DateTime.now().obs;
  var currentDateFormated = "".obs;
  var isLoader = false.obs;
  var currentSelectedIndex = 0;
  var isDateSelected = false.obs;
  var isHomeScreen = ''.obs;
  var forReview = PendingModel().obs;

  var arrSelectedServices = <SelectedServiceModel>[].obs;

  var arrBookingData = <PendingModel>[].obs;
  ScrollController pendingScroll = ScrollController();
  ScrollController cancelScroll = ScrollController();
  ScrollController completeScroll = ScrollController();

  var arrAvailbleTimeSlote = List<AvailableTimeSlot>().obs;
  var deviceId;
  String userId;
  bool scrollFirstTime = false;
  String notificationAppoId = '';
  var userDataObj = User().obs;
  var arrAvailbleEmplloyee = List<ServiceViseEmploye>().obs;
  var selectedEmpId = "";

  setIndex(value) {
    myBookingSelectedIndex.value = value;
  }

  Future<void> getAllProfileData() async {
    String userStr =
        await Preferences.preferences.getString(key: PrefernceKey.userData);

    userDataObj.value = User.fromJson(jsonDecode(userStr));
  }

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);

    setNotificationOpenApp();
    userId =
        await Preferences.preferences.getString(key: PrefernceKey.userData);
    getSelectedLanguage();
    await CommonVariables(context: context).getId().then((value) {
      deviceId = value;
    });
    getBookingData(isHomeScreen == 'cancelled'
        ? "cancel"
        : (isHomeScreen == "pending"
            ? "pending"
            : (isHomeScreen == "completed" ? "completed" : "pending")));
    currentDateWithFormate();
    resonTextController = TextEditingController();
    getAllBookingDataForCalendar();
    getAllProfileData();
  }

  void setNotificationOpenApp() {
    if (Get.arguments is Map) {
      notificationAppoId = Get.arguments['appointment_id'];
      if (Get.arguments['status'] == 'cancel') {
        isHomeScreen.value = 'cancelled';
        selectedIndex.value = 3;
      } else if (Get.arguments['status'] == 'pending') {
        isHomeScreen.value = 'pending';
        selectedIndex.value = 0;
      } else if (Get.arguments['status'] == 'completed') {
        isHomeScreen.value = 'completed';
        selectedIndex.value = 2;
        myBookingSelectedIndex.value = 0;
      }
    } else {
      isHomeScreen.value = '';
    }
  }

  void onPendingScrollJump() {
    Future.delayed(Duration.zero, () {
      int index = -1;
      bool flag = false;
      for (int i = 0; i < arrBookingData.length; i++) {
        index++;
        if (arrBookingData[i].id.toString() == notificationAppoId) {
          flag = true;
          break;
        }
      }
      flag ? pendingScroll.jumpTo((index * 388).toDouble()) : null;
    });
  }

  void onCompleteScrollJump() {
    Future.delayed(Duration.zero, () {
      int index = -1;
      bool flag = false;
      for (int i = 0; i < arrBookingData.length; i++) {
        index++;
        if (arrBookingData[i].id.toString() ==
            Get.arguments['appointment_id'].toString()) {
          flag = true;
          break;
        }
      }
      // ignore: unnecessary_statements
      flag ? completeScroll.jumpTo((index * 388).toDouble()) : null;
    });
  }

  void onCancelScrollJump() {
    Future.delayed(Duration.zero, () {
      int index = -1;
      bool flag = false;
      for (int i = 0; i < arrBookingData.length; i++) {
        index++;
        if (arrBookingData[i].id.toString() == notificationAppoId) {
          flag = true;
          break;
        }
      }
      // ignore: unnecessary_statements
      flag ? cancelScroll.jumpTo((index * 388).toDouble()) : null;
    });
  }

  getBookingData(String status) {
    print(status);
    isLoader.value = true;
    selectedStatus = status;
    ApiProvider apiProvider = ApiProvider();
    // ignore: invalid_use_of_protected_member
    arrBookingData.value.clear();
    print("id here:  $status");
    // print(
    //     '${ApiUrl.myorderliststatus + status}&user_id=${jsonDecode(userId)['id']}');
    apiProvider
        .getApiCall(
            '${ApiUrl.myorderliststatus + status}&user_id=${jsonDecode(userId)['id']}')
        .then((value) {
      var responseJson = json.decode(value.body);
      ResponseModel responseModel = ResponseModel.fromJson(responseJson);
      print('response heree');
      print(responseModel);
      if (responseModel.responseCode == 1) {
        var getData = responseJson["ResponseData"];
        print('gehegjhggjhgghjg');
        print(getData);
        arrBookingData.value = PendingModel.getData(getData);
        print('arrBookingData.value');
        closeRefreshLoader(status);
        isLoader.value = false;
      } else {
        closeRefreshLoader(status);
        // ignore: invalid_use_of_protected_member
        arrBookingData.value = [];
        isLoader.value = false;
      }
    });
  }

  void closeRefreshLoader(String status) {
    if (status == "pending") {
      refresh1Controller.refreshCompleted();
    } else if (status == "running") {
      refresh2Controller.refreshCompleted();
    } else if (status == "completed") {
      refresh3Controller.refreshCompleted();
    } else {
      refresh4Controller.refreshCompleted();
    }
  }

  int getMonth(String month) {
    List<String> monthList = [
      'Jan',
      'Feb',
      'Mär',
      'Apr',
      'Mai',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Okt',
      'Nov',
      'Dez',
    ];
    getAvailbleTimeForStoreWithEmp(
        empid: currentPendingModel.userId.toString());

    return monthList.indexOf(month);
  }

  getCancellationReson() {
    ApiProvider apiProvider = ApiProvider();
    var body = {
      'appoinment_id': selectedAppoinmentId.toString(),
      'cancel_reson_text': resonTextController.text.toString(),
      'variant_id': selectedVariantid.toString(),
    };
    apiProvider.post(ApiUrl.ordercancellationreason, body).then((value) {
      print(value.body.toString());
      print('jhsjhjhjjj');
      var responseJson = json.decode(value.body);

      ResponseModel responseModel = ResponseModel.fromJson(responseJson);
      if (responseModel.responseCode == 1) {
        getBookingData(selectedStatus);
        Get.back();
        resonTextController = TextEditingController();
        resonTextController.text = "";
      } else {}

      showTostMessage(message: "${responseModel.responseText}");
    });
  }

  // void sendSelectedServiceDataToServer({
  //   String serviceId,
  //   String varientId = "",
  //   String categoryid,
  //   String storeid,
  //   String subcategoryid = "",
  //   PendingModel pendingModel,
  // }) {
  //   ApiProvider apiProvider = ApiProvider();

  //   var body = {
  //     "device_token": deviceId,
  //     "category_id": categoryid,
  //     "service_id": serviceId,
  //     "service_variant_id": varientId,
  //     "store_id": storeid,
  //     "subcategory_id": subcategoryid,
  //   };
  //   print(body);
  //   apiProvider.post(ApiUrl.storeselectservice, body).then((value) {
  //     var responseJson = json.decode(value.body);
  //     print(responseJson);
  //     ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
  //     if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
  //       ResturantController storeDetailsCon =
  //           Get.put(ResturantController());
  //       storeDetailsCon.selectedStoreId = storeid;
  //       if (pendingModel == null) {
  //         Get.toNamed('/proceedToPayView', arguments: storeid);
  //       } else {
  //         Get.toNamed('/proceedToPayView', arguments: pendingModel)
  //             .then((value) {
  //           getBookingData(selectedStatus);
  //         });
  //       }
  //     } else {}
  //   });
  // }

  void getAllBookingDataForCalendar() {
    ApiProvider apiProvider = ApiProvider();
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    var dt = dateFormat.format(currentDate.value);
    var body = {"date": dt};
    print(body);
    apiProvider.post(ApiUrl.getuserappointmentdaymonth, body).then((value) {
      var responseJson = json.decode(value.body);
      print(responseJson);
      // ignore: unused_local_variable
      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        var getData = responseJson["ResponseData"];
        var dateData = getData["dateData"];
        var monthData = getData["MonthData"];

        arrCalendarDataForDaily.value = CalendarViewModel.getData(dateData);
        arrCalendarDataForMonthly.value = CalendarViewModel.getData(monthData);
      } else {}
    });
  }

  var arrCalendarDataForDaily = <CalendarViewModel>[].obs;
  var arrCalendarDataForMonthly = <CalendarViewModel>[].obs;

  void incrementDecrementDate(bool increment) {
    if (increment) {
      // next date
      currentDate.value = currentDate.value.add(Duration(days: 1));
      currentDateWithFormate();
      isPrevious.value = true;
    } else {
      var orginalCurrentDate = DateTime.now();
      var nextDate = currentDate.value.add(Duration(days: -1));

      DateFormat dateFormat = DateFormat("MMMM dd, yyyy");
      var strNewDate = dateFormat.format(nextDate);
      var strOrignalDate = dateFormat.format(orginalCurrentDate);

      if (strNewDate == strOrignalDate) {
        currentDate.value = orginalCurrentDate;
        currentDateWithFormate();
        isPrevious.value = false;
      } else {
        currentDate.value = currentDate.value.add(Duration(days: -1));
        currentDateWithFormate();
        isPrevious.value = true;
      }
      isPrevious.value = false;
    }
    getAvailbleTimeForStoreWithEmp(
        empid: currentPendingModel.userId.toString());
  }

  CalendarController calendarController = CalendarController();
  currentDateWithFormate() {
    DateFormat dateFormat = DateFormat("dd, MMMM yyyy (EEE)", selectedLanguage);
    currentDateFormated.value = dateFormat.format(currentDate.value);
    calendarController.displayDate = currentDate.value;
  }

  var selectedLanguage = "";
  void getSelectedLanguage() async {
    selectedLanguage = await Preferences.preferences
        .getString(key: PrefernceKey.savelanguageKey);
  }

  void selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData().copyWith(
                colorScheme: ColorScheme.light(
              primary: Color(0xffdb8a8a),
            )),
            child: child,
          );
        },
        initialDate: currentDate.value,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));

    var orginalCurrentDate = DateTime.now();

    DateFormat dateFormat = DateFormat("MMMM dd, yyyy");
    var strNewDate = dateFormat.format(pickedDate);
    var strOrignalDate = dateFormat.format(orginalCurrentDate);

    if (strNewDate == strOrignalDate) {
      isPrevious.value = false;
    } else {
      isPrevious.value = true;
    }
    if (pickedDate != null) {
      currentDate.value = pickedDate;
      isDateSelected.value = true;
    } else {
      isDateSelected.value = false;
    }

    currentDateWithFormate();
  }

  var bookingSummaryObj = BookingSummaryData();

  getBookingDetailsFromCalendar({String appID, String serviceID}) {
    ApiProvider apiProvider = ApiProvider();
    print(appID.toString());
    print(serviceID.toString());
    print('serviceID.toString()');
    var body = {
      'appointment_id': appID.toString(),
      'service_id': serviceID.toString(),
    };
    apiProvider.post(ApiUrl.getbookingdetails, body).then((value) {
      var responseJson = json.decode(value.body);
      ResponseModel responseModel = ResponseModel.fromJson(responseJson);
      if (responseModel.responseCode == 1) {
        var responsedata = responseJson["ResponseData"];
        bookingSummaryObj = BookingSummaryData.fromJson(responsedata);

        Get.toNamed('/calenderAppointmentDetail');
      } else {}
    });
  }

  // Future<bool> userIsCommented(String storeId) async {
  //   ApiProvider apiProvider = ApiProvider();
  //   var body = {'store_id': storeId, 'sorting': '', 'search_text': ''};
  //   isLoader.value = true;
  //   try {
  //     http.Response response = await apiProvider.post(ApiUrl.storeReview, body);
  //     var responseJson = json.decode(response.body);
  //     ResponseModel responseModel = ResponseModel.fromJson(responseJson);
  //     if (responseModel.responseCode == 1) {
  //       var responseData = responseJson["ResponseData"];
  //       ReviewModel model = ReviewModel.fromJson(responseData);
  //       for (CustomerReview user in model.customerReview) {
  //         if (user.userId == userDataObj.value.id) {
  //           isLoader.value = false;
  //           return true;
  //         }
  //       }
  //     }
  //     isLoader.value = false;
  //     return false;
  //   } catch (e) {
  //     print(e.toString());
  //     isLoader.value = false;
  //     return false;
  //   }
  // }

  var isOpenStylist = false.obs;
  var isPrevious = false.obs;
  var timeSloteSelectedInd = "".obs;
  var fabIconNumber = false.obs;
  var slectedStylistImage = ''.obs;
  var selectedStylistName = 'selectStylist'.tr.obs;
  PendingModel currentPendingModel;

  Future<void> goReScheduleTimePage(PendingModel pendingModel) async {
    currentPendingModel = pendingModel;
    getAvailbleTimeForStoreWithEmp(
        empid: currentPendingModel.userId.toString());
    timeSloteSelectedInd.value = "";
    getServiceViseEmployee(
        serviceid: currentPendingModel.storeId.toString(),
        storeid: currentPendingModel.storeId.toString());

    Get.to(() => TimeSlotReschedule());
  }

  void getAvailbleTimeForStoreWithEmp({String empid}) {
    ApiProvider apiProvider = ApiProvider();

    var currentDateStr =
        "${currentDate.value.year}-${currentDate.value.month}-${currentDate.value.day}";

    var totalDuration = currentPendingModel.deliveryTip.toString();
    var body = {
      "category_id": currentPendingModel.orderId.toString(),
      "store_id": currentPendingModel.storeId.toString(),
      "date": currentDateStr,
      "time": totalDuration.toString(),
      "device_token": deviceId,
      "emp_id": empid,
    };
    print(body);
    apiProvider.post(ApiUrl.bookingtimeavailable, body).then((value) {
      print("got response");
      var responseJson = json.decode(value.body);
      print(responseJson);
      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      arrAvailbleTimeSlote.clear();
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        var responsedata = responseJson["ResponseData"];
        arrAvailbleTimeSlote.value = AvailableTimeSlot.getData(responsedata);
      } else {}

      isLoader.value = false;
    });
  }

  void addDateAndTimeInTheSelectedService({String serviceid, String storeid}) {
    ApiProvider apiProvider = ApiProvider();
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    var appDate = dateFormat.format(currentDate.value);
    var subServiceArr =
        arrSelectedServices[currentSelectedIndex].servicecategory;
    var totalDuration = 0;
    for (Servicecategory temp in subServiceArr) {
      for (SelectedServiceVariant vObj in temp.serviceVariant) {
        totalDuration += int.parse(vObj.durationOfService);
      }
    }
    var body = {
      "device_token": deviceId,
      "category_id": serviceid,
      "store_id": storeid,
      "emp_id": currentPendingModel.userId.toString(),
      "appo_date": appDate,
      "totalTime": totalDuration.toString(),
      "appo_date_temp": currentDateFormated.value,
      "appo_time":
          arrAvailbleTimeSlote[int.parse(timeSloteSelectedInd.value)].time,
    };
    print(body);
    apiProvider.post(ApiUrl.updatecheckoutdata, body).then((value) {
      var responseJson = json.decode(value.body);
      print(responseJson);
      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        // ignore: unused_local_variable
        var responsedata = responseJson["ResponseData"];
      } else {}
    });
  }

  Future<void> reScheduleAppointment() async {
    ApiProvider apiProvider = ApiProvider();
    isLoader.value = true;
    String date = DateFormat("yyyy-MM-dd").format(currentDate.value);
    print('datetest');
    print(date);
    print(currentPendingModel.id.toString());
    String time =
        arrAvailbleTimeSlote[int.parse(timeSloteSelectedInd.value)].time;
    print(time);
    var body = {
      'id': currentPendingModel.id.toString(),
      'date': date,
      'time': time,
      'totalTime': currentPendingModel.deliveryEndTime.toString(),
    };
    print(body);
    await apiProvider.post(ApiUrl.reschedule, body).then((value) {
      var responseJson = json.decode(value.body);
      print(responseJson);
      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        isLoader.value = false;
        var responsedata = responseJson["ResponseData"];
        print('responsedata');
        print(responsedata);
        bookingSummaryObj = BookingSummaryData.fromJson(responsedata);
        print('bookingSummaryObj');
        print(bookingSummaryObj);
        bookingSummaryObj.isSuccess = 1;
        getBookingData("pending");
        Get.toNamed('/confirmPaymentView', arguments: bookingSummaryObj);
        showTostMessage(message: 'appointmentRescheduleSuccessful'.tr);
      } else {
        isLoader.value = false;
      }
    });
  }

  void getServiceViseEmployee({String serviceid, String storeid}) {
    ApiProvider apiProvider = ApiProvider();
    var body = {"category_id": "1", "store_id": "1"};
    print(body);
    apiProvider.post(ApiUrl.getavailableempservice, body).then((value) {
      var responseJson = json.decode(value.body);
      print(responseJson);
      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);

      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        var responsedata = responseJson["ResponseData"];
        var obj = ServiceViseEmploye();
        obj.empName = 'selectEmployee'.tr;
        arrAvailbleEmplloyee.value = ServiceViseEmploye.getData(responsedata);
        selectedStylistName.value =
            arrAvailbleEmplloyee.first.empName.toString();
        slectedStylistImage.value =
            arrAvailbleEmplloyee.first.empImagePath.toString();
        currentDateWithFormate();
      } else {}
    });
  }
}
