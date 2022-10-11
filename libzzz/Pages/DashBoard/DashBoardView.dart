import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';
import 'package:reserved4u/Pages/Favourite/FavouriteCell.dart';
import 'DashBoardController.dart';
import 'DropDownSearch.dart';
import 'Widget.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DashBoardView extends StatefulWidget {
  @override
  _DashBoardViewState createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  // var itemSize = Get.height;
  moveUp() {
    _dashBoardController.scrollController.animateTo(0,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  DashBoardController _dashBoardController = Get.put(DashBoardController());

  var arrSort = [
    SortinOptions.aToz,
    SortinOptions.zToa,
  ];
  File imageFile;
  Directory temp;
  getPathFromStorage({var imageUrl}) async {
    if (Platform.isIOS) {
      print('ifs');
      temp = await getApplicationDocumentsDirectory();
    } else {
      print('else');
      temp = await getTemporaryDirectory();
    }
    imageFile = File('${temp.path}/$imageUrl');

    print('imageFile');
    print(imageFile);
    if (await imageFile.exists()) {
      print('ififififif');
    } else {
      print('elseelse');
      await imageFile.create(recursive: true);
    }
  }

  @override
  void initState() {
    _dashBoardController.getAllRestaurantssort();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _dashBoardController.tabController.addListener(() {
      if (_dashBoardController.tabController.index == 0) {
        _dashBoardController.selectedOptions = 'all';
      }
      if (_dashBoardController.tabController.index == 1) {
        _dashBoardController.selectedOptions = 'new';
      }
      if (_dashBoardController.tabController.index == 2) {
        _dashBoardController.selectedOptions = 'recommended';
      }
      if (_dashBoardController.tabController.index == 3) {
        _dashBoardController.selectedOptions = 'top_rated';
      }
      _dashBoardController.getAllRestaurantssort();
    });
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Color(AppColor.logoBgColor),
      ),
    );
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _dashBoardController.fabIconNumber.value = false;
        },
        child: Obx(
          () => Container(
            height: Get.height - 48,
            child: Stack(
              children: [
                NotificationListener<ScrollNotification>(
                  // ignore: missing_return
                  onNotification: (scroll) {
                    _dashBoardController.scrollValue.value =
                        scroll.metrics.pixels;
                    if (scroll.metrics.pixels != 0.0) {
                      _dashBoardController.isScroll.value = true;
                    } else if (scroll.metrics.pixels == 10.0) {
                      _dashBoardController.isScroll.value = false;
                    } else {
                      _dashBoardController.isScroll.value = false;
                    }
                  },
                  child: SmartRefresher(
                    onRefresh: () {
                      _dashBoardController.clearAllDataAndPullToRefresh();
                    },
                    header: ClassicHeader(
                      completeText: 'refreshCompleted'.tr,
                      releaseText: 'releaseToRefresh'.tr,
                      idleText: 'pullDownRefresh'.tr,
                    ),
                    controller: _dashBoardController.refreshController,
                    enablePullDown: true,
                    enablePullUp: false,
                    child: ListView(
                      physics: AlwaysScrollableScrollPhysics(),
                      children: [
                        Stack(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  /*Header part */ Container(
                                    height: 260,
                                    color: Color(AppColor.logoBgColor),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        header(context),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            selectService("orders.png",
                                                "Coming soon", false),
                                            SizedBox(
                                              width: 25,
                                            ),
                                            selectService("delivery.svg",
                                                "Delivery", true),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                  Obx(
                                    () => sortOptionAndswitchContainer(context),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    color: Colors.white,
                                    child: TabBar(
                                      onTap: (ind) {
                                        _dashBoardController
                                            .selectedOptionsInd.value = ind;

                                        if (ind == 0) {
                                          _dashBoardController.selectedOptions =
                                              'all';
                                        }
                                        if (ind == 1) {
                                          _dashBoardController.selectedOptions =
                                              'new';
                                        }
                                        if (ind == 2) {
                                          _dashBoardController.selectedOptions =
                                              'recommended';
                                        }
                                        if (ind == 3) {
                                          _dashBoardController.selectedOptions =
                                              'top_rated';
                                        }
                                        _dashBoardController
                                            .getAllRestaurantssort();
                                      },
                                      controller:
                                          _dashBoardController.tabController,
                                      indicatorColor: Color(AppColor.red),
                                      labelColor: Color(AppColor.red),
                                      unselectedLabelColor: Color(0xFF87878b),
                                      labelPadding: EdgeInsets.all(2),
                                      indicatorPadding:
                                          EdgeInsets.only(left: 8, right: 8),
                                      labelStyle: TextStyle(
                                        fontSize: 12,
                                        fontFamily: AppFont.semiBold,
                                      ),
                                      tabs: [
                                        Tab(
                                          text: 'All'.tr,
                                        ),
                                        Tab(
                                          text: 'New'.tr,
                                        ),
                                        Tab(
                                          text: 'Recommended'.tr,
                                        ),
                                        Tab(
                                          text: 'Top Rated'.tr,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      height: 500.0 *
                                          (_dashBoardController
                                                  .resturantArray.length)
                                              .toDouble(),
                                      width: double.maxFinite,
                                      child: TabBarView(
                                          controller: _dashBoardController
                                              .tabController,
                                          children: [
                                            bottomPart(context),
                                            bottomPart(context),
                                            bottomPart(context),
                                            bottomPart(context),
                                          ])),
                                  Visibility(
                                    visible: !(_dashBoardController
                                        .arrRecommandedBestRated.isEmpty),
                                    child: Container(
                                      color: Color(0xFFf4f4f6).withOpacity(0.6),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Obx(() => VisibilityDetector(
                                key: Key("unique key"),
                                onVisibilityChanged: (VisibilityInfo info) {
                                  _dashBoardController.visibilityInfo.value =
                                      info.visibleFraction;
                                  debugPrint(
                                      "${info.visibleFraction} of my widget is visible");
                                },
                                child: DropDownSearch()))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(() => Visibility(
                      visible: !_dashBoardController.fabIconNumber.value,
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(
                            margin: EdgeInsets.only(bottom: 10, left: 8),
                            child: bottomFloatingOptions()),
                      ),
                    )),
                Obx(
                  () => Visibility(
                    visible: _dashBoardController.isScroll.value,
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 20, right: 10),
                          child: Container(
                            height: 40,
                            width: 40,
                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              onPressed: () {
                                moveUp();
                              },
                              child: Icon(
                                Icons.keyboard_arrow_up_outlined,
                                color: Colors.transparent.withOpacity(0.7),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                Obx(() => CommanWidget(context: context).showlolder(
                    isshowDilog: _dashBoardController.isLoader.value)),
                Positioned(
                  top: -215,
                  left: 10,
                  right: 10,
                  child: Obx(() => _dashBoardController.fabIconNumber.value &&
                          _dashBoardController.visibilityInfo.value < 0.7
                      ? Container(
                          alignment: Alignment.center, child: DropDownSearch())
                      : _dashBoardController.visibilityInfo.value > 0.2
                          ? Container()
                          : Container(
                              alignment: Alignment.center,
                              child: DropDownSearch())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Container(
          margin: EdgeInsets.only(left: 20, bottom: 10),
          // padding: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                AssestPath.favourite + 'Logo_Home.png',
                height: 20,
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, bottom: 10),
          child: Obx(
            () => Text(
              "${_dashBoardController.title.value}" +
                  "\n" +
                  'WhatYouWantToDo'.tr,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontFamily: AppFont.semiBold,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget viewCategory() {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, ind) {
          // var currentObj = _dashBoardController.arrCategory[ind];
          return InkWell(
            onTap: () {
              // var currentObj = _dashBoardController.arrCategory[ind];

              if (_dashBoardController.selectedIndex.value == ind.toString()) {
                _dashBoardController.selectedCategoryName.value = 'all'.tr;
                _dashBoardController.selectedCategoryId.value = "";
                // _dashBoardController.fabIconNumber.value = false;
                _dashBoardController.selectedIndex.value = "";
                _dashBoardController.arrCategoryWiseSubCategory.clear();
                _dashBoardController.arrCategoryWiseSubCategoryString.clear();
                // _dashBoardController.resetAdvanceSerach();
              } else {
                _dashBoardController.fabIconNumber.value = true;
                // _dashBoardController.selectedCategoryName.value =
                //     currentObj.name;
                _dashBoardController.selectedCategoryId.value =
                    // currentObj.id.toString();

                    _dashBoardController.selectedIndex.value = ind.toString();
                // _dashBoardController.getCategoryWiseSubCategory();
              }

              // callAllDataAPIForFilters();
            },
            child: Obx(() => HomeUnits().categoryShell(
                // imgurl: currentObj.categoryImagePath,
                // categoryName: currentObj.name,
                isSelected:
                    ind.toString() == _dashBoardController.selectedIndex.value
                        ? true
                        : false)),
          );
        },
      ),
    );
  }

  Widget newRecomandedBestratedTabs() {
    return Column(
      children: [
        Obx(
          () => sortOptionAndswitchContainer(context),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          color: Colors.white,
          child: TabBar(
            onTap: (ind) {
              _dashBoardController.selectedOptionsInd.value = ind;

              if (ind == 0) {
                _dashBoardController.selectedOptions = 'all';
              }
              if (ind == 1) {
                _dashBoardController.selectedOptions = 'new';
              }
              if (ind == 2) {
                _dashBoardController.selectedOptions = 'recommended';
              }
              if (ind == 3) {
                _dashBoardController.selectedOptions = 'top_rated';
              }
              _dashBoardController.getAllRestaurantssort();
            },
            controller: _dashBoardController.tabController,
            indicatorColor: Color(AppColor.red),
            labelColor: Color(AppColor.red),
            unselectedLabelColor: Color(0xFF87878b),
            labelPadding: EdgeInsets.all(2),
            indicatorPadding: EdgeInsets.only(left: 8, right: 8),
            labelStyle: TextStyle(
              fontSize: 12,
              fontFamily: AppFont.semiBold,
            ),
            tabs: [
              Tab(
                text: 'All'.tr,
              ),
              Tab(
                text: 'New'.tr,
              ),
              Tab(
                text: 'Recommended'.tr,
              ),
              Tab(
                text: 'Top Rated'.tr,
              ),
            ],
          ),
        ),
        SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: TabBarView(
                controller: _dashBoardController.tabController,
                children: [
                  bottomPart(context),
                  bottomPart(context),
                  bottomPart(context),
                  bottomPart(context),
                ]))
      ],
    );
  }

  Widget bottomPart(BuildContext context) {
    return Container(
      child: Obx(() => _dashBoardController.resturantArray.length != 0
          ? bottomStoreList()
          : noDataFound()),
    );
  }

  Widget bottomStoreList() {
    return Container(
        child: Obx(
      () => ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _dashBoardController.resturantArray.length,
          itemBuilder: (context, ind) {
            var currentObj = _dashBoardController.resturantArray[ind];

            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Obx(
                () => FavouriteCell(
                  home: true,
                  model: _dashBoardController.resturantArray[ind],
                  discount: currentObj.discountFlag,
                  isfavourite: currentObj.favourite.value,
                  avgrating: currentObj.avgRating,
                  totalfeedback: currentObj.totalFeedback,
                  isvalue: currentObj.isValue,
                  storename: currentObj.storeName,
                  categoryid: currentObj.categoryName,
                  storeaddress: currentObj.storeAddress,
                  // storecategory: currentObj.storeCategory,
                  storeId: currentObj.id.toString(),
                  controller: _dashBoardController,
                  isFromFav: false,
                  discountValue: currentObj.discount,
                  currentInd: ind,
                  // storeGallery: currentObj.storeGallery,
                ),
              ),
            );
          }),
    ));
  }

  Widget sortOptionAndswitchContainer(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Row(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "All Restaurants",
                        style: TextStyle(
                          fontFamily: AppFont.bold,
                          fontSize: 20,
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(children: [
                          TextSpan(
                            text:
                                "${_dashBoardController.resturantArray.length}",
                            style: TextStyle(
                              color: Color(0xFF5a616b),
                              fontFamily: AppFont.semiBold,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: _dashBoardController.arrStoreList.length > 1
                                ? 'results'.tr
                                : 'result'.tr,
                            style: TextStyle(
                              color: Color(0xFFbec0c4),
                              fontFamily: AppFont.semiBold,
                              fontSize: 12,
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                /*Soritn options*/ Container(
                    height: 30,
                    // width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(
                              8.0) //                 <--- border radius here
                          ),
                      border: Border.all(
                        width: 1.5,
                        color: Color(0xFFe2e3e6),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        showBottomSheetForSortingOptions(context);
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 3,
                          ),
                          Obx(
                            () => Text(
                              _dashBoardController.sortByText.value,
                              style: TextStyle(
                                  fontFamily: AppFont.semiBold, fontSize: 13),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              height: 10,
                              width: 15,
                              child: Image.asset(
                                AssestPath.homeView + "Sort.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 45,
                  width: Get.width,
                  color: Color(0xFFfef4ee),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /*Booking System*/ Container(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Switch(
                              value: _dashBoardController.isBookingSystem.value,
                              activeColor: Color(AppColor.red),
                              inactiveTrackColor: Color(0xFFcfcbca),
                              inactiveThumbColor: Color(0xFF878c93),
                              onChanged: (value) {
                                print(value);
                                _dashBoardController.isBookingSystem.value =
                                    value;
                                _dashBoardController.getAllRestaurantssort();
                              },
                            ),
                            Text(
                              'bookingSystem'.tr,
                              style: TextStyle(
                                  fontSize: 10, fontFamily: AppFont.regular),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 2,
                        color: Color(0xFFe2dbd9),
                        // decoration: BoxDecoration(
                        //     gradient: LinearGradient(
                        //   begin: Alignment.topRight,
                        //   end: Alignment.bottomRight,
                        //   colors: [
                        //     Color(0xffFDF5EF),
                        //     Color(0xffE14942),
                        //     Color(0xffFDF5EF),
                        //   ],
                        // ))
                      ),
                      /*Discount*/ Container(
                        width: 150,
                        child: Row(
                          children: [
                            Switch(
                              value: _dashBoardController.isDiscount.value,
                              activeColor: Color(AppColor.red),
                              inactiveTrackColor: Color(0xFFcfcbca),
                              inactiveThumbColor: Color(0xFF878c93),
                              onChanged: (value) {
                                _dashBoardController.isDiscount.value = value;
                                _dashBoardController.getAllRestaurantssort();
                              },
                            ),
                            Text(
                              'discounts'.tr,
                              style: TextStyle(
                                  fontSize: 10, fontFamily: AppFont.regular),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bottomFloatingOptions() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 17,
      ),
      child: Container(
        height: 40,
        width: Get.width * 0.32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(AppColor.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                // _dashBoardController.getAllRestaurantType();
                Get.toNamed("/filter");
              },
              icon: SvgPicture.asset(
                "assets/images/Booking/" + "filter.svg",
                height: 14,
                width: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Container(
                height: 20,
                width: 1,
                color: Color(0xFFDADADA),
              ),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed("/mapView");
              },
              icon: SvgPicture.asset(
                "assets/images/Booking/" + "map.svg",
                height: 12,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future showBottomSheetForSortingOptions(BuildContext context) {
    return Get.bottomSheet(
      Container(
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              height: 50,
              width: Get.width,
              decoration: BoxDecoration(
                color: Color(AppColor.red).withOpacity(0.3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Center(
                child: Text(
                  'sortBy'.tr,
                  style: TextStyle(
                      fontFamily: AppFont.bold,
                      fontSize: 15,
                      color: Color(AppColor.red)),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  child: ListView.builder(
                      itemCount: _dashBoardController.resturantArray.length,
                      itemBuilder: (context, ind) {
                        return InkWell(
                          onTap: () {
                            clickToBtnSort(ind);
                          },
                          child: Container(
                            height: 30,
                            child: Text(
                              arrSort[ind],
                              style: TextStyle(
                                fontFamily: AppFont.medium,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void clickToBtnSort(int index) {
    print(index);
    print('index');
    var selectedtext = arrSort[index];
    if (selectedtext == SortinOptions.aToz) {
      print('Fatima');
      // _dashBoardController.sortArray1();
      _dashBoardController.sort = "asc";
      _dashBoardController.getAllRestaurantssort();
      _dashBoardController.sortByText.value = "A-Z";
    }

    if (selectedtext == SortinOptions.zToa) {
      // _dashBoardController.sortArray();
      _dashBoardController.sort = "desc";
      _dashBoardController.getAllRestaurantssort();
      print('khadija');
      _dashBoardController.sortByText.value = "Z-A";
    }

    Get.back();
  }

  void callAllDataAPIForFilters() {
    //_dashBoardController.isLoader.value = true;
    // _dashBoardController.getAllDataForDashboard();
  }

  Widget noDataFound() {
    return Container();
  }

  Widget selectService(image, text, selected) {
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(12),
          elevation: selected != true ? 5 : 1,
          child: Container(
            width: 108.86,
            height: 60,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: selected
                ? SvgPicture.asset(AssestPath.dashboard + image)
                : Image.asset(AssestPath.dashboard + image),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(text,
            style: selected == true
                ? TextStyle(
                    fontFamily: AppFont.medium,
                    color: Color(AppColor.red),
                    fontSize: 12)
                : TextStyle(
                    fontFamily: AppFont.semiBold,
                    color: Color(AppColor.greytextColor),
                  ))
      ],
    );
  }
}
