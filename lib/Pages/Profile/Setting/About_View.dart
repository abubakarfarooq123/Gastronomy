import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';
import 'SettingController.dart';

// ignore: must_be_immutable
class AboutView extends StatelessWidget {
  SettingController _settingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      child: Scaffold(
        appBar: aboutHeader(),
        body: SafeArea(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Column(
                children: [
                  aboutMiddle(),
                  SizedBox(height: 30),
                  aboutBottom(),
                ],
              ),
              Obx(() => CommanWidget(context: context).showlolder(
                  isshowDilog: _settingController.showLoader.value)),
            ],
          ),
        )),
      ),
    );
  }

  AppBar aboutHeader() {
    return AppBar(
      backgroundColor: Color(AppColor.bgColor),
      elevation: 1,
      title: Text(
        'aboutus'.tr,
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

  Widget aboutMiddle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'letus'.tr,
            style: TextStyle(fontSize: 25, fontFamily: AppFont.bold),
          ),
          Image.asset(
            AssestPath.profile + "Logo_Home.png",
            height: 32,
          ),
          SizedBox(height: 25),
          Text(
            /*"TYPE, KIND, SORT, NATURE, DESCRIPTION, CHARACTER mean a number of individuals thought "
                "of as a group because of a common quality or qualities. TYPE may suggest strong and "
                "clearly marked similarity throughout the items included so that each is typical of the group.",*/
            'infoText'.tr,
            style: TextStyle(
                fontSize: 13, fontFamily: AppFont.medium, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget aboutBottom() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          color: Color(AppColor.maincategorySelectedColor)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'anyquery'.tr,
              style: TextStyle(fontSize: 20, fontFamily: AppFont.medium),
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Color(0xFFf9f9fb),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: _settingController.name,
                  style: TextStyle(
                      color: Colors.black, fontFamily: AppFont.regular),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none,
                      labelText: 'fullname'.tr,
                      labelStyle: TextStyle(
                          color: Colors.black38, fontFamily: AppFont.regular)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 60,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Color(0xFFf9f9fb),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: _settingController.email,
                  style: TextStyle(
                      color: Colors.black, fontFamily: AppFont.regular),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none,
                      labelText: 'youremail'.tr,
                      labelStyle: TextStyle(
                          color: Colors.black38, fontFamily: AppFont.regular)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 150,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Color(0xFFf9f9fb),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: _settingController.message,
                  style: TextStyle(
                      color: Colors.black, fontFamily: AppFont.regular),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none,
                      labelText: 'yourmsg'.tr,
                      labelStyle: TextStyle(
                          color: Colors.black38, fontFamily: AppFont.regular)),
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                _settingController.checkValidationForAboutUs();
              },
              child: Container(
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(AppColor.maincategorySelectedTextColor)),
                child: Center(
                    child: Text(
                  'sendmsg'.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppFont.medium,
                      fontSize: 17),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
