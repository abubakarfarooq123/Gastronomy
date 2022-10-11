import 'package:flutter/material.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';
import 'package:reserved4u/Pages/Authentication/FinishingSignup/finishing_controller.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';

class FinishingView extends StatelessWidget {
  FinishingView({Key key}) : super(key: key);
  FinishingController controller = Get.put(FinishingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  header(),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: textFeildContainer(context),
                  ),
                ],
              ),
            ),
          ),
          Obx(() => CommanWidget(context: context)
              .showlolder(isshowDilog: controller.showLoader.value)),
        ],
      ),
    );
  }

  Widget header() {
    return Center(
      child: Column(
        children: [
          Image.asset(
            AssestPath.login + "Logo_Home.png",
            height: 25,
            width: 100,
          ),
          SizedBox(height: 20),
          Text(
            'finishingSigningUp'.tr,
            style: TextStyle(
              fontSize: 20,
              fontFamily: AppFont.bold,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text(
              'thisInfoHasComeFromApple'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xffa3a7ac),
                  fontSize: 15,
                  fontFamily: AppFont.regular),
            ),
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
          hintText: 'firstnamehint'.tr,
          imgUrl: AssestPath.login + "User.png",
          keyboardType: TextInputType.emailAddress,
          textEditingController: controller.fname,
          height: 20,
          width: 15,
          enable: controller.nameEnable,
        ),
        Obx(() => errorText(controller.fnameError.value)),
        SizedBox(
          height: 8,
        ),
        CommanWidget(context: context).textFeildWithImage(
          hintText: 'lastnamehint'.tr,
          imgUrl: AssestPath.login + "User.png",
          keyboardType: TextInputType.emailAddress,
          textEditingController: controller.lname,
          height: 20,
          width: 15,
          enable: controller.nameEnable,
        ),
        Obx(() => errorText(controller.lnameError.value)),
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox(width: 7),
            Text(
              'enterEmailHere'.tr,
              style: TextStyle(
                fontSize: 12,
                fontFamily: AppFont.medium,
              ),
            ),
          ],
        ),
        SizedBox(height: 3),
        CommanWidget(context: context).textFeildWithImage(
            hintText: 'Emailhint'.tr,
            imgUrl: AssestPath.login + "Email.png",
            keyboardType: TextInputType.emailAddress,
            textEditingController: controller.emailText,
            height: 18,
            width: 18),
        Row(
          children: [
            Obx(() => errorText(controller.emailError.value)),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(height: 30),
        Stack(
          children: [
            InkWell(
              onTap: () {
                controller.checkValidation();
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
                      'continueText'.tr,
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
                )),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget errorText(String error) {
    if (error != "") {
      return Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Text(
          error,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.red, fontSize: 11.5),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
