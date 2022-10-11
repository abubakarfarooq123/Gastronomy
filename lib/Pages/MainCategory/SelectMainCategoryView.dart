import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/preferences.dart';
import 'package:vibration/vibration.dart';

class SelectMainCategoryView extends StatefulWidget {
  @override
  State<SelectMainCategoryView> createState() => _SelectMainCategoryViewState();
}

class _SelectMainCategoryViewState extends State<SelectMainCategoryView> {
  bool isselected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor:isselected? Color(AppColor.red):Color(AppColor.greytextColor),
      //   onPressed: () {
      //
      //
      //     if(isselected) Get.toNamed('/bottomNavBar');
      //
      //   },
      //   child: Icon(
      //     Icons.navigate_next,
      //     size: 35,
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(
          child: Column(children: [
            header(context),
            Expanded(
              child: listView(),
            )
          ]),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            AssestPath.login + "Logo_Home.png",
            height: 20,
            width: 90,
          ),
          SizedBox(height: 15),
          Text(
            'titleOfSelectMainCategory'.tr,
            style: TextStyle(
              fontSize: 20,
              fontFamily: AppFont.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget listView() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  Vibration.vibrate(duration: 100);
                  if (isselected) Get.toNamed('/bottomNavBar');
                  // isselected = true;
                });
              },
              child: Container(
                child: leftSideImageContainer(
                  imgurl: AssestPath.onBoarding + "gastronomy.png",
                  text: 'selectedCategory1'.tr,
                  textColor: isselected
                      ? Color(AppColor.red)
                      : Color(AppColor.greytextColor),
                  // bgColor: Color(AppColor.maincategorySelectedColor),
                  borderColor: isselected
                      ? Color(AppColor.red)
                      : Color(AppColor.greytextColor),
                  blur: isselected,
                ),
              ),
            ),
            Container(
              child: rightSideImageContainer(
                imgurl: AssestPath.category + "13.png",
                text: 'commingSoon!!'.tr,
              ),
            ),
            Container(
              child: rightSideImageContainer(
                imgurl: AssestPath.category + "11.png",
                text: 'commingSoon!!'.tr,
              ),
            ),
            Container(
              child: rightSideImageContainer(
                imgurl: AssestPath.category + "12.png",
                text: 'commingSoon!!'.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rightSideImageContainer({String imgurl, String text}) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Container(
            height: Get.height * 0.17,
            // width: Get.width - 40,
            decoration: BoxDecoration(
              color: Color(AppColor.maincategoryDisableColor),
              borderRadius: BorderRadius.all(Radius.circular(
                      25.0) //                 <--- border radius here
                  ),
              border: Border.all(
                width: 1.5,
                color: Color(AppColor.maincategoryDisableBorderColor),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 100,

                  //color: Colors.white,
                  child: ClipRRect(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                      child: Image.asset(
                        imgurl,
                        fit: BoxFit.fill,
                        // height: 140,
                        //width: 100,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: AppFont.bold,
                    fontSize: 22,
                    color: Color(AppColor.maincategoryDisableTextColor),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ),
        // Positioned(
        //   bottom: 1,
        //   left: Get.width / 2.1,
        //   right: Get.width / 2.1,
        //   child: Align(
        //       alignment: Alignment.bottomCenter,
        //       child: Image.asset(AssestPath.category + "ellipse.png")),
        // ),
      ],
    );
  }

  Widget leftSideImageContainer({
    String imgurl,
    String text,
    Color textColor,
    Color bgColor,
    Color borderColor,
    bool blur,
  }) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              height: Get.height * 0.18,
              // width: Get.width - 40,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.all(Radius.circular(
                        10.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  width: 1.5,
                  color: borderColor,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    // width: 100,
                    width: 150,
                    child: ClipRRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                        child: Image.asset(
                          imgurl,
                          width: 155,
                          height: 106,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.05,
                  ),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                          fontFamily: AppFont.bold,
                          color: textColor,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 200,
            color: Colors.grey,
          ),
          Positioned(
            left: Get.width * 0.48,
            bottom: 0,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      spreadRadius: 50,
                      offset: Offset(0.9, 0.5),
                      blurRadius: 40)
                ],
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                    color: blur == false
                        ? Color(AppColor.greytextColor)
                        : Colors.transparent,
                    width: 6),
                // color: Color(AppColor.red)
              ),
            ),
          ),
          // Positioned(
          //     bottom: 1,
          //     left: Get.width / 2.1,
          //     right: Get.width / 2.1,
          //     child: Align(
          //         alignment: Alignment.bottomCenter,
          //         child: Image.asset(AssestPath.category + "ellipseRed.png"))),
        ],
      ),
    );
  }
}
