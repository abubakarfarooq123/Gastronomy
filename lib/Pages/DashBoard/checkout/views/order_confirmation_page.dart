import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/resturant_detail_controller.dart';
import 'package:reserved4u/Pages/DashBoard/checkout/controllers/cart_controller.dart';
import 'package:reserved4u/Pages/DashBoard/checkout/controllers/checkout_controller.dart';
import '../../../../global_variables/global_variables.dart';
import '../constants/app_colors.dart';
import '../widgets/custom_button.dart';

// ignore: must_be_immutable
class OrderConfirmationPage extends StatelessWidget {
  OrderConfirmationPage({Key key}) : super(key: key);
  CheckoutController ctr = Get.put(CheckoutController());
  CartController cartController = Get.put(CartController());
  ResturantController resDetailCtr = Get.put(ResturantController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "Order Confirmation",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            //color: Colors.red,
            child: Stack(
              children: [
                const SizedBox(
                  // alignment: Alignment.center,
                  height: 60,
                  width: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Container(
                      height: 160,
                      margin: const EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green.withOpacity(0.2),
                      ),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Booking Confirmed!",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 180,
                            child: Text(
                              "Congratulations! Your order\nwas placed successfully.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )),
                ),
                Positioned(
                    right: (MediaQuery.of(context).size.width / 2) - 25,
                    top: -1,
                    child: Image.asset(
                      "assets/images/checkout/check.png",
                      height: 36,
                    )),
                Positioned(
                    bottom: 58,
                    right: (MediaQuery.of(context).size.width / 2) - 75,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.green.withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 2)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 12),
                        child: Row(
                          children: [
                            Text(
                              "Your Booking - ID:",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            Text(
                              " #${cartController.selectedMenuItem.value.responseData.first.id}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              decoration: BoxDecoration(
                color: appLightGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Restaurant Name",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      resDetailCtr.selectedStore.value,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: appLightGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "COD",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    // Image.asset(
                    //   "assets/images/checkout/visa.png",
                    //   height: 13,
                    //   fit: BoxFit.cover,
                    // )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              decoration: BoxDecoration(
                color: appLightGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Amount",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${double.parse(totalPrice.value.toString()) + double.parse(deliveryCharges.value.toString())}",
                      style: TextStyle(
                          color: appRedColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Text(
              "Booking Details",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          cartController.selectedMenuItem.value.responseData.length == 0
              ? Container()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      cartController.selectedMenuItem.value.responseData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.grey.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8))),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        child: Text(
                                          cartController.selectedMenuItem.value
                                              .responseData[index].quantity
                                              .toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, bottom: 15),
                                          child: Container(
                                            width: 100,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        cartController
                                                            .selectedMenuItem
                                                            .value
                                                            .responseData[index]
                                                            .menuData
                                                            .menuImagePath))),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            cartController
                                                        .selectedMenuItem
                                                        .value
                                                        .responseData[index]
                                                        .menuVariant
                                                        .name ==
                                                    null
                                                ? Text(cartController
                                                    .selectedMenuItem
                                                    .value
                                                    .responseData[index]
                                                    .menuData
                                                    .itemName)
                                                : Text(
                                                    cartController
                                                            .selectedMenuItem
                                                            .value
                                                            .responseData[index]
                                                            .menuData
                                                            .itemName +
                                                        " " +
                                                        cartController
                                                            .selectedMenuItem
                                                            .value
                                                            .responseData[index]
                                                            .menuVariant
                                                            .name,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                            Text(
                                              cartController
                                                  .selectedMenuItem
                                                  .value
                                                  .responseData[index]
                                                  .extras
                                                  .replaceAll(
                                                      RegExp('[^A-Za-z]'), '')
                                                  .replaceAll("id", "")
                                                  .replaceAll("title", "")
                                                  .replaceAll("quantity", ","),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: appDimYellow, borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Payment ",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      // Text(
                      //   "50.00",
                      //   style: TextStyle(
                      //       color: appRedColor,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 25),
                      // ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'cashOnVenue'.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                      ),
                      // Image.asset(
                      //   "assets/images/checkout/visa.png",
                      //   height: 12,
                      //   fit: BoxFit.cover,
                      // )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: CustomButton(
              title: 'Confirm',
              onPressed: () {
                ctr.confirmCheckout();
                // Get.defaultDialog(
                //   radius: 10,
                //   title: "",
                //   content: Column(
                //     children: const [
                //       Text("Your order has been placed succesfully"),
                //     ],
                //   ),
                //   barrierDismissible: false,
                //   confirm: GestureDetector(
                //     onTap: () => Get.back(),
                //     child: Container(
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(8),
                //           color: appRedColor),
                //       child: const Padding(
                //         padding:
                //             EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //         child: Text(
                //           "OK",
                //           style: const TextStyle(color: Colors.white),
                //         ),
                //       ),
                //     ),
                //   ),
                // );
              },
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
