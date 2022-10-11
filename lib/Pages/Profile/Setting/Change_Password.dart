import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';
import 'package:reserved4u/Pages/Profile/Setting/SettingController.dart';

// ignore: must_be_immutable
class ChangePassword extends StatelessWidget {
  SettingController _settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Scaffold(
        bottomNavigationBar: changePasswowrdBottom(),
        backgroundColor: Color(AppColor.bgColor),
        appBar: AppBar(
          backgroundColor: Color(AppColor.bgColor),
          elevation: 1,
          title: Text(
            'changedPw'.tr,
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
                    borderRadius: BorderRadius.circular(100)),
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
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 35, 20, 0),
                child: Column(
                  children: [
                    CommanWidget(context: context).textFeildWithImage(
                        hintText: 'oldPassword'.tr,
                        imgUrl: AssestPath.login + "Lock.png",
                        textEditingController: _settingController.oldPassword,
                        height: 20,
                        width: 18,
                        isSecure: true),
                    SizedBox(height: 10),
                    CommanWidget(context: context).textFeildWithImage(
                        hintText: 'newPassword'.tr,
                        imgUrl: AssestPath.login + "Lock.png",
                        textEditingController: _settingController.newPassword,
                        height: 20,
                        width: 18,
                        isSecure: true),
                    SizedBox(height: 10),
                    CommanWidget(context: context).textFeildWithImage(
                        hintText: 'confirmNewPassword'.tr,
                        imgUrl: AssestPath.login + "Lock.png",
                        textEditingController:
                            _settingController.confimPassword,
                        height: 20,
                        width: 18,
                        isSecure: true),
                  ],
                ),
              ),
              Obx(() => CommanWidget(context: context).showlolder(
                  isshowDilog: _settingController.showLoader.value)),
            ],
          ),
        ),
      ),
    );
  }

  Widget changePasswowrdBottom() {
    return InkWell(
      onTap: () {
        _settingController.checkValidation();
      },
      child: Container(
        height: 90,
        width: Get.width,
        child: Center(
            child: Text(
          'updatePassword'.tr,
          style: TextStyle(
              fontSize: 19, fontFamily: AppFont.medium, color: Colors.white),
        )),
        decoration: BoxDecoration(
            color: Color(AppColor.maincategorySelectedTextColor),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      ),
    );
  }
}
