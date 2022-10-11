import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';

class CancelPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      child: Scaffold(
        appBar: cancelpolicyHeader(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${'tltr'.tr}: ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5E5E5E),
                          ),
                        ),
                        TextSpan(
                          text: 'theBookingCanBeCanceledEtc'.tr,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF5E5E5E),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  decoratedText(1, "asProvidedInClauseEtc".tr),
                  SizedBox(height: 15),
                  decoratedText(2, "weProvideTheServiceEtc".tr),
                  SizedBox(height: 15),
                  decoratedText(3, "weDoNotGuaranteeThatEtc".tr),
                  SizedBox(height: 15),
                  decoratedText(4, "weAlwaysTryToEnsureEtc".tr),
                  SizedBox(height: 15),
                  decoratedText(5, "weDoNotAssumeAnyEtc".tr),
                  SizedBox(height: 15),
                  decoratedText(6, "weAreNotLiableForTheEtc".tr),
                  SizedBox(height: 15),
                  decoratedText(7, "pleaseNoteThatWeMakeEtc".tr),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar cancelpolicyHeader() {
    return AppBar(
      backgroundColor: Color(AppColor.bgColor),
      elevation: 1,
      title: Text(
        'Policy'.tr,
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
  Widget decoratedText(int pointNum, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 8),
        Text(
          "$pointNum. ",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF5E5E5E),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF5E5E5E),
            ),
          ),
        ),
      ],
    );
  }
}
