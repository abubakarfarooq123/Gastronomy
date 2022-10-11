import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Pages/BookingSummary/BookingSummaryController.dart';
import 'package:reserved4u/Pages/Tabbar/BottomNavBar.dart';
import 'BookingSummery.dart';

// ignore: must_be_immutable
class ConfirmPaymentView extends StatelessWidget {
  BookingSummaryController _bookingSummaryController =
      Get.put(BookingSummaryController());
  @override
  Widget build(BuildContext context) {
    print(_bookingSummaryController.bookingSummaryObj.paymentInfo.cardType
        .toString());
    return Container(
      height: Get.height,
      width: Get.width,
      child: Scaffold(
        bottomNavigationBar: bottomNavBar(),
        backgroundColor: Color(AppColor.bgColor),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _bookingSummaryController.bookingSummaryObj.isSuccess == 1
                      ? confirmContainer()
                      : failedContainer(),
                  SizedBox(height: 20),
                  Text(
                    'bookingDetails'.tr,
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(AppColor.textFieldtextColor),
                        fontFamily: AppFont.bold),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 80,
                    width: 80,
                    child: CachedNetworkImage(
                      imageUrl: _bookingSummaryController
                          .bookingSummaryObj.paymentInfo.storeimage,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  bookingContainer(),
                  SizedBox(height: 15),
                  bottomContainer(),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //======= Confirm Container ==========

  Widget confirmContainer() {
    return Container(
      height: 230,
      width: Get.width,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Container(
              height: 180,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Color(AppColor.confirmlightColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'bookingConfirmed'.tr,
                    style: TextStyle(
                        color: Color(AppColor.confirmtextColor),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'congressAppoinment'.tr,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: AppFont.regular),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'successfullyBooking'.tr,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: AppFont.regular),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      color: Color(AppColor.confirmtextColor),
                      borderRadius: BorderRadius.circular(28),
                      border:
                          Border.all(color: Color(AppColor.bgColor), width: 3)),
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Image.asset(
                      AssestPath.detailScreen + 'Right1.png',
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 180),
                height: 45,
                width: 220,
                decoration: BoxDecoration(
                    color: Color(AppColor.bgColor),
                    border: Border.all(
                        color: Color(AppColor.confirmborderColor), width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'yourBookingId'.tr,
                      style: TextStyle(
                          color: Colors.black54, fontFamily: AppFont.regular),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "#" +
                          _bookingSummaryController
                              .bookingSummaryObj.paymentInfo.orderId
                              .toString(),
                      style: TextStyle(
                          color: Colors.black, fontFamily: AppFont.regular),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  //======= Booking Container ==========

  Widget bookingContainer() {
    return Column(
      children: [
        Container(
          height: 60,
          width: Get.width,
          decoration: BoxDecoration(
              color: Color(AppColor.maincategoryDisableColor),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'vanueName'.tr,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: AppFont.regular),
                ),
                Text(
                  _bookingSummaryController
                      .bookingSummaryObj.paymentInfo.storename,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: AppFont.medium),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 60,
          width: Get.width,
          decoration: BoxDecoration(
              color: Color(AppColor.maincategoryDisableColor),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'paidVia'.tr,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: AppFont.regular),
                ),
                Spacer(),
                Image.asset(
                  _bookingSummaryController
                              .bookingSummaryObj.paymentInfo.cardType
                              .toString() ==
                          'MasterCard'
                      ? AssestPath.detailScreen + "MasterCard.png"
                      : _bookingSummaryController
                                  .bookingSummaryObj.paymentInfo.cardType
                                  .toString() ==
                              'Visa'
                          ? AssestPath.detailScreen + "Visa.png"
                          : _bookingSummaryController.bookingSummaryObj
                                      .paymentInfo.paymentMethod
                                      .toString() ==
                                  PaymentMethods.paypal
                              ? AssestPath.detailScreen + "PayPal-Logo.wine.png"
                              : _bookingSummaryController.bookingSummaryObj
                                          .paymentInfo.paymentMethod
                                          .toString() ==
                                      PaymentMethods.klarna
                                  ? AssestPath.detailScreen + "Klarna.png"
                                  // : _bookingSummaryController.bookingSummaryObj.paymentInfo.paymentMethod.toString() == PaymentMethods.applePay
                                  // ? 'assets/Group 66512.png'
                                  // : _bookingSummaryController.bookingSummaryObj.paymentInfo.paymentMethod.toString() == PaymentMethods.googlePay
                                  // ? 'assets/Group 66513.png'
                                  : AssestPath.detailScreen +
                                      "Cash at Venue.png",
                  height: 20,
                ),
                SizedBox(width: 5),
                Text(
                  _bookingSummaryController
                              .bookingSummaryObj.paymentInfo.cardType
                              .toString() ==
                          'MasterCard'
                      ? _bookingSummaryController
                          .bookingSummaryObj.paymentInfo.cardType
                          .toString()
                      : _bookingSummaryController
                                  .bookingSummaryObj.paymentInfo.cardType
                                  .toString() ==
                              'Visa'
                          ? _bookingSummaryController
                              .bookingSummaryObj.paymentInfo.cardType
                              .toString()
                          : _bookingSummaryController.bookingSummaryObj
                                      .paymentInfo.paymentMethod
                                      .toString() ==
                                  "cash"
                              ? 'cash'.tr
                              : _bookingSummaryController
                                  .bookingSummaryObj.paymentInfo.paymentMethod
                                  .toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: AppFont.medium),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 60,
          width: Get.width,
          decoration: BoxDecoration(
              color: Color(AppColor.maincategoryDisableColor),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _bookingSummaryController.bookingSummaryObj.isSuccess == 0
                      ? 'totalpayableamount'.tr
                      : 'totalPaidAmount'.tr,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: AppFont.regular),
                ),
                Text(
                  _bookingSummaryController
                          .bookingSummaryObj.paymentInfo.totalAmount
                          .toString() +
                      appStaticPriceSymbol,
                  style: TextStyle(
                      color: Color(AppColor.moneytextColor),
                      fontSize: 20,
                      fontFamily: AppFont.bold),
                ),
              ],
            ),
          ),
        ),
        BookingSummery()
      ],
    );
  }

  //=======  Bottom Part =========

  Widget bottomContainer() {
    return Container(
      height: 75,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(AppColor.maincategorySelectedColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _bookingSummaryController.bookingSummaryObj.isSuccess == 0
                    ? 'totalpay'.tr
                    : 'totalpaid'.tr,
                style: TextStyle(fontSize: 19, fontFamily: AppFont.bold),
              ),
              SizedBox(width: 5),
              Text(
                _bookingSummaryController
                        .bookingSummaryObj.paymentInfo.totalAmount
                        .toString() +
                    appStaticPriceSymbol,
                style: TextStyle(
                    fontSize: 19,
                    fontFamily: AppFont.bold,
                    color: Color(AppColor.moneytextColor)),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'paidVia'.tr,
                style: TextStyle(fontSize: 12, fontFamily: AppFont.regular),
              ),
              SizedBox(width: 3),
              Image.asset(
                _bookingSummaryController.bookingSummaryObj.paymentInfo.cardType
                            .toString() ==
                        'MasterCard'
                    ? AssestPath.detailScreen + "MasterCard.png"
                    : _bookingSummaryController
                                .bookingSummaryObj.paymentInfo.cardType
                                .toString() ==
                            'Visa'
                        ? AssestPath.detailScreen + "Visa.png"
                        : _bookingSummaryController
                                    .bookingSummaryObj.paymentInfo.paymentMethod
                                    .toString() ==
                                PaymentMethods.paypal
                            ? AssestPath.detailScreen + "PayPal-Logo.wine.png"
                            : _bookingSummaryController.bookingSummaryObj
                                        .paymentInfo.paymentMethod
                                        .toString() ==
                                    PaymentMethods.klarna
                                ? AssestPath.detailScreen + "Klarna.png"
                                // : _bookingSummaryController.bookingSummaryObj.paymentInfo.paymentMethod.toString() == PaymentMethods.applePay
                                //     ? 'assets/Group 66512.png'
                                //     : _bookingSummaryController.bookingSummaryObj.paymentInfo.paymentMethod.toString() == PaymentMethods.googlePay
                                // ? 'assets/Group 66513.png'
                                : AssestPath.detailScreen + "Cash at Venue.png",
                height: 15,
              ),
              SizedBox(width: 3),
              Text(
                _bookingSummaryController.bookingSummaryObj.paymentInfo.cardType
                            .toString() ==
                        'MasterCard'
                    ? _bookingSummaryController
                        .bookingSummaryObj.paymentInfo.cardType
                        .toString()
                    : _bookingSummaryController
                                .bookingSummaryObj.paymentInfo.cardType
                                .toString() ==
                            'Visa'
                        ? _bookingSummaryController
                            .bookingSummaryObj.paymentInfo.cardType
                            .toString()
                        : _bookingSummaryController
                                    .bookingSummaryObj.paymentInfo.paymentMethod
                                    .toString() ==
                                "cash"
                            ? 'cash'.tr
                            : _bookingSummaryController
                                .bookingSummaryObj.paymentInfo.paymentMethod
                                .toString(),
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: AppFont.medium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  InkWell bottomNavBar() {
    return InkWell(
        onTap: () {
          //Get.offAllNamed("/bottomNavBar");

          Get.offAll(() => BottomNavBar());
        },
        child: Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            height: 80,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Color(0xFF101928),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Center(
                child: Text(
                  'confirmed'.tr,
                  style: TextStyle(
                      color: Colors.white,
                      // fontFamily: AppFont.semiBold,
                      fontSize: 18,
                      fontFamily: AppFont.regular),
                ),
              ),
            )));
  }

  Widget failedContainer() {
    return Container(
      height: 230,
      width: Get.width,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Container(
              height: 180,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Color(0xFFfef3f3),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'paymentFailed'.tr,
                    style: TextStyle(
                        color: Color(AppColor.paymentfailedColor),
                        fontSize: 25,
                        fontFamily: AppFont.semiBold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'paymentTryAgain'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF101928),
                        fontSize: 13,
                        fontFamily: AppFont.regular),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                    color: Color(AppColor.paymentfailedColor),
                    borderRadius: BorderRadius.circular(28),
                    border:
                        Border.all(color: Color(AppColor.bgColor), width: 3)),
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: Image.asset(
                    AssestPath.detailScreen + 'Oops!PaymentFailed.png',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 180),
                height: 45,
                width: 220,
                decoration: BoxDecoration(
                    color: Color(AppColor.bgColor),
                    border: Border.all(
                        color: Color(AppColor.confirmborderColor), width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'yourBookingId'.tr,
                      style: TextStyle(
                          color: Colors.black54, fontFamily: AppFont.regular),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "#" +
                              _bookingSummaryController
                                  .bookingSummaryObj.paymentInfo.orderId ??
                          '',
                      style: TextStyle(
                          color: Colors.black, fontFamily: AppFont.regular),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
