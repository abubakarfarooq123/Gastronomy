// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:reserved4u/Pages/PayPalView/PaypalController.dart';
//
// // ignore: must_be_immutable
// class PaypalView extends StatelessWidget {
//   PaypalController _paypalController = Get.put(PaypalController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Get.back();
//             }),
//         backgroundColor: Colors.black12,
//         elevation: 0.0,
//       ),
//       body: Obx(() => WebviewScaffold(
//             debuggingEnabled: false,
//             hidden: true,
//             url: _paypalController.paymentObj.value.redirecttourl,
//             clearCache: true,
//           )),
//     );
//   }
// }
