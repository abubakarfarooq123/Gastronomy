import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'NotificatiokKeys.dart';

class CommanWidget {
  CommanWidget({this.context});
  BuildContext context;

  Widget raetingAndReviewRow(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: Get.width,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFffffff),
                      border: Border.all(color: Colors.amber)),
                  child: Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: 20,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFffffff),
                      border: Border.all(color: Colors.amber)),
                  child: Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: 20,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFffffff),
                      border: Border.all(color: Colors.amber)),
                  child: Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: 20,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFffffff),
                      border: Border.all(color: Colors.amber)),
                  child: Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: 20,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFffffff),
                      border: Border.all(color: Colors.grey)),
                  child: Icon(
                    Icons.star_rounded,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '(' + '4.9' + "  " + "Bewerungen" + ')',
            style: TextStyle(
                color: Color(0xFFa3a6ab),
                fontFamily: AppFont.regular,
                fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      toolbarHeight: 0,
    );
  }

  Widget textFeildWithImage(
      {String titleText,
      String hintText,
      String imgUrl,
      TextInputType keyboardType,
      TextEditingController textEditingController,
      double height,
      double width,
      bool isSecure = false,
      int maxLength = 200,
      Function(String value) onChanged,
      FocusNode focusNode,
      VoidCallback onTap,
      bool enable,
      VoidCallback onSubmit,
      List<LengthLimitingTextInputFormatter> inputFormatters}) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: Color(AppColor.textFieldBg),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          SizedBox(width: 20.0),
          Image.asset(
            imgUrl,
            fit: BoxFit.fill,
            height: height,
            width: width,
            color: Colors.black45,
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              onTap: onTap,
              focusNode: focusNode,
              controller: textEditingController,
              keyboardType: keyboardType,
              obscureText: isSecure,
              maxLength: maxLength,
              enabled: enable,
              onFieldSubmitted: (value) => onSubmit(),
              // inputFormatters: <TextInputFormatter>[
              //   FilteringTextInputFormatter.digitsOnly,
              // ],
              style: TextStyle(fontFamily: AppFont.medium, fontSize: 15),
              decoration: InputDecoration(
                hintText: hintText,
                counterText: "",
                border: InputBorder.none,
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
            ),
          ),
        ],
      ),
    );
  }

  Widget loder({bool isshowDilog, bool isScroll}) {
    return Visibility(
      visible: isshowDilog,
      child: Container(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Center(child: CircularProgressIndicator()),
              )
            ],
          )),
    );
  }

  Widget showlolder({bool isshowDilog, int height}) {
    return Visibility(
      visible: isshowDilog,
      child: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                //child: Image.asset("assets/images/loader.gif"),
                child: Lottie.asset("assets/images/Logorevise.json"),
                height: 40.0,
                width: 40.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget backpress() {
    return AlertDialog(
        title: Text(
          'areYouSureWantToQuit'.tr,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: AppFont.regular,
              fontWeight: FontWeight.normal),
        ),
        actions: <Widget>[
          InkWell(
              child: Text(
                'yes'.tr,
                style: TextStyle(
                  color: Color(AppColor.firstColour),
                  fontSize: 18,
                  fontFamily: AppFont.medium,
                ),
              ),
              onTap: () => exit(0)),
          InkWell(
              child: Text(
                'no'.tr,
                style: TextStyle(
                  color: Color(AppColor.firstColour),
                  fontSize: 18,
                  fontFamily: AppFont.medium,
                ),
              ),
              onTap: () => Navigator.of(context).pop(false)),
        ]);
  }
}
