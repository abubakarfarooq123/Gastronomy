import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/preferences.dart';
import 'package:reserved4u/Pages/DashBoard/DashBoardController.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Helper/url.dart';
import '../DashBoard/Resturant/models/resturant_model.dart';
import '../DashBoard/Resturant/resturant_details_view.dart';
import 'FavController.dart';

// ignore: must_be_immutable
class FavouriteCell extends StatelessWidget {
  ResturantModel model = ResturantModel();
  FavouriteCell({
    this.model,
    Key key,
    this.home,
    // this.urlimg,
    this.storename,
    this.isfavourite,
    this.discount,
    this.avgrating,
    this.totalfeedback,
    this.isvalue,
    this.storeaddress,
    this.categoryid,
    // this.storecategory,
    this.storeId,
    this.isFromFav,
    this.controllerFav,
    this.controller,
    this.currentInd,
    this.discountValue,
    // this.storeGallery,
  }) : super(key: key);

  var urlimg = [
    "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg?w=500",
    "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/2KL6JYQYH4I6REYMIWBYVUGXPI.jpg&w=500",
    "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/2KL6JYQYH4I6REYMIWBYVUGXPI.jpg&w=500"
  ];
  // var urlimg;
  bool home;
  var storename;
  bool isfavourite;
  bool discount;
  var avgrating;
  var totalfeedback;
  var isvalue;
  var storeaddress;
  var categoryid;
  var storeId;
  int currentInd;
  // List<StoreCategory> storecategory;
  var isFromFav = false;
  FavouriteController controllerFav;
  DashBoardController controller;
  var refreshController = RefreshController();

  // var storeGallery = <StoreGallery>[];

  var discountValue;
  var width = Get.width - 30;
  PageController pagecontroll =
      new PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(RestaurantDetailView(
          model: model,
        ));
      },
      child: Material(
        color: Color(0xffF9F9FB),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              2 > 0 ? multipleImageContainer() : gridViewContainer(""),
              gridViewContainerRows(context),
            ]),
            favouriteShellDetailPage(context)
          ],
        ),
      ),
    );
  }

  Widget multipleImageContainer() {
    return Container(
      height: 230,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: pagecontroll,
          itemCount: home
              ? 1
              : model.storeGallery.length == 0
                  ? 2
                  : model.storeGallery.length,
          itemBuilder: (context, ind) {
            return model.storeGallery.length > 0
                ? gridViewContainer(
                    model.storeGallery[ind].storeGalleryImagePath)
                : gridViewContainer(urlimg[ind]);
          }),
    );
  }

  Widget gridViewContainer(String img) {
    // GridView Container
    return Container(
      height: 230,
      width: Get.width - 30,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: CachedNetworkImage(
        imageUrl: img,
        placeholder: (context, url) => Container(
            decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/store_default.png",
            ),
          ),
        )),
        errorWidget: (context, url, error) => Container(
            decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/store_default.png",
            ),
          ),
        )),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

//   ====================================================================================================================//
// // GridView Container Widget
  Padding gridViewContainerRows(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Discount Container And LikeButton
            discountConAndLikeButton(),
            SizedBox(
              height: 140,
            ),
            //  Back And Forward Indicators Row
            Visibility(
              visible: false,
              child: backAndForwardIndicators(),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

// Discount Container And LikeButton
  Row discountConAndLikeButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: model.discountFlag == null ? false : model.discountFlag,
          /*// discount container*/ child: Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            height: 30,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(5),
              color: Color(AppColor.red),
            ),
            child: Center(
              // Text('${model.discount} %',
              child: Text('%', //+ discountValue,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppFont.bold,
                      fontSize: 14)),
            ),
          ),
        ),
        Container(
          height: 40,
          width: 40,
          child: FloatingActionButton(
            heroTag: model.id.toString(),
            onPressed: () async {
              var isLogin = await Preferences.preferences
                  .getBool(key: PrefernceKey.isUserLogin, defValue: false);

              if (isLogin) {
                var url =
                    isfavourite == true ? ApiUrl.removefav : ApiUrl.addFav;
                isFromFav
                    ? print("isFromFav:::::::::$isFromFav")
                    : print("isFromFavElse:::::::::$isFromFav");
                print("urls:::::::::$url");

                isFromFav
                    ? controllerFav.doFavouriteFromServer(storeId, url)
                    : controller.doFavouriteFromServer(
                        storeId, url, currentInd);
              } else {
                Get.toNamed("/login", arguments: true);
              }
            },
            // onPressed: () async {
            //   var isLogin = await Preferences.preferences
            //       .getBool(key: PrefernceKey.isUserLogin, defValue: false);
            //   print("login::::::::::::::::::::$isLogin");

            //   if (isLogin) {
            //     // var url =
            //     //     isfavourite == true ? ApiUrl.removefav : ApiUrl.addFav;
            //     // print("URL Value::::::::::::::::::::$url");
            //     print("StoreId::::::::::::::::::::${storeId}");
            //     print("current Index:::::::::::::$currentInd");

            //     print("model.favourite");
            //     if (isfavourite == true) {
            //       // refreshController.refreshCompleted();

            //       Get.find<DashBoardController>().removeToFavorite(storeId);
            //     } else {
            //       Get.find<DashBoardController>().addToFavorite(storeId);
            //     }

            // ? controllerFav.doFavouriteFromServer(storeId, url)
            // : controller.doFavouriteFromServer(
            //     storeId, url, currentInd);
            // } else {
            //   Get.toNamed("/login", arguments: true);
            // }
            //  },
            backgroundColor: Color(AppColor.scaffoldbgcolor),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: isfavourite
                    ? SvgPicture.asset(
                        AssestPath.favourite + 'Favourite.svg',
                      )
                    : Image.asset(AssestPath.favourite + 'unFavourite.png')),
          ),
        )
      ],
    );
  }

//  Back And Forward Indicators Row
  Row backAndForwardIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            if (pagecontroll.page != 0) {
              pagecontroll.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.linearToEaseOut);
            }
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black45),
            child: Icon(
              Icons.arrow_back_ios_outlined,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
        // bottomPager(),
        GestureDetector(
          onTap: () {
            if (pagecontroll.page != 0 - 1) {
              pagecontroll.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            }
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black45),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
  // ====================================================================================================================//

// FavouriteShell Name Address etc.. DetailPage
  Widget favouriteShellDetailPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          shopNameRow(),
          SizedBox(
            height: 5,
          ),
          // Rateting And Review Row
          raetingAndReviewRow(context),
          SizedBox(
            height: 15,
          ),
          // Shop Name Row

          // AddressRow
          addressRow(),
          SizedBox(
            height: 8,
          ),
          // Cosmatics Items Name
          cosmaticsItemsName(),
          SizedBox(
            height: 8,
          ),
          timeToPrepare(),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 38,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: model.storeCategory.length,
                itemBuilder: (context, ind) {
                  // List View Builder Container
                  return listViewBuilderContainer(
                      model.storeCategory[ind].name);
                  //return Text("hejh");
                }),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Color(0xFFcfd1d4),
          )
        ],
      ),
    );
  }

  // Rateting And Review Row
  Widget raetingAndReviewRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              margin: EdgeInsets.only(
                left: 3,
                right: 0,
              ),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(10),
              //   color: Color(0xFFffffff),
              // ),
              child: RatingBar.builder(
                initialRating: double.parse(model.avgRating),
                ignoreGestures: true,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                glowColor: Colors.white,
                itemSize: 25,
                unratedColor: Color(0xFFdadbde),
                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.amberAccent, width: 1.5)),
                    child: Image.asset(
                      AssestPath.homeView + "Star.png",
                      height: 10,
                      width: 10,
                    ),
                  );
                },
                onRatingUpdate: null,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '(' +
                '${model.avgRating}' +
                " | " +
                "${model.totalFeedback}" +
                ') Ratings',
            style: TextStyle(
                color: Color(0xFFa3a6ab),
                fontFamily: AppFont.regular,
                fontSize: 12),
          ),
          Spacer(),
        ],
      ),
    );
  }

// Shop Name Row
  Widget shopNameRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(model.storeName,
            style: TextStyle(
                color: Color(0xFF455A64),
                fontSize: 20,
                fontFamily: AppFont.bold,
                fontWeight: FontWeight.w600)),
        Text(model.isValue,
            style: TextStyle(
                color: Color(0xFF455A64),
                fontSize: 20,
                fontFamily: AppFont.semiBold,
                fontWeight: FontWeight.w600)),
      ],
    );
  }

// AddressRow
  Row addressRow() {
    return Row(children: [
      Image.asset(AssestPath.favourite + 'pin.png',
          height: 18, color: Color(0xFFA4A5A7)),
      SizedBox(
        width: 5,
      ),
      Expanded(
        child: Text(model.storeAddress,
            style: TextStyle(
              color: Color(0xFFA4A5A7),
              fontFamily: AppFont.regular,
              fontSize: 13,
            )),
      ),
    ]);
  }

// Cosmatics Items Name
  Row cosmaticsItemsName() {
    return Row(
      children: [
        SvgPicture.asset(
          AssestPath.favourite + 'for.svg',
          height: 18,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          model.categoryId,
          style: TextStyle(
              fontFamily: AppFont.semiBold,
              fontSize: 13,
              color: Color(AppColor.red)),
        )
      ],
    );
  }

  Row timeToPrepare() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(AssestPath.favourite + "clock.svg",
                height: 16, color: Color(0xff263238)),
            SizedBox(
              width: 5,
            ),
            Text(
              model.storeMinDeliveryTime != null
                  ? "  ${model.storeMinDeliveryTime} - ${int.parse(model.storeMinDeliveryTime) + 10} min"
                  : "N/A",
              style: TextStyle(
                  fontFamily: AppFont.regular,
                  fontSize: 13,
                  color: Color(0xff263238)),
            )
          ],
        ),
        Row(
          children: [
            Image.asset(AssestPath.favourite + "cart.png",
                height: 16, color: Color(0xff263238)),
            SizedBox(
              width: 5,
            ),
            Text(
              "  ${model.storeMinOrderAmount}.00 €",
              style: TextStyle(
                  fontFamily: AppFont.regular,
                  fontSize: 13,
                  color: Color(0xff263238)),
            )
          ],
        ),
        Row(
          children: [
            SvgPicture.asset(AssestPath.favourite + "scoterImg.svg",
                height: 16, color: Color(0xff263238)),
            SizedBox(
              width: 5,
            ),
            Text(
              "  ${model.storeDeliveryCost}.00 €",
              style: TextStyle(
                fontFamily: AppFont.regular,
                fontSize: 13,
                color: Color(0xff263238),
              ),
            )
          ],
        ),
      ],
    );
  }

// List View Builder Container
  Container listViewBuilderContainer(text) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      height: 38,
      padding: EdgeInsets.symmetric(horizontal: 9),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(0xffffffff)),
      child: Text(
        '$text',
        style: TextStyle(
            fontFamily: AppFont.regular,
            color: Color(0xFF6c717b),
            fontSize: 13),
      ),
    );
  }
  // ====================================================================================================================//

  Widget bottomPager() {
    return Container(
      height: 20,
      //width: Get.width * 0.3,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: SmoothPageIndicator(
          controller: pagecontroll,
          count: 2,
          effect: ScrollingDotsEffect(
            activeStrokeWidth: 1.3,
            activeDotScale: 1.6,

            dotHeight: 8,
            dotWidth: 8,
            fixedCenter: true,
            // strokeWidth: 0.2,
            dotColor: Color(0xFFcfccc9),
            activeDotColor: Colors.white,
            spacing: 8,
          )),
    );
  }
}
