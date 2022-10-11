import 'dart:io';

import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';
import 'package:reserved4u/Pages/Profile/Profile_Controller.dart';

// ignore: must_be_immutable
class EditView extends StatefulWidget {
  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  ProfileController _profileController = Get.find();

  bool phoneIsFocus = false;

  @override
  void initState() {
    _profileController.phoneFocus.addListener(() {
      if (Platform.isIOS) {
        phoneIsFocus = _profileController.phoneFocus.hasFocus;
        if (phoneIsFocus)
          _profileController.showOverlay(context);
        else
          _profileController.removeOverlay();
        if (mounted) {
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Scaffold(
        bottomNavigationBar: editProfileBottom(),
        backgroundColor: Color(AppColor.bgColor),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    editHeader(),
                    InkWell(
                      onTap: () {
                        _profileController.getImage();
                      },
                      child: editprofile(),
                    ),
                    SizedBox(height: 30),
                    editProfileMiddle(context),
                  ],
                ),
                Obx(() => CommanWidget(context: context).showlolder(
                    isshowDilog: _profileController.isLoader.value)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget editHeader() {
    return AppBar(
      backgroundColor: Color(AppColor.bgColor),
      elevation: 1,
      title: Text(
        'editProfile'.tr,
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontFamily: AppFont.medium),
      ),
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(12, 2, 0, 12),
        child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(boxShadow: [
              const BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  offset: Offset(1, 1),
                  blurRadius: 7)
            ], color: Colors.white, borderRadius: BorderRadius.circular(100)),
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
    );
  }

  Widget editprofile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Obx(
              () => _profileController.userDataObj.value.userImagePath != null
                  ? selectedImageFromAPI()
                  : notSelectedImageInProfile(),
            ),
            Positioned(
              bottom: 10,
              left: 20,
              child: InkWell(
                onTap: _profileController.deleteImage,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.8)),
                  child: Icon(
                    Icons.delete,
                    size: 15,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 140, left: 115),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(1, 2),
                        blurRadius: 5)
                  ]),
              child: IconButton(
                onPressed: _profileController.getImage,
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /*Widget selectedImage() {
    return Container(
      margin: EdgeInsets.only(top: 35),
      height: 150,
      width: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(75),
        child: Image.file(
          _profileController.image.value,
          fit: BoxFit.cover,
        ),
      ),
    );
  }*/
  Widget notSelectedImageInProfile() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(75),
      child: Container(
        padding: EdgeInsets.only(top: 35),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.white, width: 3),
            color: Colors.black),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            _profileController.userDataObj.value.userName,
            style: TextStyle(
                color: Color(0xFFFABA5F),
                fontFamily: AppFont.medium,
                fontSize: Get.height * 0.04),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget selectedImageFromAPI() {
    return Container(
      margin: EdgeInsets.only(top: 35),
      height: 150,
      width: 150,
      child: CachedNetworkImage(
        imageUrl: _profileController.userDataObj.value.userImagePath,
        placeholder: (context, url) => ClipRRect(
          borderRadius: BorderRadius.circular(75),
          child: Image.asset(
            "assets/images/defaultuser.png",
          ),
        ),
        errorWidget: (context, url, error) => ClipRRect(
          borderRadius: BorderRadius.circular(75),
          child: Container(
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white, width: 3),
                color: Colors.black),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                _profileController.userDataObj.value.userName,
                style: TextStyle(
                    color: Color(0xFFFABA5F),
                    fontFamily: AppFont.medium,
                    fontSize: Get.height * 0.04),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            color: Color(0xFF101928),
            borderRadius: BorderRadius.circular(75),
            border: Border.all(color: Colors.white, width: 2),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget editProfileMiddle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: Get.width * 0.45,
                decoration: BoxDecoration(
                    color: Color(0xFFf9f9fb),
                    borderRadius: BorderRadius.circular(15)),
                child: CommanWidget(context: context).textFeildWithImage(
                    hintText: 'firstnamehint'.tr,
                    imgUrl: AssestPath.login + "User.png",
                    keyboardType: TextInputType.emailAddress,
                    textEditingController: _profileController.fname,
                    height: 20,
                    width: 18),
              ),
              SizedBox(width: 5),
              Container(
                height: 60,
                width: Get.width * 0.45,
                decoration: BoxDecoration(
                    color: Color(0xFFf9f9fb),
                    borderRadius: BorderRadius.circular(15)),
                child: CommanWidget(context: context).textFeildWithImage(
                    hintText: 'lastnamehint'.tr,
                    imgUrl: AssestPath.login + "User.png",
                    keyboardType: TextInputType.text,
                    textEditingController: _profileController.lname,
                    height: 20,
                    width: 18),
              ),
            ],
          ),
          SizedBox(height: 8),
          Container(
            height: 60,
            width: Get.width,
            decoration: BoxDecoration(
                color: Color(0xFFf9f9fb),
                borderRadius: BorderRadius.circular(15)),
            child: CommanWidget(context: context).textFeildWithImage(
                hintText: 'email'.tr,
                imgUrl: AssestPath.login + "Email.png",
                keyboardType: TextInputType.emailAddress,
                textEditingController: _profileController.emailText,
                height: 20,
                width: 20),
          ),
          SizedBox(height: 8),
          Container(
            height: 60,
            width: Get.width,
            decoration: BoxDecoration(
                color: Color(0xFFf9f9fb),
                borderRadius: BorderRadius.circular(15)),
            child: textFeildWithImagePhoneNumber(
              hintText: 'phonehint'.tr,
              imgUrl: AssestPath.login + "Call1.png",
              keyboardType: TextInputType.phone,
              textEditingController: _profileController.phnNumber,
              maxLength: 13,
              height: 20,
              width: 18,
              focusNode: _profileController.phoneFocus,
            ),
          ),
          SizedBox(height: phoneIsFocus ? 65 : 0),
        ],
      ),
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
    FocusNode focusNode,
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
              focusNode: focusNode,
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

  Widget editProfileBottom() {
    return InkWell(
      onTap: () {
        _profileController.checkValidation();
      },
      child: Container(
        height: 90,
        width: Get.width,
        child: Center(
            child: Text(
          'updatebtn'.tr,
          style: TextStyle(
              fontSize: 19, fontFamily: AppFont.medium, color: Colors.white),
        )),
        decoration: BoxDecoration(
          color: Color(AppColor.maincategorySelectedTextColor),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
      ),
    );
  }
}
