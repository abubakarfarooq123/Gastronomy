import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/commanFuncation.dart';
import 'package:reserved4u/Pages/Profile/MyBooking/BookingSummaryModel.dart';

import 'BookingController.dart';

// ignore: must_be_immutable
class CalenderAppointmentDetail extends StatelessWidget {
  BookingController _bookingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarHeader(),
      body: SafeArea(
        child: Column(
          children: [
            topView(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _bookingController
                          .bookingSummaryObj.bookingData.length,
                      itemBuilder: (context, ind) {
                        var obj = _bookingController
                            .bookingSummaryObj.bookingData[ind];
                        return categories(context, obj);
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column categories(BuildContext context, BookingData currentObj) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          height: 50,
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
                height: 40,
                width: 40,
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
                style: TextStyle(fontFamily: AppFont.bold, fontSize: 15),
              ),
              Spacer(),
              Obx(
                () => dropDownButton(currentObj),
              ),
            ],
          ),
        ),
        Obx(
          () {
            List<String> nameList = currentObj.empname.split(' ');
            String name = '';
            if (nameList.length == 2) {
              name = nameList.first[0].toUpperCase() +
                  nameList.last[0].toUpperCase();
            } else {
              name = nameList.first[0].toUpperCase() +
                  nameList.first[1].toUpperCase();
            }
            return Visibility(
              visible: currentObj.isOpenDetails.value,
              child: Container(
                height: 60,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFe8e8ec)),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      height: 45,
                      width: 45,
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
                              errorWidget: (context, url, error) => Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: Center(
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.yellow,
                                    ),
                                  ),
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
                          currentObj.empname,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: AppFont.semiBold),
                        ),
                        Text(
                          currentObj.appodate,
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
            );
          },
        ),
        Obx(
          () => Visibility(
            visible: currentObj.isOpenDetails.value,
            child: Container(
                child: Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: currentObj.servicecategory.length,
                    itemBuilder: (context, ind) {
                      var serviceObj = currentObj.servicecategory[ind];
                      return categoriesItem(context, serviceObj);
                    }),
              ),
            )),
          ),
        ),
      ],
    );
  }

  Container categoriesItem(
      BuildContext context, ServicecategoryInBooking serviceObj) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 350,
            child: Text(
              serviceObj.serviceName,
              style: TextStyle(fontSize: 16, fontFamily: AppFont.bold),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 2,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: serviceObj.serviceVariant.length,
                itemBuilder: (context, ind) {
                  var vObj = serviceObj.serviceVariant[ind];
                  return categoriesvariant(context, vObj);
                }),
          ),
        ],
      ),
    );
  }

// Categories Variant
  Widget categoriesvariant(BuildContext context, ServiceVariantInBooking vObj) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width * 0.65,
                  child: Text(
                    vObj.description != null ? vObj.description : "-",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: AppFont.regular,
                        color: Color(0xFF575e67),
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

  Container dropDownButton(BookingData currentObj) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
      height: 30,
      width: 30,
      child: FloatingActionButton(
          child: currentObj.isOpenDetails.value == false
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
            currentObj.isOpenDetails.value = !currentObj.isOpenDetails.value;
          }),
    );
  }

  Widget topView() {
    var obj = _bookingController.bookingSummaryObj.paymentInfo;
    var image = _bookingController.bookingSummaryObj.bookingData.first
        .servicecategory.first.serviceImagePath;

    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
          child: Container(
            padding: EdgeInsets.all(15),
            //height: 100,
            decoration: BoxDecoration(
                // color: Colors.amber,
                color: Color(0xfff9f9fb),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: CachedNetworkImage(
                    imageUrl: image,
                    placeholder: (context, url) => Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF101928),
                        borderRadius: BorderRadius.circular(60),
                        //  border: Border.all(color: Colors.white, width: 2),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/store_default.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF101928),
                        borderRadius: BorderRadius.circular(60),
                        //  border: Border.all(color: Colors.white, width: 2),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/store_default.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF101928),
                        borderRadius: BorderRadius.circular(60),
                        // border: Border.all(color: Colors.white, width: 2),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'vanueName'.tr,
                      style: TextStyle(
                        fontFamily: AppFont.regular,
                        color: Color(0xFF868a92),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      obj.storename,
                      style: TextStyle(
                        fontFamily: AppFont.bold,
                        color: Colors.black,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Container(
            padding: EdgeInsets.all(10),
            width: Get.width,
            decoration: BoxDecoration(
                color: Color(AppColor.reviewContainer),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(23)),
                    child: Container(
                        margin: EdgeInsets.all(8),
                        child: Image.asset(
                          AssestPath.favourite + "pin.png",
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: Get.height * 0.30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed("/storeDetailsView",
                                arguments: obj.storeId.toString());
                          },
                          child: Text(
                            obj.storename,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15, fontFamily: AppFont.bold),
                          ),
                        ),
                        Text(
                          obj.storeaddress,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  AppBar appBarHeader() {
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
      centerTitle: true,
      title: Text(
        'details'.tr,
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontFamily: AppFont.medium),
      ),
    );
  }
}
