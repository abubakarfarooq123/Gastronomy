import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/ResponseModel.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:reserved4u/Helper/preferences.dart';
import 'package:reserved4u/Helper/url.dart';
import 'package:reserved4u/Pages/DashBoard/DashBoardModel.dart';
import 'package:reserved4u/Pages/Profile/Profiile_Model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:reserved4u/Pages/Profile/Setting/SettingController.dart';

class ProfileController extends GetxController {
  BuildContext context;
  var isLoader = false.obs;
  var selectedUserName = "".obs;

  // ignore: deprecated_member_use
  var arrProfile = List<CatgoryData>().obs;
  var selectedUserId = 0.obs;
  var deviceId;
  var userDataObj = User().obs;
  final picker = ImagePicker();
  var isImgaeSelected = false.obs;
  final FocusNode phoneFocus = FocusNode();
  OverlayEntry overlayEntry;

  TextEditingController emailText;
  TextEditingController phnNumber;
  TextEditingController fname;
  TextEditingController lname;
  // String userImage;
  RxString userImage = ''.obs;
  RxString emailValue = ''.obs;
  RxString phoneValue = ''.obs;
  RxString fnameValue = ''.obs;
  RxString lnameValue = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    emailText = TextEditingController();
    phnNumber = TextEditingController();
    fname = TextEditingController();
    lname = TextEditingController();

    checkIfLoginOrNot();
  }

  void checkIfLoginOrNot() async {
    var isLogin = await Preferences.preferences
        .getBool(key: PrefernceKey.isUserLogin, defValue: false);
    print("object" + isLogin.toString());
    if (isLogin) {
      getAllProfileData();
    } else {
      Get.offAllNamed('/login', arguments: true);
    }
  }

  Future<void> getAllProfileData() async {
    isLoader.value = true;
    ApiProvider apiProvider = ApiProvider();

    await apiProvider.getApiCall(ApiUrl.getuserprofile).then((value) {
      var responseJson = json.decode(value.body);
      print('responseJson');
      print(responseJson);

      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        var responsedata = responseJson["ResponseData"];
        var user = responsedata["user"];
        userDataObj.value = User.fromJson(user);
        Preferences.preferences
            .saveString(value: jsonEncode(user), key: PrefernceKey.userData);
        setData();
        setNotificationStatus();
        isLoader.value = false;
      } else {
        isLoader.value = false;
      }
    });
  }

  void setData() {
    fname.text = userDataObj.value.firstName;
    lname.text = userDataObj.value.lastName;
    emailText.text = userDataObj.value.email;
    phnNumber.text = userDataObj.value.phoneNumber;

    userImage = userDataObj.value.userImagePath.obs;
    phoneValue = userDataObj.value.phoneNumber.obs;
    emailValue = userDataObj.value.email.obs;
    lnameValue = userDataObj.value.lastName.obs;
    fnameValue = userDataObj.value.firstName.obs;
  }

  void checkValidation() {
    if (emailText.text.isEmpty) {
      showTostMessage(message: 'tostlastname'.tr);
    } else if (fname.text.isEmpty) {
      showTostMessage(message: 'tostfirstname'.tr);
    } else if (emailText.text.isEmpty) {
      showTostMessage(message: 'tostemail'.tr);
    }
    /*else if (phnNumber.text.length < 11) {
      showTostMessage(message: 'phoneNumberValid'.tr);
    }*/
    else {
      isLoader.value = true;
      sendEditProfileDataToServer();
    }
  }

  void sendEditProfileDataToServer() async {
    ApiProvider apiProvider = ApiProvider();

    var body = {
      'email': emailText.text.trim(),
      'first_name': fname.text.trim(),
      'last_name': lname.text.trim(),
      'phone_number': phnNumber.text.trim(),
    };

    await apiProvider
        .postApiWithImage(
      ApiUrl.updateuserprofile,
      body: body,
      isImage: isImgaeSelected.value,
      profile: "",
    )
        .then((value) {
      var responseJson = json.decode(value.body);
      print(responseJson);
      ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
      if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
        Get.back();
        getAllProfileData();
      }

      showTostMessage(message: _responseModel.responseText);

      isLoader.value = false;
    });
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      uploadImage(File(pickedFile.path));
    } else {
      print('No image selected.');
    }
  }

  Future<void> uploadImage(File file) async {
    isLoader.value = true;
    ApiProvider apiProvider = ApiProvider();
    http.Response response = await apiProvider.postApiWithImage(
      ApiUrl.updateProfilePicture,
      body: {},
      isImage: true,
      profile: file.path,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      if (map['ResponseCode'] == 1) {
        await getAllProfileData();
      } else {
        showTostMessage(message: map['ReponseText']);
      }
    }
    isLoader.value = false;
  }

  Future<void> deleteImage() async {
    isLoader.value = true;
    ApiProvider apiProvider = ApiProvider();

    http.Response response = await apiProvider.post(
      ApiUrl.deleteProfilePicture,
      {'user_id': userDataObj.value.id.toString()},
    );
    print(response);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      if (map['ResponseCode'] == 1) {
        await getAllProfileData();
      } else {
        showTostMessage(message: map['ResponseText']);
      }
    }
    isLoader.value = false;
  }

  showOverlay(BuildContext context) {
    if (overlayEntry != null) return;
    OverlayState overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: 0.0,
          left: 0.0,
          child: doneButton(context));
    });

    overlayState.insert(overlayEntry);
  }

  removeOverlay() {
    if (overlayEntry != null) {
      overlayEntry.remove();
      overlayEntry = null;
    }
  }

  Widget doneButton(context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(top: 0, bottom: 0),
          child: CupertinoButton(
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Text(
              "Done",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setNotificationStatus() {
    SettingController settingController = Get.put(SettingController());
    settingController.isSwitch.value =
        userDataObj.value.allowNotifications == 1 ? true : false;
  }
}
