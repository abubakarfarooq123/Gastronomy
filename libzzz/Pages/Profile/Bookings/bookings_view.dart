import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';
import 'package:reserved4u/Pages/Profile/MyBooking/BookingController.dart';
import 'package:reserved4u/Pages/Profile/MyBooking/MyBookinModel.dart';
import 'package:reserved4u/Pages/Profile/reviews/user_review.dart';
import '../../../Helper/NotificatiokKeys.dart';

class Bookings extends StatefulWidget {
  const Bookings({Key key}) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  BookingController _bookingController = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          ),
          toolbarHeight: 0,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(children: [
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(top: 175),
                    height: Get.height * 0.68,
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.0),
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 0.8))),
                          child: TabBar(
                            onTap: (ind) {
                              _bookingController.selectedIndex.value = ind;
                              ind == 0
                                  ? _bookingController.getBookingData("pending")
                                  : ind == 1
                                      ? _bookingController
                                          .getBookingData("running")
                                      : ind == 2
                                          ? _bookingController
                                              .getBookingData("completed")
                                          : _bookingController
                                              .getBookingData("cancelled");
                            },
                            controller: _bookingController.tabController,
                            labelPadding: EdgeInsets.all(0),
                            labelColor: const Color(0xffE14942),
                            indicatorColor: const Color(0xffE14942),
                            unselectedLabelColor: const Color(0xff9E9E9E),
                            tabs: _bookingController.myTabs,
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () => SizedBox(
                              width: double.maxFinite,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                child: TabBarView(
                                  controller: _bookingController.tabController,
                                  children: [
                                    MediaQuery.removePadding(
                                        context: context,
                                        removeTop: true,
                                        child: pending()),
                                    MediaQuery.removePadding(
                                        context: context,
                                        removeTop: true,
                                        child: running()),
                                    MediaQuery.removePadding(
                                        context: context,
                                        removeTop: true,
                                        child: completed()),
                                    MediaQuery.removePadding(
                                        context: context,
                                        removeTop: true,
                                        child: cancled()),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ]),
            headerRow(),
            Positioned(
              top: 170,
              left: Get.width * 0.22,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 8)),
              ),
            ),
            Positioned(
              top: 170,
              left: Get.width * 0.69,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 2)),
              ),
            ),
            Obx(() => CommanWidget(context: context)
                .showlolder(isshowDilog: _bookingController.isLoader.value)),
          ],
        ));
  }

  Widget running() {
    return Container(
      // ignore: invalid_use_of_protected_member
      child: _bookingController.arrBookingData.value.isBlank
          ? Center(
              child: Text(
              'nobookings'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30, fontFamily: AppFont.bold, color: Colors.black),
            ))
          : SmartRefresher(
              controller: _bookingController.refresh2Controller,
              header: ClassicHeader(
                completeText: 'refreshCompleted'.tr,
                releaseText: 'releaseToRefresh'.tr,
                idleText: 'pullDownRefresh'.tr,
              ),
              enablePullDown: true,
              onRefresh: () {
                _bookingController
                    .getBookingData(_bookingController.selectedStatus);
              },
              child: ListView.builder(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: _bookingController.arrBookingData.length,
                itemBuilder: (context, index) {
                  if (_bookingController.arrBookingData == null ||
                      _bookingController.arrBookingData.length == 0) {
                    return SizedBox();
                  }
                  // ignore: invalid_use_of_protected_member
                  var currentObj = _bookingController.arrBookingData[index];
                  return containerDetail(Color(0xFF101928), 'cancel'.tr, false,
                      false, false, currentObj, index, context, 'running');
                },
              ),
            ),
    );
  }

  Widget pending() {
    return Container(
        // ignore: invalid_use_of_protected_member
        child: _bookingController.arrBookingData.value.isBlank
            ? Center(
                child: Text(
                'nobookings'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: AppFont.bold,
                    color: Colors.black),
              ))
            : Obx(() {
                if (_bookingController.isHomeScreen.value == 'pending' &&
                    _bookingController.isLoader.isFalse &&
                    _bookingController.scrollFirstTime == false) {
                  _bookingController.scrollFirstTime = true;
                  _bookingController.onPendingScrollJump();
                }
                return SmartRefresher(
                  controller: _bookingController.refresh1Controller,
                  header: ClassicHeader(
                    completeText: 'refreshCompleted'.tr,
                    releaseText: 'releaseToRefresh'.tr,
                    idleText: 'pullDownRefresh'.tr,
                  ),
                  enablePullDown: true,
                  onRefresh: () {
                    _bookingController
                        .getBookingData(_bookingController.selectedStatus);
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    controller: _bookingController.pendingScroll,
                    itemCount: _bookingController.arrBookingData.length,
                    itemBuilder: (context, index) {
                      if (_bookingController.arrBookingData == null ||
                          _bookingController.arrBookingData.length == 0) {
                        return SizedBox();
                      }
                      var currentObj = _bookingController.arrBookingData[index];
                      return containerDetail(
                          Color(0xFF101928),
                          'cancel'.tr,
                          false,
                          false,
                          false,
                          currentObj,
                          index,
                          context,
                          'pending',
                          cancleButton: true);
                    },
                  ),
                );
              }));
  }

  Widget completed() {
    return Container(
      child: _bookingController.arrBookingData.isBlank
          ? Center(
              child: Text(
              'nobookings'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30, fontFamily: AppFont.bold, color: Colors.black),
            ))
          : Obx(() {
              if (_bookingController.isHomeScreen.value == 'completed' &&
                  _bookingController.scrollFirstTime == false) {
                _bookingController.scrollFirstTime = true;
                _bookingController.onCompleteScrollJump();
              }
              return SmartRefresher(
                controller: _bookingController.refresh3Controller,
                header: ClassicHeader(
                  completeText: 'refreshCompleted'.tr,
                  releaseText: 'releaseToRefresh'.tr,
                  idleText: 'pullDownRefresh'.tr,
                ),
                enablePullDown: true,
                onRefresh: () {
                  _bookingController
                      .getBookingData(_bookingController.selectedStatus);
                },
                child: Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    controller: _bookingController.completeScroll,
                    itemCount: _bookingController.arrBookingData.length,
                    itemBuilder: (context, index) {
                      // ignore: invalid_use_of_protected_member
                      if (_bookingController.arrBookingData == null ||
                          _bookingController.arrBookingData.length == 0) {
                        return SizedBox();
                      }
                      var currentObj = _bookingController.arrBookingData[index];
                      return containerDetail(
                          Color(0xFFdb8a8a),
                          'bookAgain'.tr,
                          false,
                          true,
                          false,
                          currentObj,
                          index,
                          context,
                          'completed');
                    },
                  ),
                ),
              );
            }),
    );
  }

  Widget cancled() {
    return Container(
      child: _bookingController.arrBookingData.isBlank
          ? Center(
              child: Text(
              'nobookings'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30, fontFamily: AppFont.bold, color: Colors.black),
            ))
          : Obx(() {
              if (_bookingController.isHomeScreen.value == 'cancelled' &&
                  _bookingController.isLoader.isFalse &&
                  _bookingController.scrollFirstTime == false) {
                _bookingController.scrollFirstTime = true;
                _bookingController.onCancelScrollJump();
              }
              return SmartRefresher(
                controller: _bookingController.refresh4Controller,
                header: ClassicHeader(
                  completeText: 'refreshCompleted'.tr,
                  releaseText: 'releaseToRefresh'.tr,
                  idleText: 'pullDownRefresh'.tr,
                ),
                enablePullDown: true,
                onRefresh: () {
                  _bookingController
                      .getBookingData(_bookingController.selectedStatus);
                },
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: _bookingController.cancelScroll,
                  itemCount: _bookingController.arrBookingData.length,
                  itemBuilder: (context, index) {
                    if (_bookingController.arrBookingData == null ||
                        _bookingController.arrBookingData.length == 0) {
                      return SizedBox();
                    }
                    var currentObj = _bookingController.arrBookingData[index];
                    return containerDetail(
                        Color(0xffdb8a8a),
                        'bookAgain'.tr,
                        false,
                        false,
                        true,
                        currentObj,
                        index,
                        context,
                        'cancelled');
                  },
                ),
              );
            }),
    );
  }

  Widget headerRow() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Row(children: [
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 17, 0),
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
            const Spacer(),
            const Text(
              'My Bookings',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const Spacer(),
            // SizedBox(width: 41),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                onTap: () {
                  // _bookingController.setIndex(1);
                  // Get.to(MyBooking());
                },
                child: Ink(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/images/Booking/calender.svg",
                      height: 20,
                      width: 20,
                      color: Color(0xff455A64),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                onTap: () {
                  // _bookingController.setIndex(0);
                },
                child: Ink(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      color: const Color(0xffE14942), shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/images/Booking/filter.svg",
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
          ]),
        ),
        Container(
          color: Color(AppColor.lightpink),
          height: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    AssestPath.favourite + "fav1.png",
                    width: 110,
                    height: 150,
                  )),
              Container(
                height: 100,
                width: 2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(AppColor.red).withOpacity(0.1),
                      Color(AppColor.red),
                      Color(AppColor.red).withOpacity(0.1)
                    ])),
              ),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  AssestPath.favourite + "fav2_bw.png",
                  width: 130,
                  height: 90,
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }

  Widget checkIndexRunning(context, PendingModel data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery Time',
                style: stylegrey,
              ),
              Text(
                data.deliveryEndTime == '0000-00-00 00:00:00'
                    ? "N/A"
                    : data.deliveryEndTime.toString(),
                style: heading,
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Column(
            children: [
              Text('Booked', style: stylegrey),
              Text('    ${data.deliveryCost} #',
                  style: heading.copyWith(color: Color(AppColor.red))),
            ],
          ),
          InkWell(
            onTap: () {
              _bottomSheetPopUp2(context, data);
            },
            child: Container(
              height: 35,
              width: 98,
              decoration: BoxDecoration(
                color: const Color(0xFFE14942),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                  child: Text(
                'Track',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget checkIndexPending(context, PendingModel data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery Time',
                style: stylegrey,
              ),
              Text(
                data.deliveryEndTime == '0000-00-00 00:00:00'
                    ? "N/A"
                    : DateFormat('yyyy-MM-dd – kk:mm')
                        .parse(data.deliveryEndTime)
                        .toString(),
                style: heading,
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Column(
            children: [
              Text('Cancel', style: stylegrey),
              Text('    ${data.deliveryCost} #',
                  style: heading.copyWith(color: Color(AppColor.red))),
            ],
          ),
          Container(
            height: 35,
            width: 98,
            decoration: BoxDecoration(
              color: const Color(0xFFE14942),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
                child: Text(
              'Book Again',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )),
          ),
        ],
      ),
    );
  }

  Widget checkIndexCompleted(context, PendingModel data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.check_circle_outline_outlined, color: Colors.green),
              Text(
                'Delivered',
                style: stylegrey,
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Column(
            children: [
              Text('Completed', style: stylegrey),
              Text('    ${data.deliveryCost} #',
                  style: heading.copyWith(color: Color(AppColor.red))),
            ],
          ),
          Container(
            height: 35,
            width: 98,
            decoration: BoxDecoration(
              color: const Color(0xFFE14942),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
                child: Text(
              'Book Again',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )),
          ),
        ],
      ),
    );
  }

  Widget checkIndex(context, PendingModel data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.cancel_outlined, color: Color(AppColor.red)),
            Text(
              'Cancelled',
              style: stylegrey,
            )
          ],
        ),
        SizedBox(
          height: 3,
        ),
        Column(
          children: [
            Text('Cancel', style: stylegrey),
            Text('    ${data.deliveryCost} #',
                style: heading.copyWith(color: Color(AppColor.red))),
          ],
        ),
        Container(
          height: 35,
          width: 98,
          decoration: BoxDecoration(
            color: const Color(0xFFE14942),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
              child: Text(
            'Book Again',
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          )),
        ),
      ],
    );
  }

  Future<dynamic> _bottomSheetPopUp2(context, PendingModel data) {
    return showModalBottomSheet<dynamic>(
        // clipBehavior: BorderRadius.only(topLeft: Radius(20),),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        builder: (BuildContext bc) {
          return SizedBox(
            height: data.orderData.length == 1 ? 570 : 670,
            width: double.maxFinite,
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 192,
                    width: double.maxFinite,
                    child: CachedNetworkImage(
                      imageUrl:
                          data.orderData[0].variantData.fullImagePath == null
                              ? data.orderData[0].variantData.menu.menuImagePath
                              : data.orderData[0].variantData.fullImagePath,
                      placeholder: (context, url) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/Booking/Rectangle22.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/Booking/Rectangle22.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 20,
                      top: 15,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xffC4C4C4),
                            ),
                            child: const Icon(
                              Icons.close,
                            )),
                      )),
                  Positioned(
                    bottom: 10,
                    right: 20,
                    left: 20,
                    child: Container(
                      height: 52,
                      width: 332,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDEDEA).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 8,
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Distance'),
                                  Text('3 km',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Color(0xffE14942),
                                      ))
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 45,
                              top: 5,
                            ),
                            child: Row(
                              children: const [
                                Text('Your Food is ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    )),
                                Text('18 min ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0xffE14942),
                                    )),
                                Text('away',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 12, right: 20, left: 20),
                          height: 64,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.orderData[0].menuName,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.0, bottom: 2.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Booking ID:',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey),
                                            ),
                                            SizedBox(width: 3),
                                            Text(
                                              '#' + data.orderId.toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                                Padding(
                                  padding: EdgeInsets.only(top: 3),
                                  child: Text(
                                    '${data.deliveryCost}€',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffE14942)),
                                  ),
                                )
                              ])),
                      data.orderData.length == 1
                          ? Container()
                          : Container(
                              height: 100,
                              child: Stack(children: [
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: data.orderData.length - 1,
                                    itemBuilder: (BuildContext context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 79,
                                                  width: 110,
                                                  child: CachedNetworkImage(
                                                    imageUrl: data
                                                                .orderData[
                                                                    index + 1]
                                                                .variantData
                                                                .fullImagePath ==
                                                            null
                                                        ? data
                                                            .orderData[
                                                                index + 1]
                                                            .variantData
                                                            .menu
                                                            .menuImagePath
                                                        : data
                                                            .orderData[
                                                                index + 1]
                                                            .variantData
                                                            .fullImagePath,
                                                    placeholder:
                                                        (context, url) =>
                                                            Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "assets/images/Booking/Rectangle22.png"),
                                                            fit: BoxFit.fill),
                                                      ),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "assets/images/Booking/Rectangle22.png"),
                                                            fit: BoxFit.fill),
                                                      ),
                                                    ),
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.fill,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  left: 0,
                                                  child: index == 2
                                                      ? data.orderData.length -
                                                                  1 >
                                                              3
                                                          ? Container(
                                                              height: 79,
                                                              width: 110,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.8),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                    data.orderData.length -
                                                                                1 >
                                                                            3
                                                                        ? '+${data.orderData.length - 4} items'
                                                                        : "0",
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          22,
                                                                      color: Colors
                                                                          .white,
                                                                    )),
                                                              ),
                                                            )
                                                          : Container()
                                                      : Container(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Text(index == 2 &&
                                                    data.orderData.length - 1 >
                                                        3
                                                ? ""
                                                : data.orderData[index + 1]
                                                    .menuName),
                                          ],
                                        ),
                                      );
                                    }),
                              ]),
                            ),
                      Container(
                          margin: const EdgeInsets.only(
                              top: 10, right: 20, left: 20),
                          height: 55,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Track Your Order',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 4, bottom: 4),
                                          child: Text(
                                            'Order Status',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff455A64)),
                                          ))
                                    ]),
                                Container(
                                  height: 35,
                                  width: 116,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE14942),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/images/Booking/Vector4.png'),
                                      const SizedBox(width: 5),
                                      const Text(
                                        'Live Tracking',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ])),
                      Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 27),
                                    Container(
                                      height: 16,
                                      width: 16,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffE14942),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Center(
                                          child: Icon(Icons.done,
                                              size: 7.0, color: Colors.white)),
                                    ),
                                    Container(
                                      height: 57,
                                      width: 1,
                                      color: const Color(0xffE14942),
                                    ),
                                    Container(
                                      height: 16,
                                      width: 16,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffE14942),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Center(
                                          child: Icon(Icons.done,
                                              size: 7.0, color: Colors.white)),
                                    ),
                                    Container(
                                      height: 57,
                                      width: 1,
                                      color: const Color(0xffE14942),
                                    ),
                                    Container(
                                      height: 16,
                                      width: 16,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffE14942),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Center(
                                          child: Icon(Icons.done,
                                              size: 7.0, color: Colors.white)),
                                    ),
                                    Container(
                                      height: 57,
                                      width: 1,
                                      color: const Color(0xff7B7E86),
                                    ),
                                    Container(
                                      height: 16,
                                      width: 16,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xff9E9E9E),
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      // margin: EdgeInsets.all(10),
                                      height: 62,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFDF5EF),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 5),
                                            height: 52,
                                            width: 53,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffE14942),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SvgPicture.asset(
                                                "assets/images/Booking/orderplaced.svg"),
                                          ),
                                          // SizedBox(width: 10),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15, bottom: 15, left: 25),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Order Placed',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(height: 2),
                                                Text(
                                                  data.createdTime,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff7B7E86)),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      // child:
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      // margin: EdgeInsets.all(10),
                                      height: 62,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFDF5EF),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 5),
                                            height: 52,
                                            width: 53,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffE14942),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SvgPicture.asset(
                                                "assets/images/Booking/orderconfirm.svg"),
                                          ),
                                          // SizedBox(width: 10),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15, bottom: 15, left: 25),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  'Order Confirmed',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(height: 2),
                                                Text(
                                                  'Your Order Has been Confirmed',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff7B7E86)),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      // child:
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      // margin: EdgeInsets.all(10),
                                      height: 62,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFDF5EF),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 5),
                                            height: 52,
                                            width: 53,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffE14942),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SvgPicture.asset(
                                                "assets/images/Booking/orderprocessd.svg"),
                                          ),
                                          // SizedBox(width: 10),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15, bottom: 15, left: 25),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  'Order Processed',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(height: 2),
                                                Text(
                                                  'We are Preparing Your Order',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff7B7E86)),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      // child:
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      // margin: EdgeInsets.all(10),
                                      height: 62,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 5),
                                            height: 52,
                                            width: 53,
                                            decoration: BoxDecoration(
                                              color: Color(0xffDADADA)
                                                  .withOpacity(1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SvgPicture.asset(
                                                "assets/images/Booking/scoter.svg"),
                                          ),
                                          // SizedBox(width: 10),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15, bottom: 15, left: 25),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  'Order Delivered',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(height: 2),
                                                Text(
                                                  'Your order will be delivered at 12:30 AM',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff7B7E86)),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      // child:
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                )),
              ],
            ),
          );
        });
  }

  Future<dynamic> _cancellationReason(context, PendingModel data) {
    return showModalBottomSheet<dynamic>(

        // clipBehavior: BorderRadius.only(topLeft: Radius(20),),

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return SizedBox(
            height: 500,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Reason For Cancellation",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: AppFont.bold,
                        fontSize: 20),
                  ),
                ),
                Container(
                  height: 150,
                  width: double.maxFinite,
                  child: CachedNetworkImage(
                    imageUrl:
                        data.orderData[0].variantData.fullImagePath == null
                            ? data.orderData[0].variantData.menu.menuImagePath
                            : data.orderData[0].variantData.fullImagePath,
                    placeholder: (context, url) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/Booking/Rectangle1.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/Booking/Rectangle1.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    Container(
                        margin:
                            const EdgeInsets.only(top: 16, right: 20, left: 20),
                        height: 64,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 3),
                                          Text(
                                            data.orderData[0].menuName,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: AppFont.semiBold,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Booking ID :',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          '#' + data.orderId.toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                              fontFamily: AppFont.regular),
                                        ),
                                      ],
                                    ),
                                  ]),
                              Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: Text(
                                  data.deliveryCost.toString() + "€",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: AppFont.bold,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffE14942)),
                                ),
                              )
                            ])),
                    const Divider(height: 4),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "I Cancelled the booking Because",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppFont.bold,
                            fontWeight: FontWeight.w600,
                            color: Color(AppColor.black)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        data.cancelReason == null ? "N/A" : data.cancelReason,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppFont.regular,
                            color: Color(AppColor.greytextColor)),
                      ),
                    )
                  ],
                )),
              ],
            ),
          );
        });
  }

  Widget containerDetail(Color btnClr, String text, bool yelloCon, bool blueCon,
      bool pinkCon, PendingModel data, index, context, value,
      {bool cancleButton = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 0, left: 0, top: 10),
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        width: 344,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: const Color(0xFFDADADA)),
        ),
        child: Column(
          children: [
            Container(
                color: const Color(0xFFF9F9FB),
                child: ListView.builder(
                    itemCount: data.orderData.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return Stack(
                        children: [
                          Column(
                            children: [
                              Row(children: [
                                Container(
                                  // padding: const EdgeInsets.all(5.0),
                                  height: 105,
                                  width: 130,
                                  child: CachedNetworkImage(
                                    imageUrl: data.orderData[i].variantData
                                                .fullImagePath ==
                                            null
                                        ? data.orderData[i].variantData.menu
                                            .menuImagePath
                                        : data.orderData[i].variantData
                                            .fullImagePath,
                                    placeholder: (context, url) => Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/Booking/Rectangle1.png"),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/Booking/Rectangle1.png"),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      i == 0
                                          ? Row(
                                              children: [
                                                Text(
                                                  'Booking ID: ',
                                                  style: stylegrey,
                                                ),
                                                Text(
                                                  "#" + data.orderId.toString(),
                                                  style: stylegrey.copyWith(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            )
                                          : Container(),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(data.orderData[i].menuName,
                                          style: heading),
                                      SizedBox(height: 3),
                                      Container(
                                        height: 15,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: data
                                              .orderData[i].orderExtras.length,
                                          itemBuilder: (context, indx) {
                                            return data.orderData[i].orderExtras
                                                            .length -
                                                        1 ==
                                                    indx
                                                ? Text(
                                                    data
                                                        .orderData[i]
                                                        .orderExtras[indx]
                                                        .title,
                                                    style: stylegrey)
                                                : Text(
                                                    data
                                                            .orderData[i]
                                                            .orderExtras[indx]
                                                            .title +
                                                        ", ",
                                                    style: stylegrey);
                                          },
                                        ),
                                      ),
                                    ])
                              ]),
                              Container(
                                height: 10,
                                color: Colors.white,
                              )
                            ],
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                                height: 19,
                                width: 32,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE14942),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(9.0),
                                      bottomLeft: Radius.circular(9.5)),
                                ),
                                child: Center(
                                  child: Text(
                                      data.orderData[i].quantity.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.white,
                                      )),
                                )),
                          ),
                        ],
                      );
                    })),
            Container(
              child: Column(
                children: [
                  value == 'pending'
                      ? checkIndexPending(context, data)
                      : Container(),
                  value == 'running'
                      ? checkIndexRunning(context, data)
                      : Container(),
                  value == 'completed'
                      ? checkIndexCompleted(context, data)
                      // ? checkIndexRunning(context, data)
                      : Container(),
                  value == 'cancelled'
                      ? checkIndex(context, data)
                      : Container(),
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 62,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F9FB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 62,
                          width: 62,
                          padding: const EdgeInsets.all(5.0),
                          child: CachedNetworkImage(
                            imageUrl: data.storeImage,
                            placeholder: (context, url) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/Booking/Rectangle13.png"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/Booking/Rectangle13.png"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Resturant Name",
                                style: stylegrey,
                              ),
                              SizedBox(height: 3),
                              Text(data.storeName,
                                  style: heading.copyWith(
                                      color: Color(AppColor.red),
                                      fontFamily: AppFont.semiBold))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 62,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDF5EF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 52,
                              width: 53,
                              decoration: BoxDecoration(
                                  color: Color(0xFFE14942),
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Booking/locationinfo.png'))),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dilvery Address",
                                  style: heading.copyWith(
                                      fontFamily: AppFont.regular),
                                ),
                                SizedBox(
                                  width: 220,
                                  child: Text(
                                    data.storeAddress,
                                    style: stylegrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: value == "completed" || value == "cancelled",
              child: GestureDetector(
                onTap: () {
                  if (value == "cancelled") {
                    _cancellationReason(context, data);
                  } else {
                    _bookingController.forReview.value = data;
                    Get.to(UserReview());
                  }
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 48,
                  // width: 314,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE14942),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                      child: value == "cancelled"
                          ? Text(
                              'See Cancellation Reason',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: AppFont.medium,
                                  fontWeight: FontWeight.w400),
                            )
                          : Text(
                              'Share Your Review',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: AppFont.medium,
                                  fontWeight: FontWeight.w400),
                            )),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  final TextStyle stylegrey = TextStyle(
    color: Color(
      AppColor.greytextColor,
    ),
    fontSize: 12,
  );
  final TextStyle heading = TextStyle(
      color: Color(
        AppColor.black,
      ),
      fontSize: 14,
      fontFamily: AppFont.medium);
}
