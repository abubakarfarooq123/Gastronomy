import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';
import 'package:reserved4u/Pages/Authentication/Login/LoginController.dart';
import 'package:reserved4u/Pages/Authentication/SignUp/SignUpController.dart';

class SignUpView extends StatelessWidget {
  final SignUpController _signupController = Get.put(SignUpController());
  final LoginController _loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    _signupController.context = context;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          child: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
            'registertext'.tr,
            style: TextStyle(
              fontSize: 20,
              fontFamily: AppFont.bold,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text(
              'signuptext'.tr,
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              //height: 70,
              width: (Get.width - 55) / 2,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommanWidget(context: context).textFeildWithImage(
                      hintText: 'firstnamehint'.tr,
                      imgUrl: AssestPath.login + "User.png",
                      keyboardType: TextInputType.emailAddress,
                      textEditingController: _signupController.fname,
                      height: 20,
                      width: 15),
                  Obx(() => errorText(_signupController.fnameError.value)),
                ],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: (Get.width - 55) / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommanWidget(context: context).textFeildWithImage(
                    hintText: 'lastnamehint'.tr,
                    imgUrl: AssestPath.login + "User.png",
                    keyboardType: TextInputType.emailAddress,
                    textEditingController: _signupController.lname,
                    height: 20,
                    width: 15,
                  ),
                  Obx(() => errorText(_signupController.lnameError.value)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        CommanWidget(context: context).textFeildWithImage(
          hintText: 'Emailhint'.tr,
          imgUrl: AssestPath.login + "Email.png",
          keyboardType: TextInputType.emailAddress,
          textEditingController: _signupController.emailText,
          height: 18,
          width: 18,
        ),
        Row(
          children: [
            Obx(() => errorText(_signupController.emailError.value)),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        CommanWidget(context: context).textFeildWithImage(
          hintText: 'Passcodehint'.tr,
          imgUrl: AssestPath.login + "Lock.png",
          keyboardType: TextInputType.emailAddress,
          textEditingController: _signupController.passwordText,
          height: 20,
          width: 18,
          isSecure: true,
        ),
        Row(
          children: [
            Obx(() => errorText(_signupController.passwordError.value)),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        CommanWidget(context: context).textFeildWithImage(
          hintText: 'confirmPWhint'.tr,
          imgUrl: AssestPath.login + "Lock.png",
          keyboardType: TextInputType.emailAddress,
          textEditingController: _signupController.cpasswordText,
          height: 20,
          width: 18,
          isSecure: true,
        ),
        Row(
          children: [
            Obx(() => errorText(_signupController.cpasswordError.value)),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          // height: 55,
          decoration: BoxDecoration(
              color: Color(AppColor.textFieldBg),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              SizedBox(width: 15.0),
              Expanded(
                child: IntlPhoneField(
                  decoration: InputDecoration(
                    isDense: true,

                    hintText: 'phoneNumber'.tr,

                    counterText: "",

                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,

                    // bottom:
                    //     _signupController.fullPhoneNumber == null ? 20 : 0.0
                    // HERE THE IMPORTANT PART
                    // ),

                    // contentPadding: EdgeInsets.all(15),
                    hintStyle: TextStyle(
                        color: Color(AppColor.textFieldtextColor),
                        fontFamily: AppFont.medium,
                        fontSize: 15),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(AppColor.textFieldBg),
                      ),
                    ),
                  ),
                  style: TextStyle(fontFamily: AppFont.medium),
                  textAlignVertical: TextAlignVertical.center,
                  controller: _signupController.phoneText,
                  onChanged: (phone) {
                    _signupController.fullPhoneNumber = phone.completeNumber;
                    print('fullPhoneNumber');
                    print(_signupController.fullPhoneNumber);
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ' + country.name);
                  },
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Obx(() => errorText(_signupController.phoneError.value)),
          ],
        ),
        SizedBox(height: 30),
        Stack(
          children: [
            InkWell(
              onTap: () {
                _signupController.checkValidation();
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
                      'signup'.tr,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _signupController.rememberOntap,
              child: Row(
                children: [
                  Obx(() {
                    if (_signupController.isSelect.value == true) {
                      return Icon(
                        Icons.check_box,
                        color: Colors.grey,
                      );
                    } else {
                      return Icon(
                        Icons.check_box_outline_blank_sharp,
                        color: Colors.grey,
                      );
                    }
                  })
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('text1'.tr,
                        maxLines: 8,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 15,
                            fontFamily: AppFont.medium)),
                    InkWell(
                      child: Text('privacy'.tr,
                          maxLines: 8,
                          style: TextStyle(
                              color: Colors.pink.withOpacity(0.8),
                              fontSize: 15,
                              fontFamily: AppFont.medium)),
                    ),
                  ],
                ),
              ),
            ),
          ],
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

  Widget bottomButtons() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: Image.asset(
            'password'.tr == "Password"
                ? AssestPath.login + "or.png"
                : AssestPath.login + "oder.png",
            fit: BoxFit.cover,
            height: Get.height / 29.87,
          ),
          /*child: SvgPicture.asset(
            AssestPath.login + "or_temp.svg",
            fit: BoxFit.cover,
            height: 30,
          ),*/
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                _loginController.initiateFacebookLogin();
              },
              child: Container(
                height: 45,
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
                height: 45,
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
        SizedBox(height: 25),
        Text(
          'haveaccount'.tr,
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
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'text2'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 15,
              fontFamily: AppFont.medium,
            ),
          ),
        )
      ],
    );
  }
}
