import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/models/restaurant_typeModel.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/models/resturant_model.dart';
import 'package:reserved4u/Pages/Favourite/FavController.dart';
import 'package:reserved4u/Pages/Favourite/FavouriteCell.dart';

import '../../Helper/NotificatiokKeys.dart';
import '../../Helper/commanWidgets.dart';
import '../DashBoard/DashBoardController.dart';
import '../Profile/Profile_Controller.dart';

class FavouriteView extends StatefulWidget {
  FavouriteView({Key key}) : super(key: key);

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  static FavouriteController _favouriteViewController =
      Get.put(FavouriteController());

  @override
  void initState() {
    super.initState();
    _favouriteViewController.getFavList();
    _favouriteViewController.checkIfLoginOrNot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SmartRefresher(
            controller: _favouriteViewController.refreshController,
            enablePullDown: true,
            header: ClassicHeader(
              completeText: 'refreshCompleted'.tr,
              releaseText: 'releaseToRefresh'.tr,
              idleText: 'pullDownRefresh'.tr,
            ),
            onRefresh: () async {
              _favouriteViewController.getFavList();
            },
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(children: [
                    Container(
                        margin: EdgeInsets.only(top: 210),
                        padding: const EdgeInsets.all(15),
                        child: Obx(() => _favouriteViewController.isLoader ==
                                true
                            ? CommanWidget().showlolder(
                                isshowDilog:
                                    _favouriteViewController.isLoader.value,
                                height: 0)
                            : _favouriteViewController.resturantArray.length ==
                                    0
                                ? Container(
                                    margin: EdgeInsets.only(top: 70, right: 20),
                                    child: Column(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.center,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: SvgPicture.asset(
                                            AssestPath.noFavourites +
                                                'nofavourites.svg',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Text(
                                            "No favorites yet!",
                                            style: TextStyle(
                                                color: Color(0xFF7B7B7B),
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                //  Container(
                                //     padding: EdgeInsets.all(10),
                                //     height: Get.height * 0.7,
                                //     child: Center(
                                //       child: Text(
                                //         'nostore'.tr,
                                //         style: TextStyle(
                                //             fontSize: 30,
                                //             fontFamily: AppFont.bold,
                                //             color: Colors.black),
                                //       ),
                                //     ),
                                //   )
                                : ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    itemCount: _favouriteViewController
                                        .resturantArray.length,
                                    itemBuilder: (context, index) {
                                      var currentObj = _favouriteViewController
                                          .resturantArray[index];
                                      return FavouriteCell(
                                        home: false,
                                        model: _favouriteViewController
                                            .resturantArray[index],
                                        // urlimg:
                                        //     currentObj.storeBannerImagePath,
                                        discount:
                                            currentObj.discountFlag == null
                                                ? false
                                                : currentObj.discountFlag,
                                        isfavourite: true,
                                        avgrating: currentObj.avgRating,
                                        totalfeedback: currentObj.totalFeedback,
                                        isvalue: currentObj.isValue,
                                        storename: currentObj.storeName,
                                        categoryid: currentObj.categoryName,
                                        storeaddress: currentObj.storeAddress,
                                        // storecategory:
                                        //     currentObj.storeCategory,
                                        storeId: currentObj.id.toString(),
                                        discountValue: currentObj.discount,
                                        isFromFav: true,
                                        controllerFav: _favouriteViewController,
                                        currentInd: index,
                                        // storeGallery:
                                        //     currentObj.storeGallery,
                                      );
                                    })))
                  ]),
                ),
                Container(
                  height: 220,
                  color: Colors.white,
                ),
                buildLogo(context),
                Positioned(
                  top: 187,
                  left: Get.width * 0.22,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red, width: 7)),
                  ),
                ),
                Positioned(
                  top: 187,
                  left: Get.width * 0.69,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 1)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Container buildLogo(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 0, top: 0, bottom: 0),
    padding: EdgeInsets.only(
      left: 20,
    ),
    width: double.infinity,
    height: 199,
    color: Color(AppColor.logoBgColor),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AssestPath.favourite + 'Logo_Home.png',
              height: 20,
              width: 100,
              fit: BoxFit.fitWidth,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Favourites".tr,
              style: TextStyle(fontSize: 22, fontFamily: AppFont.bold),
            )
          ],
        ),
        Container(
          color: Color(AppColor.lightpink),
          height: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    AssestPath.favourite + "fav1.png",
                    width: 110,
                    height: 150,
                  )),
              // Container(
              //   height: 100,
              //   width: 2,
              //   color: Colors.red,
              // ),
              Container(
                height: 100,
                width: 2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(AppColor.red).withOpacity(0.1),
                      Color(AppColor.red),
                      Color(AppColor.red).withOpacity(0.1)
                    ])),
              ),
              Container(
                  // foregroundDecoration: BoxDecoration(
                  //   color: Colors.grey,
                  //   backgroundBlendMode: BlendMode.saturation,
                  // ),
                  // decoration: BoxDecoration(color: Color(AppColor.lightpink)),
                  // alignment: Alignment.topCenter,
                  // color: Colors.red,
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  AssestPath.favourite + "fav2_bw.png",
                  width: 130,
                  height: 90,
                ),
              )),
            ],
          ),
        ),
      ],
    ),
  );
}
