import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/commanFuncation.dart';
import 'package:reserved4u/Pages/BookingSummary/BookingSummaryController.dart';
import 'package:reserved4u/Pages/BookingSummary/BookingSummaryModel.dart';

// ignore: must_be_immutable
class BookingSummery extends StatelessWidget {
  BookingSummaryController bookingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: paymentSummery(context),
    );
  }

  Widget paymentSummery(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'paymentSummery'.tr,
        style: TextStyle(
            fontFamily: AppFont.bold,
            fontSize: 20,
            color: Color(AppColor.textFieldtextColor)),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: bookingController.bookingSummaryObj.bookingData.length,
            itemBuilder: (context, ind) {
              var currentObj =
                  bookingController.bookingSummaryObj.bookingData[ind];
              return categories(currentObj, context);
            }),
      ),
    ]);
  }

  Column categories(BookingData currentObj, BuildContext context) {
    List<String> nameList = currentObj.empname.split(' ');
    String name = '';
    if (nameList.length == 2) {
      name = nameList.first[0].toUpperCase() + nameList.last[0].toUpperCase();
    } else {
      name = nameList.first[0].toUpperCase() + nameList.first[1].toUpperCase();
    }
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
              height: 60,
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFe8e8ec)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    padding: EdgeInsets.all(10),
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFFe3a9a9),
                    ),
                    child: SvgPicture.network(
                      currentObj.categoryImagePath,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    currentObj.name,
                    style: TextStyle(fontFamily: AppFont.bold, fontSize: 18),
                  ),
                  Spacer(),
                  dropDownButton(bookingController),
                ],
              ),
            ),
            Obx(
              () => Visibility(
                visible: bookingController.servcesIcon.value,
                child: Container(
                    child: Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 70, 0, 20),
                    child: Column(
                      children: [
                        Container(
                          // padding: EdgeInsets.all(15),
                          height: 70,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFe8e8ec)),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                height: 50,
                                width: 50,
                                child: currentObj.empimage ==
                                            'https://www.reserved4you.de/storage/app/public/default/default-user.png' ||
                                        currentObj.empimage == null ||
                                        currentObj.empimage == ''
                                    ? Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Text(
                                            name,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFdb8a8a),
                                            ),
                                          ),
                                        ),
                                      )
                                    : CachedNetworkImage(
                                  imageUrl: currentObj.empimage,
                                  placeholder: (context, url) => Image.asset(
                                      "assets/images/store_default.png"),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Color(AppColor.scaffoldbgcolor),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/defaultuser.png")),
                                    ),
                                  ),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Color(AppColor.scaffoldbgcolor),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentObj.empname == null
                                        ? 'anyPerson'.tr
                                        : currentObj.empname,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: AppFont.semiBold),
                                  ),
                                  Text(
                                    currentObj.appodate +
                                        " " +
                                        currentObj.apptime,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: AppFont.semiBold),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: currentObj.servicecategory.length,
                            itemBuilder: (context, ind) {
                              var obj = currentObj.servicecategory[ind];
                              return categoriesItem(obj, context);
                            }),
                      ],
                    ),
                  ),
                )),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String getDateInGerman(String data){
    /*List<String> _weekList = [
      'sun'.tr,
      'mon'.tr,
      'tues'.tr,
      'wed'.tr,
      'thurs'.tr,
      'fri'.tr,
      'sat'.tr,
      'sun'.tr,
    ];*/

    String day = data.split(',').first.split(' ').last;
    String month = data.split(" ").first;
    String year = data.split(',').last.split(" ").first;
    String weekDay = data.split("(").last.split(")").first;

    return day + ', ' + month + ' ' + year + ' (' + weekDay + ')';

  }

// Categories Items
  Container categoriesItem(ServicecategoryInBooking obj, BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            // width: 350,
            child: Text(
              obj.serviceName,
              style: TextStyle(fontSize: 16, fontFamily: AppFont.bold),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 2,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: obj.serviceVariant.length,
                itemBuilder: (context, ind) {
                  return categoriesvariant(obj.serviceVariant[ind], context);
                }),
          ),
        ],
      ),
    );
  }

// Categories Variant
  Widget categoriesvariant(ServiceVariantInBooking vObj, BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width * 0.5,
                  child: Text(
                    vObj.description == null ? "-" : vObj.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: AppFont.bold,
                        color: Colors.grey[400],
                        fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  CommonVariables(context: context)
                      .durationToString(int.parse(vObj.durationOfService)),
                  style: TextStyle(
                      fontFamily: AppFont.regular,
                      color: Colors.grey[400],
                      fontSize: 12),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Spacer(),
            Text(
              vObj.finalPrice + appStaticPriceSymbol,
              style: TextStyle(fontSize: 15, fontFamily: AppFont.bold),
            ),
          ],
        ),
        Divider()
      ],
    );
  }

//DropDown Button
  Container dropDownButton(BookingSummaryController bookingController) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
      height: 30,
      width: 30,
      child: Obx(
        () => FloatingActionButton(
            child: bookingController.servcesIcon.value == false
                ? Icon(
                    Icons.keyboard_arrow_down,
                    size: 25,
                    color: Colors.grey[400],
                  )
                : Icon(
                    Icons.keyboard_arrow_up,
                    size: 25,
                    color: Colors.grey[400],
                  ),
            backgroundColor: Color(AppColor.scaffoldbgcolor),
            elevation: 0,
            onPressed: () {
              bookingController.servcesIcon.value =
                  !bookingController.servcesIcon.value;
            }),
      ),
    );
  }
}
