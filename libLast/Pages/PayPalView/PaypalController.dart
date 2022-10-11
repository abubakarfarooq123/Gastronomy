// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:reserved4u/Helper/NotificatiokKeys.dart';
// import 'package:reserved4u/Pages/BookingSummary/BookingSummaryModel.dart';
//
// import 'package:get/get.dart';
// import 'package:reserved4u/Pages/checkout_Process/CheckoutController.dart';
//
// class PaypalController extends GetxController {
//   var paymentObj = KlarnaPaypal().obs;
//   CheckoutController checkOutController = Get.find();
//
//   @override
//   void onInit() {
//     super.onInit();
//     paymentObj.value = Get.arguments;
//
//     // onURLChangeforWebView();
//   }
//
//   // void onURLChangeforWebView() {
//   //   flutterWebviewPlugin.onUrlChanged.listen((url) {
//   //     print(url);
//   //     Uri urlquery = Uri.parse(url);
//   //
//   //     if (checkOutController.paymentmethod == PaymentMethods.klarna) {
//   //       var param = urlquery.queryParameters['redirect_status'];
//   //       var paymentIntent = urlquery.queryParameters['payment_intent'];
//   //
//   //       if ((param == "succeeded" || param == "failed") &&
//   //           paymentIntent != null) {
//   //         var finaluri =
//   //             "${urlquery.toString()}&appoinment_id=${paymentObj.value.appoinmentid}" +
//   //                 "&store_id=${paymentObj.value.storeId}&device_token=${checkOutController.deviceId}&booking=${paymentObj.value.booking}";
//   //         checkOutController.karlnaPaypalUrl = finaluri;
//   //         checkOutController.checkPaymentStatusForKarlnaPaypal();
//   //         // flutterWebviewPlugin.close();
//   //         Get.back();
//   //       }
//   //     } else if (checkOutController.paymentmethod == PaymentMethods.paypal) {
//   //       var param =
//   //           urlquery.pathSegments[urlquery.pathSegments.length - 1].toString();
//   //
//   //       if (param == "success") {
//   //         var finaluri =
//   //             "${urlquery.toString()}&appoinment_id=${paymentObj.value.appoinmentid}" +
//   //                 "&store_id=${paymentObj.value.storeId}&device_token=${checkOutController.deviceId}&booking=${paymentObj.value.booking}";
//   //         checkOutController.karlnaPaypalUrl = finaluri;
//   //         checkOutController.checkPaymentStatusForKarlnaPaypal();
//   //         // flutterWebviewPlugin.close();
//   //         Get.back();
//   //       }
//   //     }
//   //   });
//   // }
//
//   // final flutterWebviewPlugin = new FlutterWebviewPlugin();
// }
