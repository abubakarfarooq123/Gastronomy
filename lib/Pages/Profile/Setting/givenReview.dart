import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/models/review_model.dart';
import 'package:reserved4u/Pages/Profile/Setting/SettingController.dart';

// ignore: must_be_immutable
class Givenreview extends StatelessWidget {
  SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Scaffold(
        appBar: givenReviewHeader(),
        body: SafeArea(
          child: Column(
            children: [
              Obx(() {
                return settingController.arrgetUserReviews.length != 0
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: settingController.arrgetUserReviews.length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return reviewCard(
                                settingController.arrgetUserReviews[index],
                                index);
                          },
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(top: 30),
                        alignment: Alignment.center,
                        child: Text(
                          'noDataFound'.tr,
                          style: TextStyle(
                              fontFamily: AppFont.semiBold, fontSize: 20),
                        ),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }

  AppBar givenReviewHeader() {
    return AppBar(
      backgroundColor: Color(AppColor.bgColor),
      elevation: 1,
      title: Text(
        'givenReview'.tr,
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontFamily: AppFont.medium),
      ),
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(12, 2, 0, 12),
        child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(boxShadow: [
              const BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  offset: Offset(1, 1),
                  blurRadius: 7)
            ], color: Colors.white, borderRadius: BorderRadius.circular(100)),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
              iconSize: 20,
            )),
      ),
    );
  }

  Widget reviewCard(CustomerReview data, int ind) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
      child: Container(
        // height: 500,
        width: Get.width,
        decoration: BoxDecoration(
            color: Color(AppColor.bgColor),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      spacing: 10,
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        // data.userImagePath == null
                        //     ? noProfilePicNames(data.userImagePath)
                        //     : CachedNetworkImage(
                        //         imageUrl: data.userImagePath,
                        //         placeholder: (context, url) => Container(
                        //           decoration: BoxDecoration(
                        //             color: Color(0xFF101928),
                        //             borderRadius: BorderRadius.circular(25),
                        //             border: Border.all(
                        //                 color: Colors.white, width: 2),
                        //             image: DecorationImage(
                        //               image: AssetImage(
                        //                 "assets/images/defaultuser.png",
                        //               ),
                        //               fit: BoxFit.cover,
                        //             ),
                        //           ),
                        //         ),
                        //         errorWidget: (context, url, error) => Container(
                        //           height: 50,
                        //           width: 50,
                        //           decoration: BoxDecoration(
                        //             color: Color(0xFF101928),
                        //             borderRadius: BorderRadius.circular(25),
                        //             border: Border.all(
                        //                 color: Colors.white, width: 2),
                        //             image: DecorationImage(
                        //               image: AssetImage(
                        //                 "assets/images/defaultuser.png",
                        //               ),
                        //               fit: BoxFit.cover,
                        //             ),
                        //           ),
                        //         ),
                        //         imageBuilder: (context, imageProvider) =>
                        //             Container(
                        //           height: 50,
                        //           width: 50,
                        //           decoration: BoxDecoration(
                        //             color: Colors.black,
                        //             borderRadius: BorderRadius.circular(25),
                        //             image: DecorationImage(
                        //               image: imageProvider,
                        //               fit: BoxFit.cover,
                        //             ),
                        //           ),
                        //         ),
                        //       ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data.userName == null ? " - " : data.userName,
                              style: TextStyle(
                                  fontSize: 17, fontFamily: AppFont.medium),
                            ),
                            Text(
                              data.empName == null
                                  ? 'serviceBy'.tr + 'anyPerson'.tr
                                  : 'serviceBy'.tr + data.empName,
                              style: TextStyle(
                                  fontSize: 10, fontFamily: AppFont.regular),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      /*direction: Axis.vertical,
                      spacing: 5,*/
                      children: [
                        Container(
                          height: 28,
                          width: 53,
                          decoration: BoxDecoration(
                              color: Color(AppColor.starContainer),
                              borderRadius: BorderRadius.circular(8)),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 2,
                                left: 2,
                                child: Container(
                                  height: 24,
                                  width: 22,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Color(AppColor.starContainer),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(27, 7, 0, 0),
                                child: Text(
                                  data.totalAvgRating,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(AppColor.logoBgColor),
                                      fontFamily: AppFont.medium),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          data.dayAgo.toString(),
                          style: TextStyle(
                              fontSize: 11, fontFamily: AppFont.regular),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 40,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Color(AppColor.maincategorySelectedColor),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  data.itemName == "" ? "-" : data.itemName,
                  style: TextStyle(
                      color: Color(AppColor.maincategorySelectedTextColor),
                      fontSize: 12,
                      fontFamily: AppFont.medium),
                )),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.only(left: 15, top: 10),
                height: 70,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Color(AppColor.reviewContainer),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed("/restaurantDetails",
                                arguments: data.storeId.toString());
                          },
                          child: Text(
                            data.storeName,
                            style: TextStyle(
                                fontSize: 15, fontFamily: AppFont.bold),
                          ),
                        ),
                        SizedBox(height: 3),
                        SizedBox(
                          width: 200,
                          child: Text(
                            data.storeAddress,
                            // overflow: TextOverflow.fade,
                            maxLines: 2,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      // height: 40,
                      child: Text(
                    data.writeComment,
                    style: TextStyle(fontSize: 14, fontFamily: AppFont.medium),
                  )),
                  // Visibility(
                  //   visible: true,
                  //   child: Container(
                  //     padding: EdgeInsets.only(top: 15),
                  //     child: InkWell(
                  //       onTap: () {
                  //         // settingController
                  //         //         .arrgetUserReviews[ind].isOpenReplay.value =
                  //         //     !settingController
                  //         //         .arrgetUserReviews[ind].isOpenReplay.value;
                  //       },
                  //       child: Row(
                  //         children: [
                  //           Text(
                  //             'venueReplay'.tr,
                  //             style: TextStyle(
                  //                 fontSize: 12,
                  //                 fontFamily: AppFont.regular,
                  //                 color: Colors.grey),
                  //           ),
                  //           Icon(
                  //               // data.isOpenReplay.value
                  //               //     ? Icons.keyboard_arrow_down
                  //               //     :
                  //               Icons.keyboard_arrow_up,
                  //               color: Colors.grey,
                  //               size: 18)
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 5),
                  Visibility(
                    visible: true,
                    child: Text(
                      data.storeReply ?? " ",
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: AppFont.regular,
                          color: Colors.black),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     // settingController
                  //     //     // ignore: invalid_use_of_protected_member
                  //     //     .arrgetUserReviews
                  //     //     // ignore: invalid_use_of_protected_member
                  //     //     .value[ind]
                  //     //     .isOpen
                  //     //     .value = !settingController
                  //     //     // ignore: invalid_use_of_protected_member
                  //     //     .arrgetUserReviews
                  //     //     // ignore: invalid_use_of_protected_member
                  //     //     .value[ind]
                  //     //     .isOpen
                  //     //     .value;
                  //   },
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         'showFullRatings'.tr,
                  //         style: TextStyle(
                  //             fontSize: 12,
                  //             fontFamily: AppFont.regular,
                  //             color: Color(
                  //                 AppColor.maincategorySelectedTextColor)),
                  //       ),
                  //       Icon(
                  //           // data.isOpen.value
                  //           //     ? Icons.keyboard_arrow_down
                  //           //     :
                  //           Icons.keyboard_arrow_up,
                  //           color:
                  //               Color(AppColor.maincategorySelectedTextColor),
                  //           size: 20)
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  Container(
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(child: reviewList("Food", data.foodRate)),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: reviewList("Dilvery", data.deliveryRate)),
                        ],
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget noProfilePicNames(String username) {
    // String name = username.contains(" ")
    //     ? username.split(" ").first.toString()[0].toUpperCase() +
    //         username.split(" ").last[0].toUpperCase()
    //     : username[0].toUpperCase() + username[1].toUpperCase();
    // print(name);
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 50,
      padding: EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white, width: 3),
          color: Colors.black),
      child: Text(
        username,
        style: TextStyle(
            color: Color(0xFFFABA5F), fontFamily: AppFont.medium, fontSize: 13),
        textAlign: TextAlign.center,
      ),
    );
  }

  //========== List View ==========

  Widget reviewList(String text, String ratingValue) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(AppColor.reviewContainer)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
        child: Column(
          children: [
            RatingBar.builder(
              initialRating: double.parse(ratingValue),
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              glowColor: Colors.white,
              itemSize: 20,
              unratedColor: Color(0xFFdadbde),
              itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
              itemBuilder: (context, index) {
                return Container(
                  height: 45,
                  width: 45,
                  child: Image.asset(
                    AssestPath.homeView + "Star.png",
                    height: 18,
                    width: 18,
                  ),
                );
              },
              onRatingUpdate: (value) {},
            ),
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(fontSize: 10, fontFamily: AppFont.medium),
            )
          ],
        ),
      ),
    );
  }
}
