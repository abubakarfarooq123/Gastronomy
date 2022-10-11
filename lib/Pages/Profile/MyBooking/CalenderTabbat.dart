import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Pages/Profile/MyBooking/BookingController.dart';
import 'package:reserved4u/Pages/Profile/MyBooking/DailyView.dart';
import 'package:reserved4u/Pages/Profile/MyBooking/MonthlyView.dart';

// ignore: must_be_immutable
class CalenderTabBar extends StatefulWidget {
  @override
  _CalenderTabBarState createState() => _CalenderTabBarState();
}

class _CalenderTabBarState extends State<CalenderTabBar>
    with TickerProviderStateMixin {
  TabController tabController;
  BookingController _bookingController = Get.find();
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      selectDateContainer(context),
      tabView(),
      Obx(() => (_bookingController.calenderSelectedIndex.value == 0)
          ? DailyView()
          : (_bookingController.calenderSelectedIndex.value == 1)
              ? MonthlyView(tabControllerMonthPage: tabController)
              : Text('noDataFound'.tr))
    ]);
  }

  InkWell chooseDateAndTodayContainer({color, String coname, namecolor, img}) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 40,
        width: Get.width * 0.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "$img",
              color: Color(AppColor.scaffoldbgcolor),
              height: 15,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "$coname",
              style: TextStyle(
                  color: Color(AppColor.scaffoldbgcolor),
                  fontFamily: AppFont.semiBold,
                  fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Container floatingActionButton({String img, truefalse}) {
    return Container(
      height: 30.0,
      width: 30.0,
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          _bookingController.incrementDecrementDate(truefalse);
        },
        child: Container(
          child: Center(
            child: Image.asset(
              AssestPath.detailScreen + "$img",
              color: Colors.black,
              height: 13,
            ),
          ),
        ),
        elevation: 1,
      ),
    );
  }

  Widget tabView() {
    return Container(
      decoration: BoxDecoration(
        color: Color(AppColor.bgColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TabBar(
        controller: tabController,
        onTap: (ind) {
          _bookingController.calenderSelectedIndex.value = ind;
        },
        labelPadding: EdgeInsets.all(0),
        labelStyle: TextStyle(
          fontFamily: AppFont.semiBold,
          fontSize: 15,
        ),
        indicatorColor: Color(AppColor.maincategorySelectedTextColor),
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
        tabs: [
          Tab(
            text: 'daily'.tr,
          ),
          Tab(
            text: 'monthly'.tr,
          ),
        ],
      ),
    );
  }

  Widget selectDateContainer(BuildContext context) {
    return Container(
      height: 125,
      width: Get.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          padding: EdgeInsets.only(bottom: 10),
          height: 90,
          width: Get.width,
          decoration: BoxDecoration(
              color: Color(AppColor.stackColor),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              floatingActionButton(img: "Back.png", truefalse: false),
              Obx(
                () => Text(
                  _bookingController.currentDateFormated.value,
                  style: TextStyle(fontSize: 15, fontFamily: AppFont.medium),
                ),
              ),
              floatingActionButton(img: "Right.png", truefalse: true),
            ],
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.only(top: 90),
            alignment: Alignment.bottomCenter,
            height: 35,
            width: Get.width * 0.42,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(AppColor.maincategorySelectedTextColor)),
            child: TextButton(
              onPressed: () {
                _bookingController.selectDate(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssestPath.detailScreen + "Calander1.png",
                    width: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    'chooseDate'.tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppFont.medium,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              _bookingController.currentDate.value = DateTime.now();
              _bookingController.currentDateWithFormate();
            },
            child: Container(
              margin: EdgeInsets.only(top: 90),
              height: 35,
              width: Get.width * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.black),
              child: Center(
                child: Text(
                  'goToToday'.tr,
                  style: TextStyle(
                      color: Color(AppColor.scaffoldbgcolor),
                      fontFamily: AppFont.semiBold,
                      fontSize: 14),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
