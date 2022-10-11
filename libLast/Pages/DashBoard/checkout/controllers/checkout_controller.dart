// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../constants/app_colors.dart';
// import '../views/order_confirmation_page.dart';
// import '../widgets/custom_button.dart';

// class CheckoutController extends GetxController {
//   Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
//   RxInt selectedIndex = 1.obs;

//   List<String> tipList = [
//     "0.50€",
//     "1.00€",
//     "2.00€",
//     "3.00€",
//     "Other",
//   ];

//   RxBool saveCardForFuture = false.obs;
//   RxInt step = 1.obs;

//   RxInt selectedTipIndex = 0.obs;
//   RxInt selectedPaymentMethod = 0.obs;

//   void onBackButtonPressed() {
//     Get.back();
//   }

//   selectDeliveryTime(BuildContext context) async {
//     final TimeOfDay timeOfDay = await showTimePicker(
//       context: context,
//       initialTime: selectedTime.value,
//       initialEntryMode: TimePickerEntryMode.input,
//     );
//     if (timeOfDay != null && timeOfDay != selectedTime) {
//       selectedTime.value = timeOfDay;
//     }
//   }

//   void openBottomSheet(BuildContext context) {
//     Get.bottomSheet(
//         SizedBox(
//           height: 250,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 18,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: 5,
//                     width: 100,
//                     decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(8)),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 18,
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   color: appLightGrey,
//                   child: const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                     child: Text(
//                       "Suitable 23.00",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
//                 child: Text(
//                   "25.00",
//                   style: TextStyle(
//                       color: Colors.black.withOpacity(0.6),
//                       fontWeight: FontWeight.normal),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
//                 child: Text(
//                   "30.00",
//                   style: TextStyle(
//                       color: Colors.black.withOpacity(0.4),
//                       fontWeight: FontWeight.normal),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
//                 child: Text(
//                   "40.00",
//                   style: TextStyle(
//                       color: Colors.black.withOpacity(0.2),
//                       fontWeight: FontWeight.normal),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
//                 child: Text(
//                   "50.00",
//                   style: TextStyle(
//                       color: Colors.black.withOpacity(0.1),
//                       fontWeight: FontWeight.normal),
//                 ),
//               ),
//               const SizedBox(
//                 height: 18,
//               ),
//               SizedBox(
//                   width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 18,
//                     ),
//                     child: CustomButton(
//                         title: "Proceed to Billing Detail",
//                         onPressed: () {
//                           Get.back();
//                           Get.to(() => const OrderConfirmationPage());
//                         }),
//                   ))
//             ],
//           ),
//         ),
//         backgroundColor: Colors.white,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(10), topRight: Radius.circular(10))));
//   }
// }

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:pay/pay.dart';
import 'package:pay/pay.dart' as pay;
import 'package:reserved4u/Pages/DashBoard/checkout/controllers/cart_controller.dart';
import '../../../../Helper/NotificatiokKeys.dart';
import '../../../../Helper/ResponseModel.dart';
import '../../../../Helper/apiProvider.dart';
import '../../../../Helper/commanFuncation.dart';
import '../../../../Helper/preferences.dart';
import '../../../../Helper/url.dart';
import '../../../Authentication/Login/LoginModel.dart';
import '../../../BookingSummary/BookingSummaryModel.dart';
import '../../../ProceedToPay/SelectedServiceModel.dart';
import '../../DashBoardController.dart';
import '../../Resturant/resturant_detail_controller.dart';
import '../constants/app_colors.dart';
import '../views/order_confirmation_page.dart';
import '../widgets/custom_button.dart';

class CheckoutController extends GetxController {
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  RxInt selectedIndex = 1.obs;
  var servcesIcon = true.obs;
  var isGoForward = false.obs;
  var selectedPage = 0.obs; // 0 summary, 1 Billing details, 2 complete payment
  var selectedPageTitle = 'proceedToBillingDetail'.tr.obs;
  RxBool saveCardForFuture = false.obs;
  RxInt step = 1.obs;
  // ProceedToPayController _proceedToPayController = Get.find();
  ResturantController storeDetailController = Get.find();
  // ignore: deprecated_member_use
  // var arrSelectedServices = List<SelectedServiceModel>().obs;
  BuildContext context;
  var deviceId;
  TextEditingController emailText;
  TextEditingController phnNoText;
  TextEditingController fname;
  TextEditingController lname;
  var selectedPaymentInd = 0.obs;
  TextEditingController cardNumber;
  TextEditingController expDate;
  TextEditingController cvv;
  var curruntIndex = 0.obs;
  TextEditingController address;
  TextEditingController postalCode;
  TextEditingController city;
  TextEditingController commentText;

  RxInt selectedTipIndex = 0.obs;
  RxInt selectedPaymentMethod = 0.obs;

  var isSaveCardForNextTime = false.obs;
  var paymentmethod = PaymentMethods.masterCard;
  var stripeToken = "";
  var arrTemp = [];
  var selectedStoreId = "";
  var bookingSummaryObj = BookingSummaryData();
  var showLoader = false.obs;
  var totalPrice = 0.00;

  var firstNameEmpty = "".obs;
  var lastNameEmpty = "".obs;
  var emailEmpty = "".obs;
  var phoneNoEmpty = "".obs;
  List<String> tipList = [
    "0.50€",
    "1.00€",
    "2.00€",
    "3.00€",
    "Other",
  ];

  var karlnaPaypalUrl = "";
  RxBool emailEnable = true.obs;
  final FocusNode fNameFocus = FocusNode();
  final FocusNode lNameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode addressFocus = FocusNode();
  final FocusNode PostalCodeFocus = FocusNode();
  final FocusNode cityFocus = FocusNode();
  OverlayEntry overlayEntry;

  var paymentText = [
    'masterCard'.tr,
    'visaCard'.tr,
    'klarna'.tr,
    // 'payPal'.tr,
    'cashOnVenue'.tr,
    Platform.isAndroid ? 'GooglePay'.tr : 'ApplePay'.tr,
  ];

  void onBackButtonPressed() {
    Get.back();
  }

  var images = [
    AssestPath.detailScreen + "Master Card.png",
    AssestPath.detailScreen + "Visa.png",
    AssestPath.detailScreen + "Klarna.png",
    // AssestPath.detailScreen + "PayPal-Logo.wine.png",
    AssestPath.detailScreen + "Cash at Venue.png",
    Platform.isAndroid ? "assets/Group 66513.png" : "assets/Group 66544.png"
  ];
  DashBoardController _dashBoardController = Get.find();
  CartController _cartCon = Get.find();

  @override
  void onInit() async {
    super.onInit();
    // arrSelectedServices.value = _proceedToPayController.arrSelectedServices;
    // totalPrice = _proceedToPayController.totalPrice.value;
    emailText = TextEditingController();
    phnNoText = TextEditingController();
    fname = TextEditingController();
    lname = TextEditingController();
    cardNumber = TextEditingController();
    expDate = TextEditingController();
    cvv = TextEditingController();
    address = TextEditingController(
        text: _dashBoardController.currentLoc.value.toString());
    postalCode = TextEditingController(
        text: _dashBoardController.pincodeForSearch.value.toString());
    city =
        TextEditingController(text: _dashBoardController.city.value.toString());
    commentText = TextEditingController();

    cardNumber.text = "";
    expDate.text = "";
    cvv.text = "";

    CommonVariables(context: context).getId().then((value) {
      deviceId = value;
    });
    // ProceedToPayController _storeDetailController = Get.find();
    // selectedStoreId = _storeDetailController.selectedStoreid;

    checkIfCardSaveAndDataDispaly();
    checkLoginUserDetails();
    // createArrayForAppoinment();

    // StripePayment.setOptions(
    //     StripeOptions(publishableKey: "pk_test_pyAji6er6sj1KeM06MlYOTsy00dkDuHTU2", merchantId: "sk_test_hHiwaXoEWblwzGpUgMsR9W0M00GwOAS2NB", androidPayMode: 'Reserved4you'));
    // print(storeDetailController.storeDetailsObj.value.paymentMethod
    //     .toLowerCase());
    print(
        "storeDetailController.storeDetailsObj.value.paymentMethod.toLowerCase()");
    if (storeDetailController.resturantDetails.value.paymentMethod == null ||
        storeDetailController.resturantDetails.value.paymentMethod
                .toLowerCase() ==
            "both".toLowerCase()) {
      paymentText = [
        'masterCard'.tr,
        'visaCard'.tr,
        'klarna'.tr,
        // 'payPal'.tr,
        'cashOnVenue'.tr,
        Platform.isAndroid ? 'GooglePay'.tr : 'ApplePay'.tr,
      ];
      images = [
        AssestPath.detailScreen + "Master Card.png",
        AssestPath.detailScreen + "Visa.png",
        AssestPath.detailScreen + "Klarna.png",
        // AssestPath.detailScreen + "PayPal-Logo.wine.png",
        AssestPath.detailScreen + "Cash at Venue.png",
        Platform.isAndroid ? "assets/Group 66513.png" : "assets/Group 66544.png"
      ];
      paymentmethod = PaymentMethods.masterCard;
    } else if (storeDetailController.resturantDetails.value.paymentMethod
            .toLowerCase() ==
        "cash".toLowerCase()) {
      paymentmethod = PaymentMethods.cash;
      paymentText = [
        'cashOnVenue'.tr,
      ];

      images = [AssestPath.detailScreen + "Cash at Venue.png"];
      paymentmethod = PaymentMethods.cash;
    } else if (storeDetailController.resturantDetails.value.paymentMethod
            .toLowerCase() ==
        "card".toLowerCase()) {
      paymentText = [
        'masterCard'.tr,
        'visaCard'.tr,
        'klarna'.tr,
        'payPal'.tr,
      ];

      images = [
        AssestPath.detailScreen + "Master Card.png",
        AssestPath.detailScreen + "Visa.png",
        AssestPath.detailScreen + "Klarna.png",
        AssestPath.detailScreen + "PayPal-Logo.wine.png",
        Platform.isAndroid ? "assets/Group 66513.png" : "assets/Group 66512.png"
      ];
      paymentmethod = PaymentMethods.masterCard;
    }
  }

  void checkLoginUserDetails() async {
    var isLogin = await Preferences.preferences
        .getBool(key: PrefernceKey.isUserLogin, defValue: false);
    var isGuestUser = await Preferences.preferences
        .getBool(key: PrefernceKey.isGuestUser, defValue: false);

    if (isLogin || isGuestUser) {
      setUserDataForLogin();
    } else {}
  }

  void setUserDataForLogin() async {
    var userData =
        await Preferences.preferences.getString(key: PrefernceKey.userData);

    var loginUserDataObj = LoginModel.fromJson(jsonDecode(userData));

    emailText.text = loginUserDataObj.email;
    lname.text = loginUserDataObj.lastName;
    fname.text = loginUserDataObj.firstName;
    phnNoText.text = loginUserDataObj.phonenumber;
    emailEnable.value = (emailText.text.trim() == '');
  }

  bool checkValidation() {
    setErrorText();
    if (fname.text.trim().isEmpty) {
      showTostMessage(message: 'tostfirstname'.tr);
      return false;
    } else if (lname.text.trim().isEmpty) {
      showTostMessage(message: 'tostlastname'.tr);
      return false;
    } else if (emailText.text.trim().isEmpty) {
      showTostMessage(message: 'tostemail'.tr);
      return false;
    } else if (CommonVariables(context: context)
            .validationEmail(input: emailText.text) ==
        false) {
      showTostMessage(message: 'tostVemail'.tr);
      return false;
    } else if (phnNoText.text.length < 11 ||
        GetUtils.isPhoneNumber(phnNoText.text) == false) {
      showTostMessage(message: 'phoneNumberValid'.tr);
      return false;
    } else {
      return true;
    }
  }

  void setErrorText() {
    if (fname.text.trim().isEmpty) {
      firstNameEmpty.value = 'tostlastname'.tr;
    } else {
      firstNameEmpty.value = "";
    }

    if (lname.text.trim().isEmpty) {
      lastNameEmpty.value = 'tostlastname'.tr;
    } else {
      lastNameEmpty.value = "";
    }

    if (emailText.text.trim().isEmpty) {
      emailEmpty.value = 'tostemail'.tr;
    } else {
      if (CommonVariables(context: context)
              .validationEmail(input: emailText.text) ==
          false) {
        emailEmpty.value = 'tostVemail'.tr;
      } else {
        emailEmpty.value = "";
      }
    }

    if (GetUtils.isPhoneNumber(phnNoText.text) == false) {
      phoneNoEmpty.value = 'phoneNumberValid'.tr;
    } else if (phnNoText.text.length < 11) {
      phoneNoEmpty.value = 'phoneNumberValid'.tr;
    } else {
      phoneNoEmpty.value = "";
    }
  }

  confirmCheckout() {
    List tempCart = [];
    for (int i = 0;
        i > _cartCon.selectedMenuItem.value.responseData.length;
        i++) {
      tempCart.add(
          "{\"category_id\":${_cartCon.selectedMenuItem.value.responseData[i].categoryId.toString()},\"subcategory_id\":${_cartCon.selectedMenuItem.value.responseData[i].subcategoryId.toString()},\"menu_id\":${_cartCon.selectedMenuItem.value.responseData[i].menuId.toString()},\"menu_variant_id\":${_cartCon.selectedMenuItem.value.responseData[i].menuVariantId.toString()},\"extras\":${_cartCon.selectedMenuItem.value.responseData[i].extras.toString()}\"quantity\":${_cartCon.selectedMenuItem.value.responseData[i].quantity.toString()}");
    }

    print(tempCart.toString());
    showLoader.value = true;
    ApiProvider apiProvider = ApiProvider();

    var body = {
      "first_name": fname.text,
      "last_name": lname.text,
      "email": emailText.text,
      "phone_number": phnNoText.text.toString(),
      "address": _dashBoardController.currentLoc.value.toString(),
      "postal_code": _dashBoardController.pincodeForSearch.value.toString(),
      "city": _dashBoardController.city.value.toString(),
      "order_note": commentText.text,
      "store_id":
          _cartCon.selectedMenuItem.value.responseData.first.storeId.toString(),
      "cartItems": tempCart.toString(),
      "delivery_time": "asap",
      "tips": "0.50",
      "amount": "100.0",
      "payment_method": "cash"
    };
    print(body);
    apiProvider.post(ApiUrl.checkoutdata, body).then((value) {
      var responseJson = json.decode(value.body);
      print(responseJson);
      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        showLoader.value = false;
        showTostMessage(message: _responseModel.responseText);
        Get.offNamed('/bottomNavBar');
      } else {
        showLoader.value = false;
        showTostMessage(message: _responseModel.responseText);
      }
    });
  }

  void withDrawPaymentToServer() async {
    showLoader.value = true;
    ApiProvider apiProvider = ApiProvider();
    var arrStr = expDate.text.split("/");
    print('arrStr.first.toString()');
    print(arrStr.first.toString());
    print(arrStr.last.toString());
    var body = {
      'store_id': selectedStoreId.toString(),
      'amount': totalPrice.toString(),
      // 'stripeToken': stripeToken,
      'payment_method': paymentmethod,
      'first_name': fname.text,
      'last_name': lname.text,
      'email': emailText.text,
      'phone_number': phnNoText.text,
      'AppoData': jsonEncode(arrTemp),
      'device_token': deviceId,
      'card_number': '${cardNumber.text.toString()}',
      'ex_month': "${arrStr.first.toString()}",
      'ex_year': "${arrStr.last.toString()}",
      'cvv': "${cvv.text.toString()}",
    };

    print('lbkjkkhkjhjhjhkjh');
    print(jsonEncode(body));

    await apiProvider.post(ApiUrl.withdrawpayment, body).then(
      (value) {
        print('value.body');
        print(value.body);
        var responseJson = json.decode(value.body);
        print('responseJson');
        print(responseJson);
        ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
        print(_responseModel.responseText);
        if (_responseModel.responseCode == 0 &&
            _responseModel.responseText == "Fails") {
          print('responseJson11');
          print(_responseModel.responseText);
          showLoader.value = false;
          showTostMessage(message: _responseModel.responseText);
          showMyDialog();
          clearParticularStoreSelection();
        } else if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
          var responsedata = responseJson["ResponseData"];
          goToDifferentPagesForPayment(responsedata);
          showTostMessage(message: _responseModel.responseText);
          showLoader.value = false;
          print('responseJson22');
        } else {
          print('responseJsonElse');
          print('_responseModel.responseText');
          print(_responseModel.responseText);
          showTostMessage(message: _responseModel.responseText);
          showLoader.value = false;
        }
        showLoader.value = false;
      },
    );
  }

  selectDeliveryTime(BuildContext context) async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      selectedTime.value = timeOfDay;
      print("select Delivery Time::::::${selectedTime.value}");
    }
  }

  void checkPaymentStatusForKarlnaPaypal() async {
    showLoader.value = true;
    ApiProvider apiProvider = ApiProvider();
    print(karlnaPaypalUrl);
    await apiProvider.getApiCall(karlnaPaypalUrl).then((value) {
      var responseJson = json.decode(value.body);
      print(responseJson);
      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        var responsedata = responseJson["ResponseData"];
        bookingSummaryObj = BookingSummaryData.fromJson(responsedata);
        bookingSummaryObj.isSuccess = 1;
        Get.toNamed("/confirmPaymentView", arguments: bookingSummaryObj);
      } else if (_responseModel.responseCode == 0) {
        var responsedata = responseJson["ResponseData"];
        bookingSummaryObj = BookingSummaryData.fromJson(responsedata);
        bookingSummaryObj.isSuccess = 0;
        Get.toNamed("/confirmPaymentView", arguments: bookingSummaryObj);
      }

      showLoader.value = true;
    });
  }

  void goToDifferentPagesForPayment(dynamic responsedata) {
    if (paymentmethod == PaymentMethods.cash ||
        paymentmethod == PaymentMethods.masterCard ||
        paymentmethod == PaymentMethods.visaCard) {
      bookingSummaryObj = BookingSummaryData.fromJson(responsedata);
      bookingSummaryObj.isSuccess = 1;
      Get.toNamed("/confirmPaymentView", arguments: bookingSummaryObj);
    } else if (paymentmethod == PaymentMethods.paypal ||
        paymentmethod == PaymentMethods.klarna) {
      var obj = KlarnaPaypal.fromJson(responsedata);
      Get.toNamed("/paypalView", arguments: obj);
    }
  }

  // void createArrayForAppoinment() {
  //   arrTemp.clear();
  //   for (SelectedServiceModel obj in arrSelectedServices) {
  //     for (Servicecategory serCate in obj.servicecategory) {
  //       addDataToArray(
  //         arr: serCate.serviceVariant,
  //         subcategoryid: serCate.subcategoryId.toString(),
  //         appDate: obj.appodate,
  //         appotime: obj.appotime,
  //         servicename: serCate.serviceName,
  //         empId: obj.empids.toString(),
  //         serviceid: serCate.id.toString(),
  //       );
  //     }
  //   }
  //   print("arrTemp---------> $arrTemp");
  // }

  void openBottomSheet(BuildContext context) {
    Get.bottomSheet(
        SizedBox(
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 5,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: appLightGrey,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "Suitable 23.00",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
                child: Text(
                  "25.00",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
                child: Text(
                  "30.00",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
                child: Text(
                  "40.00",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.2),
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
                child: Text(
                  "50.00",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.1),
                      fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                  width: double.infinity,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: CustomButton(
                          title: "Proceed to Billing Detail",
                          onPressed: () {
                            Get.back();
                            Get.to(() => OrderConfirmationPage());
                          })))
            ],
          ),
        ),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))));
  }

  void addDataToArray({
    List<SelectedServiceVariant> arr,
    String subcategoryid,
    String appDate,
    String appotime,
    String servicename,
    String empId,
    String serviceid,
  }) {
    for (SelectedServiceVariant objVarient in arr) {
      var temp = {
        "category_id": objVarient.categoryId.toString(),
        "subcategory_id": subcategoryid,
        "store_emp_id": empId,
        "appo_date": appDate,
        "appo_time": appotime,
        "service_id": serviceid.toString(),
        "service_name": servicename,
        "variant_id": objVarient.serviceVariantId.toString(),
        "price": objVarient.vpricefinal.toString(),
      };
      arrTemp.add(temp);
    }
  }

  void checkValidationForCards() {
    if (cardNumber.text.isEmpty) {
      showTostMessage(message: 'enterCardNumber'.tr);
    } else if (cvv.text.isEmpty) {
      showTostMessage(message: 'enterCvv'.tr);
    }
  }

  void doPaymentStatsWise() {
    print('apicall');
    print(paymentmethod);
    print(PaymentMethods.applePay);
    if (paymentmethod == PaymentMethods.cash) {
      withDrawPaymentToServer();
    } else if (paymentmethod == PaymentMethods.masterCard ||
        paymentmethod == PaymentMethods.visaCard) {
      print('jhjkhlhjkhklj');
      if (checkValidationForCardNumbers()) {
        print('checkValidationForCardNumbers');
        // addCardInStripeForCreateToken();
        withDrawPaymentToServer();
      }
    } /*else if (paymentmethod == PaymentMethods.paypal) {
      print('kkk');
      withDrawPaymentToServer();
    }*/
    else if (paymentmethod == PaymentMethods.klarna) {
      print('lll');
      withDrawPaymentToServer();
    } else if (paymentmethod.toLowerCase() ==
            PaymentMethods.applePay.toLowerCase() ||
        paymentmethod.toLowerCase() == PaymentMethods.googlePay.toLowerCase()) {
      print('hhghgghghgh');
      paymentSheet(context: context, price: totalPrice.toString());
    }
  }

  bool checkValidationForCardNumbers() {
    if (cardNumber.text.isEmpty || cardNumber.text.length != 16) {
      showTostMessage(message: 'enterValidCardNumber'.tr);
    } else if (expDate.text.isEmpty) {
      showTostMessage(message: 'enterExpiryDate'.tr);
    } else if (cvv.text.isEmpty) {
      showTostMessage(message: 'enterCardCvv'.tr);
    } else {
      return true;
    }
    return false;
  }

  void saveCardDetailsForNextPayment() {
    var temp = ["${cardNumber.text}", "${expDate.text}", "${cvv.text}"];
    Preferences.preferences
        .saveString(value: jsonEncode(temp), key: PrefernceKey.saveCardData);
    Preferences.preferences.saveBool(
        key: PrefernceKey.isSaveCardData, value: isSaveCardForNextTime.value);
  }

  void checkIfCardSaveAndDataDispaly() async {
    var isCardSave = await Preferences.preferences
        .getBool(key: PrefernceKey.isSaveCardData, defValue: false);

    isSaveCardForNextTime.value = isCardSave;

    if (isSaveCardForNextTime.value) {
      var cardStr = await Preferences.preferences
          .getString(key: PrefernceKey.saveCardData);
      List cardjsn = jsonDecode(cardStr);

      cardNumber.text = cardjsn.first;
      expDate.text = cardjsn[1];
      cvv.text = cardjsn.last;
    }
  }

/////   APPLEPAY INTEGRATION
  Future<void> onApplePayResult(paymentResult) async {
    try {
      debugPrint(paymentResult.toString());
      // print('paymentResult');
      // print(paymentResult["paymentMethod"]);
      // print(paymentResult);
      // 1. Get Stripe token from payment result
      final token = await Stripe.instance.createApplePayToken(paymentResult);
      print(token);
      print(token.id);
      await withDrawPaymentToServerPay(token: token.id);
    } catch (e) {
      print(e);
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  /////    GOOGLEPAY INTEGRATION

  Future<void> onGooglePayResult(paymentResult) async {
    try {
      // 1. Add your stripe publishable key to assets/google_pay_payment_profile.json
      debugPrint(paymentResult.toString());
      // print('paymentResult');
      // print(paymentResult);
      final token =
          paymentResult['paymentMethodData']['tokenizationData']['token'];
      // print('token');
      // print(token);
      final tokenJson = Map.castFrom(json.decode(token));
      // print('tokenJson');
      // print(tokenJson);
      // print('tokenJson');
      // print(tokenJson['id']);
      await withDrawPaymentToServerPay(token: tokenJson['id']);
    } catch (e) {
      print(e);
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  Future paymentSheet({BuildContext context, String price}) async {
    dynamic _paymentItems = [
      pay.PaymentItem(
        label: 'To reserved4you',
        amount: price,
        type: pay.PaymentItemType.item,
        status: pay.PaymentItemStatus.final_price,
      ),
    ];
    Pay payClient;
    if (Platform.isIOS) {
      payClient = Pay.withAssets(['apple_pay_payment_profile.json']);
    } else {
      print('eeeeeeeee');
      payClient = Pay.withAssets(['google_pay_payment_profile.json']);
    }
    try {
      Map<String, dynamic> result =
          await payClient.showPaymentSelector(paymentItems: _paymentItems);
      if (Platform.isIOS) {
        return onApplePayResult(result);
      } else {
        print('result');
        print(result);
        return onGooglePayResult(result);
      }
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future withDrawPaymentToServerPay({var token, var PaymentMethod}) async {
    showLoader.value = true;
    ApiProvider apiProvider = ApiProvider();
    var body = {
      'store_id': selectedStoreId.toString(),
      'amount': totalPrice.toString(),
      'stripeToken': token,
      'payment_method': paymentmethod,
      'first_name': fname.text,
      'last_name': lname.text,
      'email': emailText.text,
      'phone_number': phnNoText.text,
      'AppoData': jsonEncode(arrTemp),
      'device_token': deviceId,
    };

    await apiProvider.post(ApiUrl.withdrawpayment, body).then(
      (value) {
        var responseJson = json.decode(value.body);
        ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
        print(_responseModel.responseText);
        if (_responseModel.responseCode == 0 &&
            _responseModel.responseText == "Fails") {
          showLoader.value = false;
          showTostMessage(message: _responseModel.responseText);
          showMyDialog();
          clearParticularStoreSelection();
        } else if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
          var responsedata = responseJson["ResponseData"];
          bookingSummaryObj = BookingSummaryData.fromJson(responsedata);
          bookingSummaryObj.isSuccess = 1;
          Get.toNamed("/confirmPaymentView", arguments: bookingSummaryObj);
          showTostMessage(message: _responseModel.responseText);
          showLoader.value = false;
        } else {
          showTostMessage(message: _responseModel.responseText);
          showLoader.value = false;
        }
        showLoader.value = false;
      },
    );
  }

  showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'failed'.tr,
            style: TextStyle(
              fontFamily: AppFont.semiBold,
              fontSize: 15,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'dateNotAailble'.tr,
                  style: TextStyle(
                    fontFamily: AppFont.regular,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'closeDilog'.tr,
                style: TextStyle(
                  fontFamily: AppFont.semiBold,
                  fontSize: 15,
                  color: Color(0xFFdb8a8a),
                ),
              ),
              onPressed: () {
                // ProceedToPayController proceedToPay = Get.find();
                // proceedToPay.getSelectedServiceDataToServer();
                Get.back();
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  void clearParticularStoreSelection() {
    ApiProvider apiProvider = ApiProvider();

    var body = {
      "store_id": "",
      "device_token": deviceId,
      "flag": true.toString()
    };
    print(body);
    apiProvider.post(ApiUrl.clearselectionstore, body).then((value) {
      var responseJson = json.decode(value.body);
      print(responseJson);
    });
  }

  showOverlay(BuildContext context) {
    if (overlayEntry != null) return;
    OverlayState overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: 0.0,
          left: 0.0,
          child: doneButton(context));
    });

    overlayState.insert(overlayEntry);
  }

  removeOverlay() {
    if (overlayEntry != null) {
      overlayEntry.remove();
      overlayEntry = null;
    }
  }

  Widget doneButton(context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(top: 0, bottom: 0),
          child: CupertinoButton(
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Text(
              "Done",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
