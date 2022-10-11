import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/models/review_model.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/resturant_detail_controller.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:reserved4u/Pages/DashBoard/Resturant/widgets/Bewtungen_widgets/feedback.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/widgets/user_review.dart';
import 'package:reserved4u/Reviews/GiveFeedBack/SelectEmployee.dart';
import '../../../../../Helper/NotificatiokKeys.dart';

// ignore: must_be_immutable
class BewtungenWidgets extends StatefulWidget {
  @override
  _BewtungenWidgetsState createState() => _BewtungenWidgetsState();
}

class _BewtungenWidgetsState extends State<BewtungenWidgets> {
  ResturantController _detailController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff9f9fb),
      child: Column(
        children: [
          Obx(() {
            if (_detailController.reviews.value != null &&
                _detailController.reviews.value.totalAvgRating != null) {
              return Column(
                children: [
                  ratingCard(context),
                ],
              );
            } else {
              return SizedBox();
            }
          }),
        ],
      ),
    );
  }

  Container textRow({String rating = '', String text = ''}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(
            "$rating/5",
            style: TextStyle(
              color: Color(AppColor.red),
              fontSize: 16,
              fontFamily: "Campton",
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xffaeaaaa),
              fontSize: 16,
              fontFamily: "Campton",
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Card ratingCard(BuildContext context) {
    return Card(
      color: Color(0xffffffff),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 252,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 200,
                              width: double.infinity,
                              padding: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                  color: Color(0xfffaba5f),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Obx(
                                    () => Text(
                                      '${_detailController.reviews.value.allOverAvg}/5.0',
                                      style: const TextStyle(
                                          fontSize: 30,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RatingBar.builder(
                                        initialRating: double.parse(
                                            _detailController
                                                .reviews.value.allOverAvg),
                                        ignoreGestures: true,
                                        minRating: 0,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        glowColor: Colors.transparent,
                                        itemSize: 40,
                                        unratedColor: Color(0xFFdadbde),
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 0.0),
                                        itemBuilder: (context, index) {
                                          return Container(
                                            padding: EdgeInsets.all(5),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2),
                                            child: Image.asset(
                                              AssestPath.homeView + "Star.png",
                                              fit: BoxFit.cover,
                                              height: 35,
                                              width: 35,
                                              color: Colors.white,
                                            ),
                                          );
                                        },
                                        onRatingUpdate: null,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    '(${_detailController.reviews.value.totalFeedBack})' +
                                        'bewtungen'.tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                right: 0,
                                left: 0,
                                bottom: 0,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: (() => Get.to(FeedbackScreen())),
                                    child: Container(
                                      height: 52.13,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Text(
                                          'giveFeedBack'.tr,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      textRow(
                          rating:
                              '${_detailController.reviews.value.totalAvgRating[0].foodRate}',
                          text: 'Food'),
                      textRow(
                          rating:
                              '${_detailController.reviews.value.totalAvgRating[0].deliveryRate}',
                          text: 'Delivery'),
                    ],
                  ),
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              rowline(context),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: findContainer(),
              ),
              Obx(() {
                return _detailController.reviews.value.customerReview.length !=
                        0
                    ? ListView.builder(
                        itemCount: _detailController
                            .reviews.value.customerReview.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return reviewCard(
                              _detailController
                                  .reviews.value.customerReview[index],
                              index);
                        },
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

  Widget reviewCard(CustomerReview data, int ind) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
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
                    Container(
                        height: 45,
                        width: 45,
                        alignment: Alignment.topCenter,
                        child: CachedNetworkImage(
                          imageUrl: data.userImagePath,
                          placeholder: (context, url) => Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF101928),
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.white, width: 3),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/defaultuser.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF101928),
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.white, width: 3),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/defaultuser.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF101928),
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.white, width: 3),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )),
                    Wrap(
                      spacing: 10,
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
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
                                  data.totalAvgRating.toString(),
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
                  data.itemName == null ? "-" : data.itemName,
                  style: TextStyle(
                      color: Color(AppColor.maincategorySelectedTextColor),
                      fontSize: 12,
                      fontFamily: AppFont.medium),
                )),
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Text(
                    data.writeComment.toString(),
                    style: TextStyle(fontSize: 14, fontFamily: AppFont.medium),
                  )),
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
                  SizedBox(height: 10),
                  Container(
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                              child: reviewList(
                                  "Food", double.parse(data.foodRate))),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: reviewList(
                                  "Dilvery", double.parse(data.deliveryRate))),
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

  Container findContainer() {
    return Container(
        padding: EdgeInsets.only(top: 5, bottom: 8),
        height: 50,
        width: Get.width - 20,
        decoration: BoxDecoration(
            color: Color(0xfff9f9fb), borderRadius: BorderRadius.circular(15)),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          autocorrect: false,
          controller: _detailController.revierTextEditing,
          onChanged: (value) {
            if (value.length > 2) {
              _detailController.getResturantReviews(
                  id: _detailController.storeID.value, searchText: value);
            } else if (value.isEmpty) {
              _detailController.getResturantReviews(
                  id: _detailController.storeID.value, searchText: value);
            }
          },
          decoration: InputDecoration(
              icon: Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: Image.asset(
                  AssestPath.homeView + 'SearchWhite.png',
                  height: 20,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: InputBorder.none,
              labelText: 'findByEmployeeName'.tr,
              labelStyle: TextStyle(fontFamily: AppFont.light, fontSize: 17)),
        ));
  }

  Future showBottomSheetForSortingOptions(BuildContext context) {
    return Get.bottomSheet(
      BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2,
          sigmaY: 2,
        ),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Color(0xFFfef4ee),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: Text(
                    'sortBy'.tr,
                    style: TextStyle(
                        fontFamily: AppFont.semiBold,
                        fontSize: 20,
                        color: Color(0xFFde9292)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // commonText("newest".tr, "newest"),
              // commonText("bestRatings".tr, "best_rating"),
              // commonText("worstRating".tr, "worst_rating"),
            ],
          ),
        ),
      ),
    );
  }

  // commonText(String text, String paramText) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 20, top: 10),
  //     child: InkWell(
  //       onTap: () {
  //         _detailController.sortByReviewData(sorTing: paramText);
  //         _detailController.sortText.value = text;
  //       },
  //       child: Text(
  //         text,
  //         style: TextStyle(
  //             color: Colors.black, fontFamily: AppFont.semiBold, fontSize: 18),
  //       ),
  //     ),
  //   );
  // }

  Row rowline(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'customerReview'.tr,
          style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontFamily: AppFont.bold),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            Get.to(SelectEmployee());
          },
          child: CircleAvatar(
              radius: 15,
              backgroundColor: Color(AppColor.red),
              child: Image.asset(
                AssestPath.homeView + 'Group.png',
                height: 15,
                width: 15,
              )),
        ),
        SizedBox(
          width: 10,
        ),
        // sort(context),
      ],
    );
  }

  // Container sort(BuildContext context) {
  //   return Container(
  //       padding: EdgeInsets.all(5),
  //       height: 30,
  //       width: 90,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.all(
  //             Radius.circular(8.0) //                 <--- border radius here
  //             ),
  //         border: Border.all(
  //           width: 1.5,
  //           color: Color(0xFFe2e3e6),
  //         ),
  //       ),
  //       child: InkWell(
  //         onTap: () {
  //           return showBottomSheetForSortingOptions(context);
  //         },
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             Obx(
  //               () => SizedBox(
  //                 width: 56,
  //                 child: SingleChildScrollView(
  //                   scrollDirection: Axis.horizontal,
  //                   child: Text(
  //                     _detailController.sortText.value,
  //                     style:
  //                         TextStyle(fontFamily: AppFont.semiBold, fontSize: 13),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Image.asset(
  //               AssestPath.homeView + "Sort.png",
  //               height: 10,
  //             )
  //           ],
  //         ),
  //       ));
  // }

  Container ratingAndServices({String rating, String serviceName}) {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 0, 0, 10),
      child: Row(
        children: [
          Text(
            "$rating",
            style: TextStyle(
                color: Color(0xFFe29e9e), fontFamily: AppFont.regular),
          ),
          SizedBox(width: 20),
          Text(
            "${toBeginningOfSentenceCase(serviceName)}",
            style: TextStyle(
                color: Color(0xFF959396), fontFamily: AppFont.regular),
          ),
        ],
      ),
    );
  }

  RatingBar buildRatingBar(color, ind) {
    return RatingBar.builder(
      initialRating: double.parse(ind),
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      glowColor: Colors.white,
      ignoreGestures: true,
      itemSize: 40,
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
            color: Colors.white,
          ),
        );
      },
      onRatingUpdate: (value) {},
    );
  }

  Widget noProfilePicNames(String username) {
    List<String> strList = username.split(' ');
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Color(0xFFFABA5F), width: 0.3),
            color: Colors.white),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Align(
            alignment: Alignment.center,
            child: username != null
                ? Text(
                    username == ' ' || username == ' '
                        ? "-"
                        : username.contains(" ")
                            ? username
                                    .split(" ")
                                    .first
                                    .toString()[0]
                                    .toUpperCase() +
                                username
                                    .split(" ")
                                    .last
                                    .toString()[0]
                                    .toUpperCase()
                            : username[0].toString().toUpperCase() +
                                username[1].toString().toUpperCase(),
                    style: TextStyle(
                        color: Color(0xFFFABA5F),
                        fontFamily: AppFont.medium,
                        fontSize: 15),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    "",
                    style: TextStyle(
                        color: Color(0xFFFABA5F),
                        fontFamily: AppFont.medium,
                        fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
          ),
        ),
      ),
    );
  }

  Widget reviewList(String text, double ratingValue) {
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
              initialRating: ratingValue,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              glowColor: Colors.white,
              ignoreGestures: true,
              itemSize: 15,
              unratedColor: Color(0xFFdadbde),
              itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
              itemBuilder: (context, index) {
                return Container(
                  height: 20,
                  width: 20,
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
