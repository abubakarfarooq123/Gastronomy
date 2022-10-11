import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../Favourite/favouriteView.dart';
import '../DashBoardView.dart';

class NotificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: bottomnavbar(context),
      body: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Header(
              text: "Notifictions",
            ),
            SizedBox(
              height: 240,
            ),
            Center(
              child: Column(
                children: [
                  Image.asset("assets/images/Favourite/noFav.png"),
                  Text("No Notification Yet!",
                      style: TextStyle(
                        fontFamily: "Readex Pro",
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ))
                ],
              ),
            )
          ]),
    );
  }

  Container ProfileButton(String image, String bottonName, Color color) =>
      Container(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: Colors.black, width: 1),
                ),
                width: 100,
                height: 120,
                child: Image.asset(image)),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(bottonName),
            ),
          ],
        ),
        width: 170,
        height: 192,
        padding: EdgeInsets.only(
          top: 25,
          left: 16,
          // bottom: 30,
          right: 22,
        ),
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

  Container bottomnavbar(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: Get.width,
      height: 80,
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                height: 80,
                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(50),
                    ),
                    color: Color(0xFFf5f7f8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    iconButton(
                        iconImg: "Home2.png",
                        iconName: 'home'.tr,
                        currentInd: 0,
                        selectedind: 0,
                        page: DashBoardView()),
                    iconButton(
                        iconImg: "Fav.png",
                        iconName: 'favourite'.tr,
                        currentInd: 1,
                        selectedind: 1,
                        page: FavouriteView()),
                  ],
                ),
              ),
              Container(
                height: 80,
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(15),
                    ),
                    color: Color(0xFFf5f7f8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      children: [
                        iconButton(
                            iconImg: "Notification.png",
                            iconName: 'notification'.tr,
                            currentInd: 2,
                            selectedind: 2,
                            page: NotificationView()),
                        // Obx(() => Visibility(
                        //       // visible:
                        //       // bottomBarController.notificationBadge.isTrue,
                        //       child: Positioned(
                        //         right: 10,
                        //         top: 20,
                        //         child: Container(
                        //           height: 5,
                        //           width: 5,
                        //           decoration: BoxDecoration(
                        //             shape: BoxShape.circle,
                        //             color: Colors.red,
                        //           ),
                        //         ),
                        //       ),
                        //     )),
                      ],
                    ),
                    // iconButton(
                    //     iconImg: "User.png",
                    //     iconName: 'profile'.tr,
                    //     currentInd: 3,
                    //     selectedind: 3,
                    //     page: Profile()),
                  ],
                ),
              ),
            ],
          ),
          Center(
            heightFactor: 0.5,
            child: Container(
              height: 65,
              width: 65,
              child: FloatingActionButton(
                  backgroundColor: Color(0xFFffffff),
                  child: Center(
                    child: Image.asset(
                      "assets/images/bottomnavbar/LOGO.png",
                      height: 40,
                    ),
                  ),
                  elevation: 1,
                  onPressed: () {
                    // Get.offAllNamed('/selectMainCategory');
                  }),
            ),
          ),
        ],
      ),
    );
  }
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
            // "assets/images/bottomnavbar/User.png",
            "assets/images/bottomnavbar/$iconImg",
            // color: currentIndex == currentInd
            // ? Color(0xFFdb8a8a)
            // : Color(0xFF7f848d),
            height: 25,
          ),
          onPressed: () {
            Get.to(page);
            // selectedIndex(selectedind);
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

//"assests/images/Profile/booking.png"

class Header extends StatelessWidget {
  Header({
    this.text,
    this.iconBackgroundColor,
    // this.iconData,
  });
  final Color iconBackgroundColor;
  final String text;
  //final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: const Color(0xFFFDF5EF),
      width: screenWidth,
      height: 116,
      padding: const EdgeInsets.only(left: 15, top: 45),
      //color: Color("0xFF")
      child: Stack(alignment: AlignmentDirectional.topStart, children: [
        SizedBox(height: screenHeight * 0.35),
        Column(
          children: [
            Image.asset(
              "assets/images/HomeView/logo.png",
              // width: 95,
              // height: 23,
            ),
            SizedBox(height: 10),
            Text(
              "$text",
              style: TextStyle(
                fontFamily: "Campton",
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        // Positioned(
        //   left: 305,
        //   top: 10,
        //   child: Row(
        //     children: [
        //       Container(
        //           height: 40,
        //           decoration: BoxDecoration(
        //             color: Color(0xFFFFFFFFF),
        //             borderRadius: BorderRadius.circular(25),
        //           ),
        //           child: Image.asset("assets/images/Profile/pen.png")),
        //       SizedBox(width: 10),
        //       Container(
        //           height: 40,
        //           decoration: BoxDecoration(
        //             color: Color(0xFFE14942),
        //             borderRadius: BorderRadius.circular(25),
        //           ),
        //           child: Image.asset("assets/images/Profile/setting.png")),
        //     ],
        //   ),
        // ),
      ]),
    );
  }
}
