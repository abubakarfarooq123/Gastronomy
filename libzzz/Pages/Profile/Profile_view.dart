import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Pages/Profile/Bookings/bookings_view.dart';
import 'package:reserved4u/Pages/Profile/Profile_Controller.dart';
import 'package:reserved4u/Pages/Profile/Setting/setting_page.dart';
import 'package:reserved4u/Pages/Profile/my_addresses/my_address_home_view.dart';
import 'package:reserved4u/Pages/Profile/vochers/my_voucher_page.dart';
import '../../Helper/NotificatiokKeys.dart';
import '../../Helper/commanWidgets.dart';
import 'Edit_Page.dart';

// ignore: must_be_immutable
class ProfileView extends StatefulWidget {
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController _profileController = Get.put(ProfileController());
  @override
  void initState() {
    // _profileController.checkIfLoginOrNot();
    print("profile view");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: Get.width,
                  color: Color(AppColor.maincategorySelectedColor),
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AssestPath.profile + "Logo_Home.png",
                        height: 30,
                      ),
                      SizedBox(height: 5),
                      myProfileRow(),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
                Obx(() => profileDetails()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed('/bookingView');
                        Get.to(Bookings());
                      },
                      child: ProfileButton(
                        "assets/images/Profile/booking.png",
                        "My Bookings",
                        Color(0xFFE38601),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.to(ChatListPage());
                      },
                      child: ProfileButton("assets/images/Profile/chat.png",
                          "My Message", Color(0xFF10B01A)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(MyAddressHome());
                      },
                      child: ProfileButton("assets/images/Profile/address.png",
                          "My Address", Color(0xFFFA7B86)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(MyVoucherPage());
                      },
                      child: ProfileButton("assets/images/Profile/voucher.png",
                          "My Vouchers", Color(0xFF43BEA0)),
                    ),
                  ],
                ),
              ],
            ),
            Obx(() => CommanWidget(context: context)
                .showlolder(isshowDilog: _profileController.isLoader.value))
          ],
        ),
      ),
    );
  }

  Widget profileDetails() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 185,
      child: Row(children: [
        Expanded(
          flex: 1,
          child: (_profileController.userDataObj.value.userImagePath == null ||
                  _profileController.userDataObj.value.userImagePath.isEmpty)
              ? Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 85,
                  width: 50,
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(left: 25, right: 10, bottom: 20),
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
                )
              : Container(
                  height: 85,
                  width: 50,
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(left: 25, right: 10, bottom: 30),
                  child: CachedNetworkImage(
                    imageUrl:
                        _profileController.userDataObj.value.userImagePath,
                    placeholder: (context, url) => Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF101928),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 3),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/defaultuser.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF101928),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 3),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/defaultuser.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF101928),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 3),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(
              top: 50,
              left: 0,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    _profileController.fnameValue.value +
                        " " +
                        _profileController.lnameValue.value,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(_profileController.emailValue.value,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: " Readex Pro",
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(_profileController.phoneValue.value,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: " Readex Pro",
                      ))
                ]),
          ),
        )
      ]),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/Profile/background.png"))),
    );
  }

//heelloo
  Container ProfileButton(String image, String bottonName, Color color) =>
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            bottonName == "My Message"
                ? Container(
                    width: Get.width * 0.32,
                    height: Get.height * 0.14,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Image.asset(
                        image,
                        // fit: BoxFit.contain,
                        height: 90,
                        width: 90,
                      ),
                    ),
                  )
                : Container(
                    width: Get.width * 0.32,
                    height: Get.height * 0.14,
                    // padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Image.asset(image)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                bottonName,
                style: TextStyle(
                  color: bottonName != "My Message"
                      ? Colors.black
                      : Color(AppColor.maincategoryDisableTextColor),
                ),
              ),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 1.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                1.0, // Move to right 10  horizontally
                2.0, // Move to bottom 10 Vertically
              ),
            )
          ],
          color: Colors.white, //.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFFDADADA), width: 1),
        ),
      );
}

Widget iconButton(
    {page, currentInd, selectedind, String iconImg, String iconName}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 35,
        child: IconButton(
          icon: Image.asset(
            "assets/images/bottomnavbar/$iconImg",
            height: 25,
          ),
          onPressed: () {
            Get.to(page);
          },
        ),
      ),
      Text(
        "$iconName",
        style: TextStyle(
          fontSize: 10,
          //color:
          // currentIndex == currentInd ? Colors.black : Color(0xFF7f848d),
        ),
      ),
    ],
  );
}

Widget myProfileRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'My Profile',
        style: TextStyle(fontFamily: AppFont.bold, fontSize: 22),
      ),
      Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(EditView());
            },
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    AssestPath.profile + "edit.svg",
                    height: 16,
                    width: 16,
                    color: Color(0xff000000),
                  )),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              Get.to(SettingView());
            },
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(AppColor.red),
                  ),
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    AssestPath.profile + "settings.svg",
                    height: 16,
                    width: 16,
                  )),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    ],
  );
}
