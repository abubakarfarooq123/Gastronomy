import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';
import 'package:reserved4u/Pages/DashBoard/checkout/widgets/address_input.dart';
import 'package:reserved4u/Pages/DashBoard/checkout/widgets/custom_button.dart';
import 'package:reserved4u/Pages/Profile/MyBooking/BookingController.dart';
import 'package:reserved4u/Reviews/GiveFeedBack/GiveFeedBackController.dart';

// ignore: must_be_immutable
class UserReview extends StatelessWidget {
  GiveFeedBackController _feedbackController =
      Get.put(GiveFeedBackController());
  BookingController _bookingController = Get.put(BookingController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Color(AppColor.bgColor),
        appBar: AppBar(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.white),
          backgroundColor: Color(AppColor.bgColor),
          elevation: 1,
          centerTitle: true,
          title: Image.asset(
            "assets/images/Login/Logo_Home.png",
            width: 100,
            height: 35,
          ),
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(12, 2, 0, 12),
            child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          offset: Offset(1, 1),
                          blurRadius: 7)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.back();
                    _feedbackController.selectedInd.value = 0;
                  },
                  iconSize: 20,
                )),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CircleAvatar(
                        child: CachedNetworkImage(
                          imageUrl:
                              _bookingController.forReview.value.storeImage,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/Booking/Rectangle13.png"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Share your experiences with other users",
                    style: TextStyle(fontFamily: AppFont.regular, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx((() => Text(
                        _bookingController.forReview.value.storeName,
                        style: TextStyle(
                            fontFamily: AppFont.bold,
                            fontSize: 18,
                            color: Color(AppColor.red)),
                      ))),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      dialouge(context);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AssestPath.favourite + 'for.svg',
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Choose Items")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text('Food'.tr,
                        style: TextStyle(
                            fontSize: 18, fontFamily: AppFont.semiBold)),
                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(AppColor.lightpink),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: RatingBar.builder(
                      initialRating: 0,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      glowColor: Colors.white,
                      itemSize: 40,
                      unratedColor: Color(0xFFdadbde),
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 30,
                          width: 45,
                          child: Image.asset(
                            AssestPath.homeView + "Star.png",
                            height: 18,
                            width: 18,
                          ),
                        );
                      },
                      onRatingUpdate: (value) {
                        value + 1;
                        _feedbackController.foodRating.value =
                            (value + 1).toString();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text('Delivery'.tr,
                        style: TextStyle(
                            fontSize: 18, fontFamily: AppFont.semiBold)),
                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(AppColor.lightpink),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: RatingBar.builder(
                      initialRating: 0,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      glowColor: Colors.white,
                      itemSize: 40,
                      unratedColor: Color(0xFFdadbde),
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 30,
                          width: 45,
                          child: Image.asset(
                            AssestPath.homeView + "Star.png",
                            height: 18,
                            width: 18,
                          ),
                        );
                      },
                      onRatingUpdate: (value) {
                        value + 1;
                        _feedbackController.dilveryRating.value =
                            (value + 1).toString();
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: AddressInput(
                        hintText: "Share Your Experience here ",
                        controller: _feedbackController.txtTypeYourExep,
                      )),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 300,
                    child: CustomButton(
                      title: "Send FeedBack",
                      onPressed: () {
                        _feedbackController.selectedStoreId.value =
                            _bookingController.forReview.value.storeId
                                .toString();
                        _feedbackController.selectedOrderId.value =
                            _bookingController.forReview.value.orderId
                                .toString();

                        _feedbackController.validateReview();
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
              Obx(() => CommanWidget(context: context).showlolder(
                  isshowDilog: _feedbackController.showLoader.value))
            ],
          ),
        ),
      ),
    );
  }

  Future<Widget> dialouge(context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // border: Border.all(color: Colors.grey, width: 1)),
                ),
                height: 410,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.2),

                        borderRadius: BorderRadius.circular(12),
                        // border: Border.all(color: Colors.grey, width: 1)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Items",
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: AppFont.semiBold,
                                fontSize: 16),
                          ),
                          InkWell(
                            onTap: () {
                              _feedbackController.searchController.clear();
                              _feedbackController.selectedInd.value = 0;
                              Get.back();
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.cancel,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          height: 40,
                          child: Material(
                            color: Colors.white,
                            elevation: 2,
                            borderRadius: BorderRadius.circular(12),
                            child: TextFormField(
                              controller: _feedbackController.searchController,
                              onFieldSubmitted: ((value) => _feedbackController
                                  .searchController.text = value),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  hintText: "Search Items",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 73,
                      child: Obx(() => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              _feedbackController.searchController.text == ""
                                  ? _bookingController
                                      .forReview.value.orderData.length
                                  : _bookingController
                                      .forReview.value.orderData
                                      .where((element) => element
                                          .menuName
                                          .toLowerCase()
                                          .contains(_feedbackController
                                              .searchController.text
                                              .toLowerCase()))
                                      .length,
                          itemBuilder: (context, i) {
                            return Container(
                                margin: EdgeInsets.only(left: 20),
                                child: select(i));
                          })),
                    ),
                    Obx(() => _bookingController
                                .forReview.value.orderData.length ==
                            0
                        ? Container()
                        : _bookingController
                                    .forReview
                                    .value
                                    .orderData[
                                        _feedbackController.selectedInd.value]
                                    .orderExtras
                                    .length ==
                                0
                            ? Container()
                            : Scrollbar(
                                interactive: true,
                                child: Obx(() => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.shade100,
                                    ),
                                    height: 100,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    width: double.infinity,
                                    child: ListView.builder(
                                        itemCount: _bookingController
                                            .forReview
                                            .value
                                            .orderData[_feedbackController
                                                .selectedInd.value]
                                            .orderExtras
                                            .length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, ind) {
                                          return Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 10),
                                              child: Text(
                                                _bookingController
                                                    .forReview
                                                    .value
                                                    .orderData[
                                                        _feedbackController
                                                            .selectedInd.value]
                                                    .orderExtras[ind]
                                                    .title,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: AppFont.medium),
                                              ));
                                        }))),
                              )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      height: 40,
                      child: CustomButton(
                          title: "further".tr,
                          onPressed: () {
                            _feedbackController.searchController.clear();
                            Get.back();
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        _feedbackController.searchController.clear();
                        _feedbackController.selectedInd.value = 0;
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "loschen".tr,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.red.withOpacity(0.7)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ));
        });
  }

  Widget select(index) {
    return Obx(() => InkWell(
          onTap: () {
            _feedbackController.selectedMenuId.value = _bookingController
                .forReview.value.orderData[index].menuId
                .toString();
            _feedbackController.selectedInd.value = index;
          },
          child: Column(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CircleAvatar(
                    child: CachedNetworkImage(
                      imageUrl: _feedbackController.searchController.text == ""
                          ? _bookingController.forReview.value.orderData[index]
                                      .variantData.fullImagePath ==
                                  null
                              ? _bookingController
                                  .forReview
                                  .value
                                  .orderData[index]
                                  .variantData
                                  .menu
                                  .menuImagePath
                              : _bookingController.forReview.value
                                  .orderData[index].variantData.fullImagePath
                          : _bookingController.forReview.value.orderData[_bookingController.forReview.value.orderData.indexWhere((element) => element.menuName.toLowerCase().contains(_feedbackController.searchController.text.toString()))].variantData.fullImagePath ==
                                  null
                              ? _bookingController
                                  .forReview
                                  .value
                                  .orderData[_bookingController.forReview.value.orderData
                                      .indexWhere((element) => element.menuName
                                          .toLowerCase()
                                          .contains(_feedbackController
                                              .searchController.text
                                              .toString()))]
                                  .variantData
                                  .menu
                                  .menuImagePath
                              : _bookingController
                                  .forReview
                                  .value
                                  .orderData[_bookingController.forReview.value.orderData
                                      .indexWhere((element) => element.menuName.toLowerCase().contains(_feedbackController.searchController.text.toString()))]
                                  .variantData
                                  .fullImagePath,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Obx(() => Text(
                    _feedbackController.searchController.text == ""
                        ? _bookingController
                            .forReview.value.orderData[index].menuName
                        : _bookingController
                            .forReview
                            .value
                            .orderData[_bookingController
                                .forReview.value.orderData
                                .indexWhere((element) => element.menuName
                                    .toLowerCase()
                                    .contains(_feedbackController
                                        .searchController.text
                                        .toString()))]
                            .menuName,
                    style: TextStyle(
                        fontFamily: AppFont.semiBold,
                        color: _feedbackController.selectedInd.value == index
                            ? Color(AppColor.red)
                            : Colors.black),
                  )),
            ],
          ),
        ));
  }
}
