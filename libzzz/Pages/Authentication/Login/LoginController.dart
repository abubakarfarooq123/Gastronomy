import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/ResponseModel.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:reserved4u/Helper/commanFuncation.dart';
import 'package:reserved4u/Helper/preferences.dart';
import 'package:reserved4u/Helper/url.dart';
import 'package:http/http.dart' as http;
import 'package:reserved4u/Pages/DashBoard/DashBoardController.dart';
import 'package:reserved4u/Pages/Notification/notification_service.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginController extends GetxController {
  TextEditingController emailText;
  TextEditingController passwordText;
  BuildContext context;
  User user;
  String previousEmail = "";
  String previousPassword = "";
  var showLoader = false.obs;
  var firstname = "";
  var lastname = "";
  var email;
  var gender = "";
  var iamge = "";
  var dob = "";

  var deviceId;
  var isFromProfile = false;
  var rememberMe = false.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //bool showLoginDialog = false;
  var userId = "";
  GoogleSignIn googleSignIn;

  @override
  // ignore: must_call_super
  void onInit() {
    getPreviousData();
    isFromProfile = Get.arguments;
    CommonVariables(context: context).getId().then((value) {
      deviceId = value;
    });
    emailText = TextEditingController();
    passwordText = TextEditingController();

    googleSignIn = GoogleSignIn(scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/userinfo.profile'
    ]);
  }

  Future<void> getPreviousData() async {
    bool flag = await Preferences.preferences
        .getBool(key: PrefernceKey.rememberMe, defValue: false);
    if (flag) {
      previousEmail =
          await Preferences.preferences.getString(key: PrefernceKey.email);
      previousPassword =
          await Preferences.preferences.getString(key: PrefernceKey.password);
    }
    rememberMe.value = flag;
    emailText.text = previousEmail;
    passwordText.text = previousPassword;
  }

  void checkValidation() {
    getErrorText();
    if (emailText.text.isEmpty) {
      showTostMessage(message: 'enterEmail'.tr);
    } else if (passwordText.text.isEmpty) {
      showTostMessage(message: 'enterPassword'.tr);
    } else {
      showLoader.value = true;
      sendLoginDataToServer();
    }
  }

  void getErrorText() {
    if (emailText.text.trim() == '') {
      emailError.value = 'enterEmail'.tr;
    } else {
      emailError.value = '';
    }

    if (passwordText.text.trim() == '') {
      passwordError.value = 'enterPassword'.tr;
    } else {
      passwordError.value = '';
    }
  }

  void sendLoginDataToServer() async {
    String token = await FirebaseMessaging.instance.getToken();
    ApiProvider apiProvider = ApiProvider();
    print('lnksjksghskajghsgjkhjkhk');
    print(token);
    await apiProvider.post(ApiUrl.login, {
      'email': emailText.text.trim(),
      'password': passwordText.text.trim(),
      'device_token': token,
      "device_id": deviceId,
      "device_type": Platform.isIOS ? "ios" : "Android",
    }).then(
      (value) {
        var responseJson = json.decode(value.body);
        print(responseJson);
        ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
        if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
          setLoginDataAndGoTonextpage(responseJson);
        }
        Preferences.preferences
            .saveBool(key: PrefernceKey.rememberMe, value: rememberMe.value);
        Preferences.preferences
            .saveString(key: PrefernceKey.email, value: emailText.text.trim());
        Preferences.preferences.saveString(
            key: PrefernceKey.password, value: passwordText.text.trim());
        showTostMessage(message: _responseModel.responseText);
        showLoader.value = false;
      },
    );
  }

  void onRememberMeTap() {
    rememberMe.value = !rememberMe.value;
  }

  Future<void> setLoginDataAndGoTonextpage(dynamic responseJson) async {
    if (responseJson['ResponseData']['isavailableemail'] != false) {
      Preferences.preferences
          .saveBool(key: PrefernceKey.isUserLogin, value: true);
    }
    var token = responseJson["ResponseData"]["token"];
    var user = responseJson["ResponseData"]["user"];
    Preferences.preferences
        .saveString(key: PrefernceKey.loginToken, value: token);
    Preferences.preferences
        .saveString(value: jsonEncode(user), key: PrefernceKey.userData);
    if (responseJson['ResponseData']['isavailableemail'] == false) {
      //Get.to(() => FinishingView());
    } else if (isFromProfile) {
      Get.offNamed('/bottomNavBar');
    } else {
      print('kababdhabahbajdhbj');
      Get.back();
      Get.toNamed('/checkoutProcess');
    }
  }

  void initiateFacebookLogin() async {
    print('start fb login');
    showLoader.value = true;
    var facebookLogin = FacebookLogin();
    facebookLogin.loginBehavior = FacebookLoginBehavior.webOnly;
    final facebookLoginResult = await facebookLogin
        .logIn(['email', "public_profile", "user_gender", "user_birthday"]);
    print('facebookLoginResult');
    print(facebookLoginResult);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        showLoader.value = false;
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        showLoader.value = false;
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        getFbProfileData(facebookLoginResult);
        break;
    }
  }

  void getFbProfileData(FacebookLoginResult facebookLoginResult) async {
    print("LoggedIn");
    var graphResponse = await http.get(Uri.parse(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,gender,email,picture.height(200)&access_token=${facebookLoginResult.accessToken.token}'));

    var profile = json.decode(graphResponse.body);
    print(profile.toString());
    firstname = profile["first_name"];
    lastname = profile["last_name"];
    email = profile["email"];
    gender = profile["gender"];
    iamge = profile["picture"]["data"]["url"];
    var socialId = profile["id"];
    doSocailLoginToServer(socialId: socialId, socialtype: "facebook");
  }

  void initiateGmailLogin() async {
    await Firebase.initializeApp();

    final GoogleSignInAccount googleUser = await googleSignIn.signIn();

    print("Hello");
    print(googleUser.serverAuthCode);
    if (googleUser == null) {
      print("Null");
    } else {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User user = authResult.user;
      if (user != null) {
        assert(user.email != null);
        assert(user.displayName != null);
        assert(user.photoURL != null);
        email = user.email;
        iamge = user.photoURL ?? "";
        var arr = user.displayName.split(" ");
        firstname = arr.first;
        lastname = arr.last;
        showLoader.value = true;
        doSocailLoginToServer(
            socialId: googleAuth.accessToken, socialtype: "google");
        final User currentUser = _auth.currentUser;
        assert(user.uid == currentUser.uid);
        print('signInWithGoogle succeeded: $user');
      }
    }
  }

  Future<void> doApplePayment() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      print("credential=${credential}");
      firstname = credential.givenName ?? "";
      lastname = credential.familyName ?? "";
      email = credential.email == null ? "" : credential.email;
      print('email11');
      print(email);
      userId = credential.userIdentifier.toString();
      doSocailLoginToServer(
          socialId: credential.identityToken.toString(), socialtype: "apple");
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void doSocailLoginToServer({String socialtype, String socialId}) async {
    String token = await FirebaseMessaging.instance.getToken();
    ApiProvider apiProvider = ApiProvider();
    print('emailfffff');
    print(email);
    print(firstname);
    print(lastname);
    print(socialId);
    var body = {
      "first_name": firstname,
      "last_name": lastname,
      "user_name": firstname == null ? null : firstname + " " + lastname,
      "device_id": deviceId,
      "device_type": Platform.isIOS ? "ios" : "Android",
      "device_token": token,
      "social_id": socialId,
      "email": email ?? "",
      "profile_pic": iamge,
      "social_type": socialtype,
      "user_id": userId.toString()
    };
    print(body);
    await apiProvider.post(ApiUrl.sociallogin, body).then((value) {
      var responseJson = json.decode(value.body);
      print('responseJson');
      print(responseJson);
      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      print('_responseModel');
      print(_responseModel.responseCode);
      if (_responseModel.responseCode == 1) {
        print('if');
        showLoader.value = false;
        Preferences.preferences
            .saveBool(key: PrefernceKey.isUserLogin, value: true);
        Preferences.preferences.saveString(
            key: PrefernceKey.loginToken,
            value: responseJson['ResponseData']['token']);
        Preferences.preferences
            .saveString(value: jsonEncode(user), key: PrefernceKey.userData);
        if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
          setLoginDataAndGoTonextpage(responseJson);
        }
      } else if (_responseModel.responseCode == 0) {
        print('else');
        showLoader.value = false;
      }
    });
  }

  void sendGuestuserToServer() async {
    showLoader.value = true;
    ApiProvider apiProvider = ApiProvider();

    await apiProvider.post(ApiUrl.guestuser, {
      'email': "",
      'first_name': "",
      'last_name': "",
      'phone_number': "",
      'device_token': "",
      'device_id': deviceId,
      'device_type': Platform.isIOS ? "ios" : "Android",
      'user_type': "guest",
    }).then(
      (value) {
        var responseJson = json.decode(value.body);
        print(responseJson);
        ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
        if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
          var token = responseJson["ResponseData"]["token"];
          if (token != false) {
            Preferences.preferences
                .saveBool(key: PrefernceKey.isGuestUser, value: true);
            var user = responseJson["ResponseData"]["user"];

            Preferences.preferences
                .saveString(key: PrefernceKey.loginToken, value: token);

            Preferences.preferences.saveString(
                value: jsonEncode(user), key: PrefernceKey.userData);

            Get.back();
            showTostMessage(message: _responseModel.responseText);
            Get.toNamed('/checkoutProcess');
          } else {
            Get.back();
            Get.toNamed("/guestUserView");
          }
        }

        showLoader.value = false;
      },
    );
  }

  void refreshHomePage() {
    DashBoardController _dashboar = Get.find();
    _dashboar.onInit();
  }

  Future<void> getNotifications() async {
    await NotificationService.getNotifications().then((value) {
      preferences.saveInt(
        key: PrefernceKey.totalNotification,
        value: value.responseData.length,
      );
    });
  }
}
