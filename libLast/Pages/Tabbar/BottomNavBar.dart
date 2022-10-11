import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Pages/DashBoard/DashBoardController.dart';
import 'package:reserved4u/Pages/DashBoard/DashBoardView.dart';
import 'package:reserved4u/Pages/Favourite/favouriteView.dart';
import 'package:reserved4u/Pages/Notification/notification_view.dart';
import 'package:reserved4u/Pages/Profile/Profile_view.dart';
import 'package:reserved4u/Pages/Tabbar/bottombar_controller.dart';

import 'custom_shape.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  int pageIndex;

  BottomNavBar({this.pageIndex});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var currentIndex = 0;

  selectedIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    // Get.find<DashBoardController>().refreshController=RefreshController();
    if (widget.pageIndex != null) {
      currentIndex = widget.pageIndex;
      setState(() {});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Color(AppColor.lightpink),

          // Status bar brightness (optional)
        ),
        toolbarHeight: 0,
        elevation: 0,
      ),
      // backgroundColor: Color(AppColor.scaffoldbgcolor),
      bottomNavigationBar: bottomnavbar(context),
      body: Stack(
        children: [
          if (currentIndex == 0)
            DashBoardView()
          else if (currentIndex == 1)
            FavouriteView()
          else if (currentIndex == 2)
            NotificationView()
          else
            ProfileView()
        ],
      ),
    );
  }

  Container bottomnavbar(BuildContext context) {
    return Container(
      color: Colors.white,
      width: Get.width,
      height: 80,
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: Get.width,
                color: Colors.transparent,
                height: 80,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(Get.width, 80),
                      painter: RPSCustomPainter(),
                    ),
                    Center(
                      heightFactor: 0.2,
                      child: Container(
                        height: 65,
                        width: 65,
                        child: FloatingActionButton(
                            backgroundColor: Color(0xFFffffff),
                            child: Center(
                              child: Image.asset(
                                AssestPath.bottomnavbar + "LOGO.png",
                                height: 40,
                              ),
                            ),
                            elevation: 1,
                            onPressed: () {
                              Get.offAllNamed('/selectMainCategory');
                            }),
                      ),
                    ),
                    Container(
                      width: Get.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: Get.width * 0.2,
                                child: iconButton(
                                  iconImg: "Home2.png",
                                  iconName: 'home'.tr,
                                  currentInd: 0,
                                  selectedind: 0,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.2,
                                child: iconButton(
                                  iconImg: "Fav.png",
                                  iconName: 'favourite'.tr,
                                  currentInd: 1,
                                  selectedind: 1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: Get.width * 0.2,
                                child: iconButton(
                                  iconImg: "Notification.png",
                                  iconName: 'notification'.tr,
                                  currentInd: 2,
                                  selectedind: 2,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.2,
                                child: iconButton(
                                  iconImg: "User.png",
                                  iconName: 'profile'.tr,
                                  currentInd: 3,
                                  selectedind: 3,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
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
              AssestPath.bottomnavbar + "$iconImg",
              color: currentIndex == currentInd
                  ? Color(AppColor.red)
                  : Color(0xFF7f848d),
              height: 25,
            ),
            onPressed: () {
              selectedIndex(selectedind);
            },
          ),
        ),
        Text(
          "$iconName",
          style: TextStyle(
            fontSize: 10,
            color:
                currentIndex == currentInd ? Colors.black : Color(0xFF7f848d),
          ),
        ),
      ],
    );
  }
}
