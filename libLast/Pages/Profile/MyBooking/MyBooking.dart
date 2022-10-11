import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';
import 'package:reserved4u/Pages/Profile/MyBooking/BookingController.dart';
import 'package:reserved4u/Pages/Profile/MyBooking/CalenderTabbat.dart';

// ignore: must_be_immutable
class MyBooking extends StatefulWidget {
  @override
  _MyBookingState createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  final _key = GlobalKey();

  BookingController _bookingController = Get.put(BookingController());

  @override
  void initState() {
    super.initState();

    _bookingController.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Color(AppColor.scaffoldbgcolor),
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CalenderTabBar(),
            Obx(() => CommanWidget(context: context)
                .showlolder(isshowDilog: _bookingController.isLoader.value)),
          ],
        ),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
        backgroundColor: Color(AppColor.scaffoldbgcolor),
        leading: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
          height: 35.0,
          width: 35.0,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              Get.back();
            },
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
        actions: [
          Obx(() => Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Container(
                        height: 35,
                        width: 35,
                        // margin: EdgeInsets.only(right: 40),
                        child: FloatingActionButton(
                          backgroundColor:
                              _bookingController.myBookingSelectedIndex.value ==
                                      0
                                  ? Colors.white
                                  : Colors.black,
                          onPressed: () {
                            _bookingController.setIndex(1);
                          },
                          child: Image.asset(
                            AssestPath.profile + "Calander1.png",
                            height: 15,
                            color: _bookingController
                                        .myBookingSelectedIndex.value ==
                                    0
                                ? Color(0xFF616467)
                                : Color(0xFFc69654),
                          ),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    height: 35,
                    width: 35,
                    child: FloatingActionButton(
                      backgroundColor:
                          _bookingController.myBookingSelectedIndex.value == 1
                              ? Colors.white
                              : Colors.black,
                      onPressed: () {
                        _bookingController.setIndex(0);
                      },
                      child: Image.asset(
                        AssestPath.profile + "Sub-categories.png",
                        height: 13,
                        color:
                            _bookingController.myBookingSelectedIndex.value == 1
                                ? Color(0xFF616467)
                                : Color(0xFFc69654),
                      ),
                    ),
                  ),
                ],
              ))
        ],
        title: Text(
          'myBookings'.tr,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontFamily: AppFont.medium),
        ),
        centerTitle: true,
        elevation: 1);
  }

  Widget cosmeticPopUp() {
    return Container(
      height: 250,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          color: Color(AppColor.bgColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: Get.width,
            child: Center(
                child: Text(
              'changesercice'.tr,
              style: TextStyle(
                  color: Color(AppColor.maincategorySelectedTextColor),
                  fontSize: 20,
                  fontFamily: AppFont.bold),
            )),
            decoration: BoxDecoration(
              color: Color(AppColor.maincategorySelectedColor),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 20),
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: Get.width,
                  color: Color(AppColor.bgColor),
                  child: Text(
                    'Gastronomy-(ComingSoon)'.tr,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontFamily: AppFont.medium),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed('/bottomNavBar');
                  },
                  child: Container(
                    height: 40,
                    width: Get.width,
                    color: Color(AppColor.bgColor),
                    child: Text(
                      'selectedCategory'.tr,
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(AppColor.maincategorySelectedTextColor),
                          fontFamily: AppFont.medium),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: Get.width,
                  color: Color(AppColor.bgColor),
                  child: Text(
                    'Health-(ComingSoon)'.tr,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontFamily: AppFont.medium),
                  ),
                ),
                Container(
                  height: 40,
                  width: Get.width,
                  color: Color(AppColor.bgColor),
                  child: Text(
                    'Law & Advise-(Coming Soon)'.tr,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontFamily: AppFont.medium),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
