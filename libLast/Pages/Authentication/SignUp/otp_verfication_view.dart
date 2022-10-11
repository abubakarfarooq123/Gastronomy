import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pin_put/pin_put.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/ResponseModel.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';
import 'package:reserved4u/Helper/preferences.dart';
import 'package:reserved4u/Helper/url.dart';
import 'package:reserved4u/Pages/Authentication/SignUp/SignUpController.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class OtpVerificationView extends StatefulWidget {
  final String email;
  final String last_name;
  final String device_token;
  final String device_id;
  final String device_type;
  final String join_newsletter;
  final String first_name;
  final String password;
  final String phone;
  final String otp;
  OtpVerificationView(
      {this.email,
      this.last_name,
      this.device_token,
      this.device_id,
      this.device_type,
      this.join_newsletter,
      this.first_name,
      this.password,
      this.phone,
      this.otp});

  @override
  _OtpVerificationViewState createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView>
    with TickerProviderStateMixin {
  int levelClock = 300;
  bool timeUp = false;
  TextEditingController otpController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  AnimationController animationController;
  String userOtp;
  String btnText = 'submitOtp2'.tr;
  bool loader = false;
  String userPin;
  var newOtp = '';

  TwilioFlutter twilioFlutter;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock));
    animationController.forward();
    changeBtnText();
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC40a83e0fadacda88ca315d1e8791abaf',
        authToken: '98deaa9be0e1d9ab23b73e4041be868a',
        twilioNumber: '+19802917656');
    super.initState();
  }

  void sendRegisterDataToServer() async {
    ApiProvider apiProvider = ApiProvider();
    await apiProvider.post(ApiUrl.register, {
      'email': widget.email,
      'password': widget.password,
      'first_name': widget.first_name,
      'last_name': widget.last_name,
      'device_token': widget.device_token,
      'device_id': widget.device_id,
      'device_type': widget.device_type,
      "join_newsletter": widget.join_newsletter,
      "phone_number": widget.phone
    }).then(
      (value) {
        var responseJson = json.decode(value.body);
        print(responseJson);
        ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
        if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
          var token = responseJson["ResponseData"]["token"];
          print(token);
          var user = responseJson["ResponseData"]["user"];
          print(user);
          Preferences.preferences
              .saveBool(key: PrefernceKey.isUserLogin, value: true);
          Preferences.preferences
              .saveString(key: PrefernceKey.email, value: widget.email);
          Preferences.preferences
              .saveString(key: PrefernceKey.password, value: widget.password);
          Preferences.preferences
              .saveString(key: PrefernceKey.loginToken, value: token);
          Preferences.preferences
              .saveString(value: jsonEncode(user), key: PrefernceKey.userData);
          Get.offAllNamed('/bottomNavBar');
        }
      },
    );
  }

  verifyOtp(String userInput) async {
    if (userInput == widget.otp) {
      sendRegisterDataToServer();
    } else if (newOtp.isNotEmpty) {
      if (userInput != null) {
        if (newOtp == userInput) {
          sendRegisterDataToServer();
        }
      } else {
        showTostMessage(message: "alreadytaken".tr);
      }
    } else {
      showTostMessage(message: "Wrong OTP");
    }
  }

  void resendSendSms({phoneNUmber}) async {
    print(phoneNUmber);
    var rndnumber = "";
    var rnd = new Random();
    for (var i = 0; i < 6; i++) {
      rndnumber = rndnumber + rnd.nextInt(9).toString();
      print("rndnumber");
      print(rndnumber);
    }
    setState(() {
      newOtp = rndnumber;
    });
    try {
      twilioFlutter.sendSMS(
          toNumber: phoneNUmber,
          messageBody: 'Dein reserved4you Code ist:$rndnumber');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Otp Sent Successfully')));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  void changeBtnText() async {
    Future.delayed(Duration(seconds: levelClock), () {
      timeUp = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'mobileNumberVerification'.tr,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(AppColor.logoBgColor),
      ),
      body: loader
          ? CommanWidget(context: context).showlolder(isshowDilog: true)
          : GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Stack(
                alignment: AlignmentDirectional(-0.85, -0.85),
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Countdown(
                                    animation:
                                        StepTween(begin: levelClock, end: 0)
                                            .animate(animationController),
                                  ),
                                  Text(
                                    " " + 'seconds'.tr,
                                    style: TextStyle(
                                        color: timeUp == true
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.watch_later_outlined,
                                    color: timeUp == true
                                        ? Colors.transparent
                                        : Colors.grey,
                                    size: 32,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              /* Icon(
                          Icons.watch_later_outlined,
                          color:
                              timeUp == true ? Colors.transparent : Colors.grey,
                          size: 32,
                        ),*/
                            ],
                          ),
                          Text(
                            'submitOtp'.tr,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            'verificationCode'.tr,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 15.5),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          PinPut(
                            fieldsCount: 6,
                            controller: otpController,
                            focusNode: _focusNode,
                            autofocus: true,
                            onSubmit: (String pin) {
                              setState(() {
                                userPin = pin;
                                print('userPin');
                                print(userPin);
                              });
                              verifyOtp(pin);
                            },
                            mainAxisSize: MainAxisSize.max,
                            eachFieldPadding: EdgeInsets.only(
                                top: 18, bottom: 18, left: 20, right: 20),
                            textStyle:
                                TextStyle(color: Colors.blue, fontSize: 16),
                            submittedFieldDecoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            selectedFieldDecoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            followingFieldDecoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          timeUp == true
                              ? CommonBtn(
                                  btnText: 'resendOtp'.tr,
                                  isIconAvailable: false,
                                  backgroundColor: Color(AppColor.logoBgColor),
                                  textColor: Colors.black.withOpacity(0.5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 38, vertical: 13),
                                  borderRadius: 30.0,
                                  fontSize: 15,
                                  iconColor: Colors.white,
                                  onButtonPressed: () async {
                                    resendSendSms(phoneNUmber: widget.phone);
                                  },
                                )
                              : CommonBtn(
                                  btnText: 'resendOtp'.tr,
                                  isIconAvailable: false,
                                  backgroundColor: Colors.white70,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 38, vertical: 13),
                                  borderRadius: 30.0,
                                  fontSize: 15,
                                  iconColor: Colors.black.withOpacity(0.3),
                                  onButtonPressed: () {},
                                  textColor: Colors.black.withOpacity(0.3),
                                ),
                          SizedBox(height: 10),
                          CommonBtn(
                            btnText: btnText,
                            isIconAvailable: false,
                            backgroundColor: timeUp == true
                                ? Colors.white70
                                : Color(AppColor.logoBgColor),
                            textColor: timeUp == true
                                ? Colors.black.withOpacity(0.3)
                                : Colors.black.withOpacity(0.5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 38, vertical: 13),
                            borderRadius: 30.0,
                            fontSize: 15,
                            iconColor: timeUp == true
                                ? Colors.black.withOpacity(0.5)
                                : Colors.black,
                            onButtonPressed: () async {
                              if (timeUp) {
                                return;
                              }
                              if (btnText == 'submitOtp2'.tr) {
                                if (otpController.text.isNotEmpty) {
                                  print('hhhhhhhh');
                                  verifyOtp(userPin);
                                } else if (otpController.text.isEmpty) {
                                  showTostMessage(message: "Please enter OTP");
                                }
                              }
                            },
                          ),
                          SizedBox(height: Get.height * 0.05),
                          timeUp == false
                              ? Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        //  color: ColorRes.blue
                                      ),
                                      child: Center(
                                        child: Text(
                                          "",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          // color: ColorRes.blue
                                        ),
                                        child: Center(
                                            child: timeUp == false
                                                ? Text(
                                                    "",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )
                                                : Text(""))),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  resendOTP() async {
    loader = true;
    setState(() {});
    otpController.clear();
    try {
      Map<String, dynamic> body = {'email': widget.email};
      http.Response response =
          await ApiProvider().post(ApiUrl.resendEmail, body);
      var resBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        loader = false;
        setState(() {});
        clockReset();
        showTostMessage(message: resBody['ResponseText']);
      } else {
        loader = false;
        setState(() {});

        showTostMessage(message: resBody['ResponseText']);
      }
    } catch (e) {
      loader = false;
      setState(() {});
      showTostMessage(
          message: "Something Went to Wrong Please try again later");
      // Get.to(() => SearchCityScreen());
      Exception(["$e"]);
    }
  }

  void clockReset() async {
    if (timeUp) {
      animationController = AnimationController(
          vsync: this, duration: Duration(seconds: levelClock));
      animationController.forward();
      changeBtnText();
      Future.delayed(Duration(seconds: levelClock), () {
        timeUp = true;
      });
      loader = true;
      setState(() {});
      timeUp = false;
      btnText = 'submitOtp2'.tr;
      loader = false;
      setState(() {});
    }
  }

  Future<void> verifyOtp1() async {
    Map<String, dynamic> body = {
      'email': widget.email,
      'otp': otpController.text,
    };
    print(body);
    try {
      http.Response value = await ApiProvider().post(ApiUrl.verifyEmail, body);

      var responseJson = json.decode(value.body);
      print(responseJson);
      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        var token = responseJson["ResponseData"]["token"];
        Preferences.preferences
            .saveString(key: PrefernceKey.loginToken, value: token);
        var responsedata = responseJson["ResponseData"];
        var user = responsedata["user"];
        Preferences.preferences
            .saveString(value: jsonEncode(user), key: PrefernceKey.userData);
        Preferences.preferences
            .saveBool(key: PrefernceKey.isUserLogin, value: true);
        showTostMessage(message: _responseModel.responseText);
        Get.offAllNamed('/bottomNavBar');
      } else {
        showTostMessage(message: responseJson["ResponseText"]);
      }
    } catch (e) {
      print(e);
      showTostMessage(message: e.toString());
      throw e;
    }
  }

  Widget CommonBtn({
    String btnText,
    VoidCallback onButtonPressed,
    IconData icon,
    Color backgroundColor,
    Color borderColor,
    Color textColor,
    Color iconColor,
    EdgeInsetsGeometry padding,
    Size height,
    Size width,
    TextStyle textStyle,
    double borderRadius,
    bool isIconAvailable,
    int fontSize,
  }) {
    return InkWell(
      onTap: onButtonPressed,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: backgroundColor ?? backgroundColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: Offset(0, 2),
                blurRadius: 3,
              ),
            ]),
        child: Padding(
          padding: padding,
          child: isIconAvailable
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      btnText,
                      style: TextStyle(
                          color: textColor,
                          fontSize: fontSize.toDouble(),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      icon,
                      color: iconColor,
                      size: 20,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      btnText,
                      style: TextStyle(
                          color: textColor,
                          fontSize: fontSize.toDouble(),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({this.animation}) : super(listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    String timerText =
        '${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}' ==
                "00"
            ? ""
            : '${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Text(
      "$timerText",
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
    );
  }
}
