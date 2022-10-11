import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';
import 'package:reserved4u/Pages/Profile/Setting/SettingController.dart';

// ignore: must_be_immutable
class SettingView extends StatelessWidget {
  SettingController _settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Color(0xffffffff),

            // Status bar brightness (optional)
          ),
          toolbarHeight: 0,
          elevation: 0,
        ),
        backgroundColor: Color(AppColor.bgColor),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(
              children: [
                Column(
                  children: [
                    settingHeader(),
                    SizedBox(height: 20),
                    settingContainer(
                        "My Booking.png", 'changedPw'.tr, "/changePassword"),
                    settingContainer(
                        "Given Reviews.png", 'givenReview'.tr, "/givenreview"),
                    settingContainer(
                        "About Us.png", 'aboutus'.tr, "/aboutView"),
                    settingContainer(
                        "Terms & Conditions.png", 'trems'.tr, "/termConditon"),
                    settingContainer(
                        "Cancelation Policy.png", 'Policy'.tr, "/cancelPolicy"),
                    settingContainer("Privacy Policy.png", 'privacyPolicy'.tr,
                        "/privatePolicyView"),
                    notificationContainer(),
                    SizedBox(height: 15),
                    language(context),
                    SizedBox(height: 15),
                    logOut(),
                  ],
                ),
                Obx(() => CommanWidget(context: context).showlolder(
                    isshowDilog: _settingController.showLoader.value)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget settingHeader() {
    return AppBar(
      backgroundColor: Color(AppColor.bgColor),
      elevation: 1,
      title: Text(
        'titelofsetting'.tr,
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontFamily: AppFont.medium),
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
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
            iconSize: 20,
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget settingContainer(iconimg, containertext, String screen) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: InkWell(
        onTap: () {
          if (screen == '/aboutView') {
            _settingController.setUserDataForLogin();
          }
          Get.toNamed(screen);
        },
        child: Container(
          height: 55,
          width: Get.width,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Image.asset(
                  AssestPath.setting + "$iconimg",
                  height: 20,
                ),
                SizedBox(width: 10),
                Text(
                  '$containertext',
                  style: TextStyle(fontSize: 16, fontFamily: AppFont.medium),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget notificationContainer() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: Container(
        height: 55,
        width: Get.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Image.asset(
                AssestPath.setting + "Notification2.png",
                height: 20,
              ),
              SizedBox(width: 10),
              Text(
                'notification'.tr, //'notification'.tr,
                style: TextStyle(fontSize: 16, fontFamily: AppFont.medium),
              ),
              Spacer(),
              Obx(() => Switch(
                    value: _settingController.isSwitch.value,
                    onChanged: (value) {
                      print(value);
                      _settingController.isSwitch.value = value;
                      _settingController.onNotificationOnOff();
                    },
                    activeColor: Color(AppColor.maincategorySelectedTextColor),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget language(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'langugebtn'.tr,
            style: TextStyle(fontFamily: AppFont.medium, fontSize: 20),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              Get.defaultDialog(
                content: Container(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Text(
                          'letsChangeYourLanguge'.tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFont.medium,
                              color: Colors.grey),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            _settingController.selectedLanguage.value = "en";
                          },
                          child: Obx(() => Container(
                                height: 60,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: _settingController
                                                .selectedLanguage.value ==
                                            "en"
                                        ? Color(0xFFFDF1F1)
                                        : Color(AppColor.textFieldBg),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AssestPath.setting +
                                            "united-states.png",
                                        height: 28,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'en_US'.tr,
                                        style: TextStyle(
                                            fontFamily: AppFont.medium,
                                            fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(height: 10),
                        Visibility(
                          visible: false,
                          child: Container(
                            height: 60,
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: Color(AppColor.textFieldBg),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AssestPath.setting + "france.png",
                                    height: 28,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'fr'.tr,
                                    style: TextStyle(
                                        fontFamily: AppFont.medium,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                            onTap: () {
                              _settingController.selectedLanguage.value = "de";
                            },
                            child: Obx(
                              () => Container(
                                height: 60,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: _settingController
                                                .selectedLanguage.value ==
                                            "de"
                                        ? Color(0xFFFDF1F1)
                                        : Color(AppColor.textFieldBg),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AssestPath.setting + "germany (2).png",
                                        height: 28,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'ge'.tr,
                                        style: TextStyle(
                                            fontFamily: AppFont.medium,
                                            fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            _settingController.updateLocal();
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Color(0xFF101928),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Center(
                                  child: Text(
                                'updatelanguge'.tr,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: AppFont.medium,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                title: 'language'.tr,
                titleStyle: TextStyle(fontSize: 25, fontFamily: AppFont.bold),
              );
            },
            child: Container(
              height: 55,
              width: Get.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Obx(() => Row(
                      children: [
                        Image.asset(
                          _settingController.selectedLanguage.value == "de"
                              ? AssestPath.setting + "germany (2).png"
                              : AssestPath.setting + "united-states.png",
                          height: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          _settingController.selectedLanguage.value == "de"
                              ? "Deutsch"
                              : "English",
                          style: TextStyle(
                              fontSize: 16, fontFamily: AppFont.medium),
                        ),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 25,
                        ),
                      ],
                    )),
              ),
            ),
          ),
          SizedBox(height: 8),
          InkWell(
            onTap: () {
              showMyDialog(context);
            },
            child: Container(
              height: 55,
              width: Get.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Image.asset(
                      AssestPath.setting + "Delete.png",
                      height: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'deleteProfile'.tr,
                      style:
                          TextStyle(fontSize: 16, fontFamily: AppFont.medium),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget logOut() {
    return InkWell(
      onTap: () {
        _settingController.deleteUserProfile(isUserLogout: true);
        print('test');
      },
      child: Container(
        height: 70,
        width: Get.width,
        color: Color(AppColor.bgColor),
        child: Center(
            child: Text(
          'logout'.tr,
          style: TextStyle(
              color: Color(AppColor.paymentfailedColor),
              fontSize: 19,
              fontFamily: AppFont.medium),
        )),
      ),
    );
  }

  showMyDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = InkWell(
      child: Text(
        'no'.tr,
        style: TextStyle(
          fontSize: 15,
          fontFamily: AppFont.bold,
        ),
      ),
      onTap: () {
        Get.back();
      },
    );
    Widget continueButton = InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'yes'.tr,
          style: TextStyle(
            fontSize: 15,
            fontFamily: AppFont.bold,
          ),
        ),
      ),
      onTap: () {
        Get.back();
        _settingController.deleteUserProfile(isUserLogout: false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        'deleteProfile'.tr,
        style: TextStyle(
          fontSize: 20,
          fontFamily: AppFont.medium,
        ),
      ),
      content: Text(
        'deletealertmsg'.tr,
        style: TextStyle(
          fontSize: 15,
          fontFamily: AppFont.regular,
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
