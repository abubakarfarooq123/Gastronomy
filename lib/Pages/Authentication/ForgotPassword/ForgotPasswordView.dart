import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';
import 'package:reserved4u/Pages/Authentication/ForgotPassword/ForgotPasswordController.dart';

class ForgotPasswordView extends StatelessWidget {
  final ForgotPasswordController _forgotPasswordController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            child: SafeArea(
              child: Column(children: [
                header(context),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: textFeildContainer(context),
                ),
                Spacer(),
                bottomButtons(),
              ]),
            ),
          ),
          Obx(() => CommanWidget(context: context).showlolder(
              isshowDilog: _forgotPasswordController.showLoader.value))
        ],
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
          SizedBox(height: 20),
          Text(
            'oopsalert'.tr,
            style: TextStyle(
              fontSize: 20,
              fontFamily: AppFont.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'enteremailmsg'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xffa3a7ac),
                fontSize: 12,
                fontFamily: AppFont.regular),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget textFeildContainer(BuildContext context) {
    return Column(
      children: [
        CommanWidget(context: context).textFeildWithImage(
            hintText: 'email'.tr,
            imgUrl: AssestPath.login + "Email.png",
            keyboardType: TextInputType.emailAddress,
            textEditingController: _forgotPasswordController.emailText,
            height: 18,
            width: 18),
        Obx(() {
          if (_forgotPasswordController.emailError.value != '') {
            return Row(
              children: [
                SizedBox(width: 5),
                Text(
                  _forgotPasswordController.emailError.value,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.red, fontSize: 11.5),
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        }),
        SizedBox(height: 30),
        Stack(
          children: [
            InkWell(
              onTap: () {
                _forgotPasswordController.checkValidation();
              },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  child: Center(
                    child: Text(
                      'sent'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: AppFont.medium),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                right: 10,
                top: 20,
                child: Center(
                  child: Image.asset(
                    AssestPath.login + "Arrow.png",
                    height: 15,
                    width: 40,
                  ),
                ))
          ],
        )
      ],
    );
  }

  Widget bottomButtons() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(height: 25),
        Text(
          'rememberPW'.tr,
          style: TextStyle(
            color: Color(0xFFaeb1b6),
            fontFamily: AppFont.regular,
          ),
        ),
        SizedBox(height: 5),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Text(
            'login'.tr,
            style: TextStyle(
              fontSize: 15,
              fontFamily: AppFont.bold,
            ),
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
