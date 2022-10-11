import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';
import 'package:get/get.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'LoginController.dart';

class LoginView extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: InkWell(
      //   onTap: () {
      //     _loginController.sendGuestuserToServer();
      //   },
      //   child: Visibility(
      //     visible: !_loginController.isFromProfile,
      //     child: Container(
      //       height: Get.height / 9.96,
      //       decoration: BoxDecoration(color: Color(0xFFdb8a8a)),
      //       child: Center(
      //           child: Text(
      //         'continueAsGuestAccount'.tr,
      //         style: TextStyle(
      //           color: Color(AppColor.scaffoldbgcolor),
      //           fontSize: 16,
      //           fontFamily: AppFont.medium,
      //         ),
      //       )),
      //     ),
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: Get.height - 80,
              child: SingleChildScrollView(
                //scrollDirection: Axis.vertical,
                child: Column(children: [
                  header(context),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: textFeildContainer(context),
                  ),
                  bottomButtons(),
                ]),
              ),
            ),
          ),
          Obx(() => CommanWidget(context: context)
              .showlolder(isshowDilog: _loginController.showLoader.value)),
        ],
      ),
    );
  }

  Widget header(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            children: [
              Image.asset(
                AssestPath.login + "Logo_Home.png",
                height: 25,
                width: 100,
              ),
              SizedBox(height: 20),
              Text(
                'lestGetTogether'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppFont.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'loginToContinue'.tr,
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
        ),
        Visibility(
          visible: true,
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            height: 35.0,
            width: 35.0,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  if (_loginController.isFromProfile) {
                    //Get.offAndToNamed('/dashboard');
                    print('ifdcddcc');
                    Get.offNamed('/bottomNavBar');
                  } else {
                    print('elssddsdde');
                    Get.back();
                  }
                },
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.black,
                ),
                backgroundColor: Color(AppColor.scaffoldbgcolor),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget textFeildContainer(BuildContext context) {
    return Column(
      children: [
        CommanWidget(context: context).textFeildWithImage(
          hintText: 'email'.tr,
          imgUrl: AssestPath.login + "Email.png",
          keyboardType: TextInputType.emailAddress,
          textEditingController: _loginController.emailText,
          height: 18,
          width: 18,
        ),
        Obx(() => errorText(_loginController.emailError.value)),
        SizedBox(
          height: 10,
        ),
        CommanWidget(context: context).textFeildWithImage(
          hintText: 'password'.tr,
          imgUrl: AssestPath.login + "Lock.png",
          textEditingController: _loginController.passwordText,
          height: 20,
          width: 18,
          isSecure: true,
          onSubmit: _loginController.checkValidation,
        ),
        Obx(() => errorText(_loginController.passwordError.value)),
        SizedBox(height: 7),
        GestureDetector(
          onTap: _loginController.onRememberMeTap,
          child: Row(
            children: [
              SizedBox(width: 3),
              Obx(() {
                if (_loginController.rememberMe.value == true) {
                  return Icon(Icons.check_box_outlined, size: 15);
                } else {
                  return Icon(Icons.check_box_outline_blank, size: 15);
                }
              }),
              SizedBox(width: 5),
              Text(
                "rememberMe".tr,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: () {
            Get.toNamed("/forgotPassword");
          },
          child: Text(
            'forgotPassword'.tr,
            style: TextStyle(
              fontSize: 15,
              fontFamily: AppFont.bold,
            ),
          ),
        ),
        SizedBox(height: 30),
        Stack(
          alignment: Alignment.center,
          children: [
            InkWell(
              onTap: () {
                _loginController.checkValidation();
              },
              child: Container(
                height: Get.height / 16.29,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  child: Center(
                    child: Text(
                      'login'.tr,
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

  Widget errorText(String error) {
    if (error != "") {
      return Row(
        children: [
          SizedBox(width: 5),
          Text(
            error,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.red, fontSize: 11.5),
          ),
        ],
      );
    } else {
      return SizedBox();
    }
  }

  Widget bottomButtons() {
    return Column(
      children: [
        SizedBox(
          height: Get.height / 44.8,
        ),
        Center(
          /*child: SvgPicture.asset(
            AssestPath.login + "or_temp.svg",
            fit: BoxFit.cover,
            height: Get.height / 29.87,
          ),*/
          child: Image.asset(
            'password'.tr == "Password"
                ? AssestPath.login + "or.png"
                : AssestPath.login + "oder.png",
            fit: BoxFit.cover,
            height: Get.height / 29.87,
          ),
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                _loginController.initiateFacebookLogin();
              },
              child: Container(
                height: Get.height / 19.91,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(
                        AssestPath.login + "Facebook.png",
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xfff0f8ff),
                        // color: Colors.blue[100],
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      )
                    ]),
              ),
            ),
            SizedBox(width: 25),
            InkWell(
              onTap: () {
                _loginController.initiateGmailLogin();
              },
              child: Container(
                height: Get.height / 19.91,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(AssestPath.login + "Google.png"),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xfffef4f3),
                        // color: Colors.blue[100],
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      )
                    ]),
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Visibility(
          visible: Platform.isIOS,
          child: Container(
            height: Get.height / 17.92,
            padding: EdgeInsets.only(left: 20, right: 20),
            child: SignInWithAppleButton(
              onPressed: () async {
                _loginController.doApplePayment();
              },
            ),
          ),
        ),
        SizedBox(height: 25),
        Text(
          'dontHaveanccount'.tr,
          style: TextStyle(
            color: Color(0xFFaeb1b6),
            fontFamily: AppFont.regular,
          ),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {
            Get.toNamed("/signup");
          },
          child: Text(
            'signUp'.tr,
            style: TextStyle(
              fontSize: 15,
              fontFamily: AppFont.bold,
            ),
          ),
        ),
        SizedBox(height: 25),
        // InkWell(
        //   onTap: () {
        //     _loginController.sendGuestuserToServer();
        //   },
        //   child: Visibility(
        //     visible: !_loginController.isFromProfile,
        //     child: Container(
        //       height: 100,
        //       decoration: BoxDecoration(color: Color(0xFFfef4ee)),
        //       child: Center(
        //           child: Text(
        //         "Continue As Guest Account?",
        //         style: TextStyle(
        //           color: Color(0xFFe19d9c),
        //           fontSize: 16,
        //           fontFamily: AppFont.medium,
        //         ),
        //       )),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
