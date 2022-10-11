import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Pages/Profile/MyBooking/BookingController.dart';

class CancleConfirmation extends StatefulWidget {
  @override
  _CancleConfirmationState createState() => _CancleConfirmationState();
}

class _CancleConfirmationState extends State<CancleConfirmation> {
  // ignore: unused_field
  final _key = GlobalKey();

  BookingController _bookingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: EdgeInsets.only(right: 15, left: 15),
      height: 320,
      width: Get.width - 70,
      decoration: BoxDecoration(
          color: Color(0xffffffff), borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'confirmation'.tr,
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Color(0xff121c29),
                fontSize: 25,
                fontFamily: AppFont.semiBold),
          ),
          Text(
            'areYouSureForCancellation'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff95999f),
                fontFamily: AppFont.medium,
                fontSize: 18,
                decoration: TextDecoration.none),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(13, 13, 0, 13),
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xfffef4ee)),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/DetailScreen/CancellationPolicy.png",
                  height: 50,
                  width: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'cancellationPolicy'.tr,
                      style: TextStyle(
                          color: Color(0xff121a29),
                          fontFamily: AppFont.medium,
                          decoration: TextDecoration.none,
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Text(
                          'showPolicy'.tr,
                          style: TextStyle(
                              color: Color(0xffe19f9d),
                              fontFamily: AppFont.medium,
                              decoration: TextDecoration.none,
                              fontSize: 15),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.back();
              Get.bottomSheet(bottomContainer());
            },
            child: Container(
              height: 50,
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF101928)),
              child: Center(
                  child: Text(
                'yesCancelIt'.tr,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: AppFont.regular,
                    decoration: TextDecoration.none),
              )),
            ),
          ),
        ],
      ),
    ));
  }

  Widget bottomContainer() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: Get.width,
              height: Get.height / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color(0xfffef4ee)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'reasonForCancellation'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(AppColor.firstColour),
                      fontFamily: AppFont.bold,
                      fontSize: 20),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                height: Get.height / 2 - 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Color(0xffffffff)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(AppColor.thirdColour),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            fontFamily: AppFont.regular, fontSize: 15),
                        controller: _bookingController.resonTextController,
                        maxLines: 5,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'typeReson'.tr,
                            hintStyle: TextStyle(
                                fontFamily: AppFont.regular, fontSize: 15)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _bookingController.getCancellationReson();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.width - 100,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(AppColor.firstColour)),
                        child: Text(
                          'send'.tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: AppFont.medium),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
