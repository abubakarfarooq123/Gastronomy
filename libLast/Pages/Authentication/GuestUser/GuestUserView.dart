import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';
import 'package:reserved4u/Pages/Authentication/GuestUser/GuestUserController.dart';

// ignore: must_be_immutable
class GuestUserView extends StatelessWidget {
  GuestUserController _guestUserController = Get.put(GuestUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColor.scaffoldbgcolor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appbar(),
                SizedBox(
                  height: 20,
                ),
                header(context),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: textFeildContainer(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appbar() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
      height: 35.0,
      width: 35.0,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
          backgroundColor: Color(AppColor.scaffoldbgcolor),
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
            height: 25,
            width: 100,
          ),
          SizedBox(height: 20),
          Text(
            'letget'.tr,
            style: TextStyle(
              fontSize: 20,
              fontFamily: AppFont.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'guest'.tr,
            style: TextStyle(
                color: Color(0xffa3a7ac),
                fontSize: 15,
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              //height: 70,
              width: (Get.width - 55) / 2,

              child: CommanWidget(context: context).textFeildWithImage(
                  hintText: 'firstnamehint'.tr,
                  imgUrl: AssestPath.login + "User.png",
                  keyboardType: TextInputType.emailAddress,
                  textEditingController: _guestUserController.fname,
                  height: 20,
                  width: 15,
                  titleText: ''),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              //height: 70,
              width: (Get.width - 55) / 2,

              child: CommanWidget(context: context).textFeildWithImage(
                  hintText: 'lastnamehint'.tr,
                  imgUrl: AssestPath.login + "User.png",
                  keyboardType: TextInputType.emailAddress,
                  textEditingController: _guestUserController.lname,
                  maxLength: 11,
                  height: 20,
                  width: 15,
                  titleText: ''),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        CommanWidget(context: context).textFeildWithImage(
            hintText: 'Emailhint'.tr,
            imgUrl: AssestPath.login + "Email.png",
            keyboardType: TextInputType.emailAddress,
            textEditingController: _guestUserController.emailText,
            height: 18,
            width: 18,
            titleText: ''),
        SizedBox(
          height: 15,
        ),
        textFeildWithImagePhoneNumber(
            hintText: 'phoneNumber'.tr,
            maxLength: 13,
            imgUrl: AssestPath.login + "Call1.png",
            keyboardType:
                TextInputType.numberWithOptions(signed: true, decimal: false),
            textEditingController: _guestUserController.phnNoText,
            height: 20,
            width: 20),
        SizedBox(height: 30),
        Stack(
          children: [
            InkWell(
              onTap: () {
                _guestUserController.checkValidation();
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
                      'continue'.tr,
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

  Widget textFeildWithImagePhoneNumber({
    String titleText,
    String hintText,
    String imgUrl,
    TextInputType keyboardType,
    TextEditingController textEditingController,
    double height,
    double width,
    bool isSecure = false,
    int maxLength = 200,
  }) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: Color(AppColor.textFieldBg),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          SizedBox(
            width: 20.0,
          ),
          Image.asset(
            imgUrl,
            fit: BoxFit.fill,
            height: height,
            width: width,
            color: Colors.black45,
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: TextFormField(
              controller: textEditingController,
              keyboardType: keyboardType,
              obscureText: isSecure,
              maxLength: maxLength,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              style: TextStyle(
                fontFamily: AppFont.medium,
                fontSize: 15,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                counterText: "",
                hintStyle: TextStyle(
                    color: Color(AppColor.textFieldtextColor),
                    fontFamily: AppFont.medium,
                    fontSize: 15),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(AppColor.textFieldBg),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
