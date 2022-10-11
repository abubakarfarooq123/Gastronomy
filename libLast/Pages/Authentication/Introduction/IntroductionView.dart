import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class IntroductionView extends StatelessWidget {
  PageController pagecontroll =
      new PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent));

    return Scaffold(
      backgroundColor: Color(AppColor.scaffoldbgcolor),
      body: Container(
        child: Column(
          children: [
            pageViewContianer(),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                children: [
                  bottomPager(),
                  Spacer(),
                  bottomButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return Stack(
      children: [
        pageViewContianer(),
        Positioned(
          child: Container(
            // height: 100,
            child: Row(
              children: [
                bottomPager(),
                Spacer(),
                bottomButton(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget pageViewContianer() {
    return Container(
      height: Get.height * 0.8,
      // width: Get.width,
      child: PageView(
        controller: pagecontroll,
        children: [
          pageView('introduction1Title'.tr, 'introduction1Description'.tr,
              "assets/images/_onBording/onboard.png"),
          pageView('introduction2Title'.tr, 'introduction2Description'.tr,
              "assets/abc.png"),
          pageView(
            'introduction3Title'.tr,
            'introduction3Description'.tr,
            "assets/abcd.png",
          ),
        ],
      ),
    );
  }

  Widget pageView(String text, String text2, String imgurl) {
    return Container(
      width: Get.width,
      //  padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: text == "Book Service At\nAny Time & Date"
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              // imgurl == "assets/images/_onBording/onboard.png"
              //     ?
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 10),
                child: Image.asset(
                  imgurl,
                  fit: BoxFit.cover,
                  width: Get.width,
                  height: Get.height / 1.85,
                ),
              )
              // : Container(
              //     alignment: Alignment.centerLeft,
              //     child: SvgPicture.asset(
              //       imgurl,
              //       fit: BoxFit.cover,
              //       width: Get.width,
              //       height: Get.height / 1.85,
              //     ),
              //   ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 40, 0),
            child: Text(
              text,
              style: TextStyle(fontSize: 25, fontFamily: AppFont.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 40, 0),
            child: Text(
              text2,
              style: TextStyle(
                  color: Color(0xffa3a7ac),
                  fontSize: 16,
                  fontFamily: AppFont.regular),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomPager() {
    return Container(
      child: SmoothPageIndicator(
        controller: pagecontroll,
        count: 3,
        effect: ExpandingDotsEffect(
          dotHeight: 6,
          dotWidth: 10,
          activeDotColor: Colors.red,
        ),
      ),
    );
  }

  Widget bottomButton() {
    return Container(
      height: 45,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.red,
      ),
      child: InkWell(
        onTap: () {
          if (pagecontroll.page == 2) {
            Preferences.preferences.saveBool(
                key: PrefernceKey.isIntroductionScreenLoaded, value: true);
            Get.offNamed('/selectMainCategory');

            // Login page
          } else {
            //updateLocal();
            pagecontroll.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.decelerate);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'nextbtn'.tr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: AppFont.regular,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
