import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/widgets/Bewtungen_widgets/bewtungen_widgets.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/widgets/menu.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/widgets/portflio_tab_widgets/portfolio_tab_widgets.dart';
import 'package:reserved4u/Pages/DashBoard/checkout/controllers/cart_controller.dart';
import 'package:reserved4u/global_variables/global_variables.dart';
import '../../../Helper/commanWidgets.dart';
import '../Resturant/resturant_detail_controller.dart';
import '../checkout/views/cart_page.dart';
import 'models/resturant_model.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class RestaurantDetailView extends StatefulWidget {
  RestaurantDetailView({Key key, @required this.model}) : super(key: key);
  final ResturantModel model;

  @override
  State<RestaurantDetailView> createState() => _RestaurantDetailViewState();
}

class _RestaurantDetailViewState extends State<RestaurantDetailView> {
  ResturantController ctr;
  CartController cartController;

  final List tabName = ['Menu', 'General'.tr, 'Portfolio', 'Feedback'.tr];

  void setdata() async {
    ctr = Get.put(ResturantController());
    cartController = Get.put(CartController());

    ctr.isLoader.value = true;
    ctr.getRestaurantMenu(storeID: widget.model.id.toString());
    await ctr.getRestuarantDetails(widget.model.id.toString());
    await ctr.isOpen();
    await ctr.getResturantReviews(id: widget.model.id.toString());
    await ctr.getSubcategoryByCategoryID(
        storeID: widget.model.id.toString(),
        categoryID: ctr.selectedCategoryID.value.toString());
    await ctr.getRestaurantMenuList(
        storeID: widget.model.id.toString(),
        categoryID: ctr.selectedCategoryID.value.toString(),
        subCategoryID: ctr.selectedSubCategoryID.value.toString());

    ctr.isLoader.value = false;
  }

  @override
  void initState() {
    super.initState();
    setdata();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ctr.isLoader == false
          ? Scaffold(
              appBar: AppBar(
                toolbarHeight: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    statusBarIconBrightness: Brightness.light),
                elevation: 0,
              ),
              bottomSheet: Obx(() => ctr.selectedTabName.value == "Menu"
                  ? GestureDetector(
                      onTap: () {
                        ctr.selectedStore.value = widget.model.storeName;
                        deliveryCharges.value = double.parse(
                            widget.model.storeDeliveryCost.toString());
                        Get.find<CartController>().onAddToCardButtonClick();
                      },
                      child: Material(
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(AppColor.red),
                              borderRadius: BorderRadius.circular(12)),
                          margin: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          height: 50,
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Obx(() => Text(
                                      Get.find<CartController>()
                                          .cartList
                                          .length
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                              Text(
                                "Warenkorb ansehen",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${totalPrice.value}€",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox()),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 410,
                    child: Stack(children: [
                      SizedBox(height: 340, child: multipleImageContainer()),
                      Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 42,
                                  height: 42,
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 15),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x19000000),
                                        blurRadius: 20,
                                        offset: Offset(0, 8),
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  child: const Center(
                                      child: Icon(Icons.arrow_back_ios)),
                                ),
                              ),
                              Row(
                                children: List.generate(
                                    ctr.resturantDetails.value.storeGallery
                                                .length !=
                                            0
                                        ? ctr.resturantDetails.value
                                            .storeGallery.length
                                        : urlimg.length,
                                    (index) => index == 0
                                        ? Container(
                                            width: 30,
                                            height: 10,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2),
                                            margin:
                                                const EdgeInsets.only(right: 6),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                color: Colors.white),
                                          )
                                        : Opacity(
                                            opacity: 0.60,
                                            child: Container(
                                              width: 12,
                                              height: 6,
                                              margin: const EdgeInsets.only(
                                                  right: 6),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                              ),
                                            ),
                                          )),
                              ),
                              InkWell(
                                onTap: () {
                                  // ctr.refreshHomePage();
                                  ctr.checkIfLoginOrNot();
                                  // ctr.refreshHomePage();
                                },
                                child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(21)),
                                    child: Obx(
                                      () => Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: ctr.resturantDetails.value
                                                  .favourite.value
                                              ? SvgPicture.asset(
                                                  AssestPath.favourite +
                                                      'Favourite.svg',
                                                )
                                              : Image.asset(
                                                  AssestPath.favourite +
                                                      'unFavourite.png')),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 124,
                            height: 124,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(62),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x26000000),
                                  blurRadius: 20,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: ctr.resturantDetails.value
                                          .storeProfileImagePath !=
                                      null
                                  ? Image.network(
                                      ctr.resturantDetails.value
                                          .storeProfileImagePath,
                                    )
                                  : Image.asset(
                                      "assets/images/onboarding/background_img.png",
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            // child: const FlutterLogo(size: 124),
                          ),
                        ),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Text(
                    toBeginningOfSentenceCase(widget.model.storeName),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontFamily: AppFont.bold,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    widget.model.storeAddress,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff455a64),
                      fontSize: 14,
                      fontFamily: "Campton",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 3,
                        right: 0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFffffff),
                      ),
                      child: RatingBar.builder(
                        initialRating: double.parse(widget.model.avgRating),
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
                                border: Border.all(
                                    color: Colors.amberAccent, width: 1.5)),
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

                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                          text: '( ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                          text: '${widget.model.avgRating}',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xfffcbe56)),
                        ),
                        TextSpan(
                          text: ' | ${widget.model.totalFeedback} ) Reviews',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ])),
                  const SizedBox(
                    height: 10,
                  ),
                  ctr.startTime.value != '' || ctr.startTime.value != null
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 207,
                                height: 42,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: const Color(0xff7b7b7b),
                                    width: 1,
                                  ),
                                  color: Colors.white,
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Icon(
                                          Icons.access_time,
                                          color: Color(0xff455a64),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Obx(() => Text(
                                            // "gee",
                                            "Do (${ctr.startTime.value} - ${ctr.endTime.value})",
                                            textAlign: TextAlign.center,

                                            style: TextStyle(
                                              color: Color(0xff455a64),
                                              fontSize: 15,
                                              fontFamily: "Campton",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                    ])),
                            const SizedBox(width: 10),
                            Container(
                              width: 126,
                              height: 42,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: const Color(0xff008108),
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.only(top: 10),
                              child: const Text(
                                "Open",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff008108),
                                  fontSize: 15,
                                  fontFamily: "Campton",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(
                          width: 126,
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Color(AppColor.red),
                              width: 1,
                            ),
                          ),
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "Close",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(AppColor.red),
                              fontSize: 15,
                              fontFamily: "Campton",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.white, Color(0xff9e9e9e), Colors.white],
                    )),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  SizedBox(
                    height: 44,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: 44,
                            width: Get.width - 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              // color: Colors.red,

                              border: Border.all(
                                color: const Color(0xffe0e0e0),
                                width: 1,
                              ),
                            ),
                            child: Obx(
                              () => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    4,
                                    (index) => GestureDetector(
                                      onTap: () =>
                                          ctr.selectedTabName(tabName[index]),
                                      child: selectTabMenu(
                                          tabName: tabName[index],
                                          isSelected: ctr.selectedTabName ==
                                              tabName[index].toString()),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),

                  ///You can add a bool here and use  ctr.selectedTabName.value == tabName, to switch between other screens
                  Obx(
                    () => ctr.selectedTabName.value == tabName[1]
                        ? AllegerimWidget()
                        : ctr.selectedTabName.value == tabName[2]
                            ? PortfolioTabWidgets()
                            : ctr.selectedTabName.value == tabName[3]
                                // ? PortfolioTabWidgets
                                ? BewtungenWidgets()
                                : Menu(restaurantModel: widget.model),
                  )
                ]),
              ),
            )
          : Scaffold(
              body: Center(
                child: CommanWidget(context: context)
                    .showlolder(isshowDilog: true),
              ),
            ),
    );
  }

  PageController pagecontroll =
      new PageController(viewportFraction: 1, keepPage: true);
  var urlimg = [
    "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg?w=500",
    "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/2KL6JYQYH4I6REYMIWBYVUGXPI.jpg&w=500",
    "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/2KL6JYQYH4I6REYMIWBYVUGXPI.jpg&w=500"
  ];
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

  Widget multipleImageContainer() {
    return Container(
      height: 230,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: pagecontroll,
          itemCount: ctr.resturantDetails.value.storeGallery.length == 0
              ? 2
              : ctr.resturantDetails.value.storeGallery.length,
          itemBuilder: (context, ind) {
            return ctr.resturantDetails.value.storeGallery.length > 0
                ? gridViewContainer(ctr.resturantDetails.value.storeGallery[ind]
                    .storeGalleryImagePath)
                : gridViewContainer(urlimg[ind]);
          }),
    );
  }

  // void _modalBottomSheetMenu(context) {
  //   showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(
  //           top: Radius.circular(20),
  //         ),
  //       ),
  //       builder: (builder) {
  //         return new Container(
  //           // height: 700,
  //           color: Colors.transparent,
  //           child: SingleChildScrollView(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 ClipRRect(
  //                     borderRadius: BorderRadius.only(
  //                       topRight: Radius.circular(20),
  //                       topLeft: Radius.circular(20),
  //                     ),
  //                     child: Image.asset(
  //                       "assets/images/onboarding/chickenpizza.jpg",
  //                       width: double.infinity,
  //                       height: 180,
  //                       fit: BoxFit.cover,
  //                     )),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //                   child: Text(
  //                     "Chicken Pizza",
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 22,
  //                       fontFamily: AppFont.medium,
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //                   child: Text(
  //                     "12.00€",
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 16,
  //                         color: Color(AppColor.red)),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.symmetric(
  //                       horizontal: 8.0, vertical: 0),
  //                   child: Text(
  //                     "It is a trustworthy choice on the long list of toppings. Chicken is delicio- us with even simple seasoning and proper cooking, and when you make it a pizza topping, it becomes more flavorful. ",
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.normal,
  //                         fontSize: 14,
  //                         color: Colors.black54),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Text(
  //                     "Extras",
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.w600,
  //                         fontSize: 16,
  //                         color: Color(AppColor.black)),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //                   child: Text(
  //                     "choose you extras",
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.w400,
  //                         fontSize: 14,
  //                         color: Color(AppColor.black)),
  //                   ),
  //                 ),
  //                 // ListView.builder(
  //                 //     shrinkWrap: true,
  //                 //     primary: false,
  //                 //     itemCount: ctr.radioValue.length,
  //                 //     itemBuilder: (context, index) {
  //                 //       return extras(ctr.radioValue[index], index);
  //                 //     }),

  //                 ListView.builder(
  //                     shrinkWrap: true,
  //                     primary: false,
  //                     itemCount: ctr.checkBoxListData.length,
  //                     itemBuilder: (context, index) {
  //                       return Obx(() => SizedBox(
  //                             height: 40,
  //                             child: CheckboxListTile(
  //                                 controlAffinity:
  //                                     ListTileControlAffinity.leading,
  //                                 title: Text(
  //                                     ctr.checkBoxListData[index]['title']),
  //                                 value: ctr
  //                                     .checkBoxListData[index]['isCheck'].value,
  //                                 checkboxShape: RoundedRectangleBorder(
  //                                     borderRadius: BorderRadius.circular(15)),
  //                                 onChanged: (v) {
  //                                   ctr.checkBoxListData[index]['isCheck']
  //                                           .value =
  //                                       !ctr.checkBoxListData[index]['isCheck']
  //                                           .value;
  //                                   if (v) {
  //                                     print("Selected");
  //                                     Get.find<CartController>()
  //                                         .cartObject['extras']
  //                                         .add(ctr.checkBoxListData[index]
  //                                             ['title']);
  //                                     print(Get.find<CartController>()
  //                                         .cartObject['extras']);
  //                                   } else {
  //                                     List data = ["q", "f"];
  //                                     data.remove("q");
  //                                     Get.find<CartController>()
  //                                         .cartObject['extras']
  //                                         .remove(ctr.checkBoxListData[index]
  //                                             ['title']);
  //                                     print(Get.find<CartController>()
  //                                         .cartObject['extras']);
  //                                     print("remove");
  //                                   }
  //                                   print(v);
  //                                 }),
  //                           ));
  //                     }),

  //                 SizedBox(
  //                   height: 20,
  //                 ),
  //                 Container(
  //                   height: 60,
  //                   width: double.infinity,
  //                   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
  //                   margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  //                   decoration: BoxDecoration(
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: Colors.grey,
  //                           offset: Offset(0.0, 1.0), //(x,y)
  //                           blurRadius: 6.0,
  //                         ),
  //                       ],
  //                       color: Color(AppColor.red),
  //                       borderRadius: BorderRadius.circular(12)),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Container(
  //                         width: 120,
  //                         height: 45,
  //                         decoration: BoxDecoration(
  //                             color: Colors.white,
  //                             border: Border.all(color: Color((0xff81261F))),
  //                             borderRadius: BorderRadius.circular(12)),
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                           children: [
  //                             Center(
  //                                 child: Text(
  //                               "  - ",
  //                               style: TextStyle(
  //                                   fontSize: 20,
  //                                   color: Colors.red,
  //                                   fontWeight: FontWeight.bold),
  //                             )),
  //                             Center(
  //                                 child: Text(
  //                               "02",
  //                               style:
  //                                   TextStyle(fontSize: 18, color: Colors.red),
  //                             )),
  //                             Center(
  //                                 child: Text(
  //                               "  +",
  //                               style:
  //                                   TextStyle(fontSize: 20, color: Colors.red),
  //                             ))
  //                           ],
  //                         ),
  //                       ),
  //                       GestureDetector(
  //                         onTap: () {
  //                           Get.find<CartController>().onAddToCardButtonClick();
  //                           //Get.to(() => CartPage());
  //                         },
  //                         child: Container(
  //                           width: Get.width * 0.5,
  //                           height: 45,
  //                           decoration: BoxDecoration(
  //                             color: Colors.white,
  //                             border: Border.all(color: Color((0xff81261F))),
  //                             borderRadius: BorderRadius.circular(12),
  //                           ),
  //                           child: Center(
  //                             child: Text(
  //                               "Add this to Cart",
  //                               style: TextStyle(
  //                                   fontSize: 18,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: Color(AppColor.red)),
  //                             ),
  //                           ),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  // Widget extras(value, index) {
  //   return SizedBox(
  //     height: 35,
  //     width: double.infinity,
  //     child: ListTile(
  //       horizontalTitleGap: 5,
  //       leading: Obx(() => Radio(
  //             activeColor: Color(AppColor.red),
  //             value: value,
  //             groupValue: ctr.selectRadio.value,
  //             onChanged: (Object value) {
  //               ctr.selectRadio.value = value;
  //             },
  //           )),
  //       title: Obx(
  //         () => ctr.selectRadio.value == ctr.radioValue[index]
  //             ? Text(ctr.radioValue[index],
  //                 style: TextStyle(color: Color(AppColor.red)))
  //             : Text(
  //                 ctr.radioValue[index],
  //                 style: TextStyle(fontFamily: 'campton', color: Colors.grey),
  //               ),
  //       ),
  //       trailing: Obx(
  //         () => ctr.selectRadio.value == ctr.radioValue[index]
  //             ? Text("+1.50€", style: TextStyle(color: Color(AppColor.red)))
  //             : Text(
  //                 "+1.50€",
  //                 style: TextStyle(fontFamily: 'campton', color: Colors.grey),
  //               ),
  //       ),
  //     ),
  //   );

  //   // return Column(
  //   //   children: [
  //   //    Obx(()=> Radio(
  //   //       value: "chicken",
  //   //       groupValue: ctr.selectRadio.value,
  //   //       onChanged: (Object value) {
  //   //         ctr.selectRadio.value =value;
  //   //       },
  //   //     )),
  //   // Obx(()=> Radio(
  //   //       value: "abc",
  //   //       groupValue: ctr.selectRadio.value,
  //   //       onChanged: (Object value) {
  //   //         ctr.selectRadio.value =value;
  //   //         print(value);
  //   //       },
  //   //     ),)
  //   //   ],
  //   // );
  // }

  Widget selectTabMenu({bool isSelected = false, String tabName = ''}) {
    return isSelected
        ? Container(
            height: 38,
            width: Get.width * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: const Color(0xffe14942),
            ),
            child: Center(
              child: Text(
                tabName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: "Campton",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        : Row(
            children: [
              SizedBox(
                width: Get.width * 0.18,
                child: Center(
                  child: Text(
                    tabName,
                    style: const TextStyle(
                      color: Color(0xff9e9e9e),
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              )
            ],
          );
  }

  SizedBox backgroundAndAvatarImages(BuildContext context) {
    return SizedBox(
      height: 435,
      width: 435,
      child: Stack(children: [
        Container(
          height: 340,
          decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/onboarding/background_img.png',
                  ))),
        ),
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 42,
                    height: 42,
                    padding: const EdgeInsets.only(left: 12, right: 15),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 20,
                          offset: Offset(0, 8),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: const Center(child: Icon(Icons.arrow_back_ios)),
                  ),
                ),
                Obx(
                  () => Row(
                    children: List.generate(
                        tabName.length,
                        (index) => ctr.selectedTabName.toLowerCase() ==
                                tabName[index].toString().toLowerCase()
                            ? Container(
                                width: 44,
                                height: 10,
                                padding: const EdgeInsets.all(2),
                                margin: const EdgeInsets.only(right: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    color: Colors.white),
                              )
                            : Opacity(
                                opacity: 0.60,
                                child: Container(
                                  width: 12,
                                  height: 6,
                                  margin: const EdgeInsets.only(right: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                  ),
                ),
                Container(
                    width: 42,
                    height: 42,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 20,
                          offset: Offset(0, 8),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Icon(Icons.favorite_border),
                    ))
              ],
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 124,
              height: 124,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(62),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/onboarding/background_img.png',
                    )),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 20,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              // child: const FlutterLogo(size: 124),
            ),
          ),
        )
      ]),
    );
  }
}

class AllegerimWidget extends StatefulWidget {
  AllegerimWidget({Key key}) : super(key: key);

  @override
  State<AllegerimWidget> createState() => _AllegerimWidgetState();
}

class _AllegerimWidgetState extends State<AllegerimWidget> {
  final controller = Get.find<ResturantController>();

  final List days = [
    'Monday',
    'Tuesday',
    'Wednesdy',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  final ctr = Get.find<ResturantController>();

  bool flag = true;

  String firstHalf;

  String secondHalf;
  ResturantController _storeDetailController = Get.find();

  @override
  void initState() {
    super.initState();
    if (_storeDetailController.resturantDetails.value.storeDescription.length >
        100) {
      firstHalf = _storeDetailController.resturantDetails.value.storeDescription
          .substring(0, 100);
      secondHalf = _storeDetailController
          .resturantDetails.value.storeDescription
          .substring(
              100,
              _storeDetailController
                  .resturantDetails.value.storeDescription.length);
    } else {
      firstHalf =
          _storeDetailController.resturantDetails.value.storeDescription;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          color: const Color(0xfff9f9fb),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Description",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "Campton",
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: secondHalf.isEmpty
                          ? Html(
                              shrinkToFit: true,
                              data: firstHalf,
                            )
                          : Html(
                              shrinkToFit: true,
                              data: flag
                                  ? (firstHalf + "...")
                                  : (firstHalf + secondHalf),
                            ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                child: Container(
                                  width: 126,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                      color: Color(0xffe14942),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        flag ? 'readMore'.tr : 'readLess'.tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xffe14942),
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 16,
                                        color: Color(0xffe14942),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    flag = !flag;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _storeDetailController
                    .resturantDetails.value.general.facilities.length ==
                0
            ? Container()
            : Container(
                padding: const EdgeInsets.all(18),
                color: const Color(0xfff9f9fb),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Facilities",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "Campton",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    _storeDetailController.resturantDetails.value.general
                                .facilities.length ==
                            0
                        ? Container()
                        : gridViewContainerForSpecifics(),
                  ],
                ),
              ),
        const SizedBox(
          height: 8,
        ),
        Container(
            padding: const EdgeInsets.all(18),
            color: const Color(0xfff9f9fb),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Location by Map",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "Campton",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // GestureDetector(
                //   onTap: () {
                //     controller.launchUrls(Uri.parse(controller
                //         .resturantDetails.value.general.locationByMap));
                //   },
                Container(
                  height: 200,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: googlemap(
                      controller.resturantDetails.value.general.locationByMap),
                )
              ],
            )),
        const SizedBox(
          height: 8,
        ),
        disctrictKitchenAndContactWidgets(
          title: 'District',
          subtext: controller.resturantDetails.value.storeDistrict,
          widget: Container(
            width: 41,
            height: 43,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffec8984).withOpacity(0.1),
            ),
            child: const Center(
                child: Icon(
              Icons.location_on_outlined,
              color: Color(0xffec8984),
            )),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        disctrictKitchenAndContactWidgets(
            title: 'Kitchen',
            subtext: controller.resturantDetails.value.general.categories,
            widget: Container(
              width: 41,
              height: 43,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff007aff).withOpacity(0.1),
              ),
              child: Center(
                  child: SvgPicture.asset(
                'assets/images/onboarding/food.svg',
                color: const Color(0xff007aff),
              )),
            )),
        const SizedBox(
          height: 8,
        ),
        disctrictKitchenAndContactWidgets(
            title: 'Contact',
            widget: Container(
              width: 105,
              height: 43,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffe14942)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await FlutterPhoneDirectCaller.callNumber(controller
                          .resturantDetails.value.general.phoneNumber);
                    },
                    child: Center(
                        child: Icon(
                      Icons.call_outlined,
                      color: Colors.white,
                    )),
                  ),
                  Text(
                    "Call Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            )),
        const SizedBox(
          height: 8,
        ),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            color: const Color(0xfff9f9fb),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xffd9d9d9),
                    width: 0.10,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0c000000),
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Obx(
                  () => Column(
                      children: controller
                          .resturantDetails.value.general.openingHours
                          .map((e) => GestureDetector(
                                onTap: () {
                                  ctr.selectedDate(e.day);
                                },
                                child: Container(
                                  color: ctr.selectedDate == e.day
                                      ? const Color(0xfff6f6f8)
                                      : Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        e.day.toString(),
                                        style: TextStyle(
                                          color: ctr.selectedDate == e.day
                                              ? const Color(0xffe14942)
                                              : const Color(0xff455a64),
                                          fontSize: 14,
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        e.startTime == null || e.endTime == null
                                            ? "OFF"
                                            : "${e.startTime} - ${e.endTime}",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: ctr.selectedDate == e.day
                                              ? const Color(0xffe14942)
                                              : const Color(0xff455a64),
                                          fontSize: 14,
                                          fontFamily: "Campton",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          .toList()),
                ),
              ),
            )),
        const SizedBox(
          height: 8,
        ),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            color: const Color(0xfff9f9fb),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 11, right: 19, top: 16, bottom: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xffd9d9d9),
                  width: 0.10,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0c000000),
                    blurRadius: 20,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 25,
                              height: 20,
                              child: SvgPicture.asset(
                                'assets/images/onboarding/cart.svg',
                                width: 15,
                                height: 15,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Minimum Order Value",
                            style: TextStyle(
                              color: Color(0xff455a64),
                              fontSize: 14,
                              fontFamily: "Campton",
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "${controller.resturantDetails.value.minOrderAmount}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff455a64),
                          fontSize: 14,
                          fontFamily: "Campton",
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                            height: 20,
                            child: SvgPicture.asset(
                              'assets/images/onboarding/clock.svg',
                              width: 15,
                              height: 15,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Delivery Costs",
                            style: TextStyle(
                              color: Color(0xff455a64),
                              fontSize: 14,
                              fontFamily: "Campton",
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Text(
                        " ${controller.resturantDetails.value.minDeliveryCost.toDouble()} €",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff455a64),
                          fontSize: 14,
                          fontFamily: "Campton",
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 25,
                              height: 20,
                              child: SvgPicture.asset(
                                'assets/images/onboarding/delivery.svg',
                                width: 15,
                                height: 15,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Average Delivery Time",
                            style: TextStyle(
                              color: Color(0xff455a64),
                              fontSize: 14,
                              fontFamily: "Campton",
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "${controller.resturantDetails.value.minDeliveryTime} mins",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff455a64),
                          fontSize: 14,
                          fontFamily: "Campton",
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
        const SizedBox(
          height: 8,
        ),
        disctrictKitchenAndContactWidgets(
          title: 'Website',
          subtext: controller.resturantDetails.value.general.storeUrl ?? "N/A",
          widget: Container(
            width: 41,
            height: 43,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffec8984).withOpacity(0.1),
            ),
            child: GestureDetector(
              onTap: () async {
                controller.launchUrls(
                    controller.resturantDetails.value.general.storeUrl);
              },
              child: const Center(
                  child: Icon(
                Icons.language_rounded,
                color: Color(0xffec8984),
              )),
            ),
          ),
        ),
      ],
    );
  }

  Widget googlemap(String url) {
    return InkWell(
      onTap: () {
        //Get.toNamed("/mapViewForShowMap");
        _storeDetailController.openGoogelMap();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
              image: NetworkImage(url, scale: 0.1),
              fit: BoxFit.cover,
              scale: 0.1),
        ),
      ),
    );
  }

  Container disctrictKitchenAndContactWidgets(
      {String title = '',
      String subtext = '',
      Widget widget = const SizedBox()}) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        color: const Color(0xfff9f9fb),
        child: Container(
          height: 60,
          padding: const EdgeInsets.only(
            left: 20,
            right: 6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xffd9d9d9),
              width: 0.10,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0c000000),
                blurRadius: 20,
                offset: Offset(0, 4),
              ),
            ],
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              subtext.isNotEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: subtext.isEmpty
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xff455a64),
                            fontSize: 14,
                            fontFamily: "Campton",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          subtext,
                          style: const TextStyle(
                            color: Color(0xff7b7b7b),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xff455a64),
                        fontSize: 14,
                        fontFamily: "Campton",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
              widget
            ],
          ),
        ));
  }

  Widget gridViewContainerForSpecifics() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xffd9d9d9),
            width: 0.10,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0c000000),
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
        ),
        // width: 175,
        height: 40 *
            _storeDetailController
                .resturantDetails.value.general.facilities.length
                .toDouble(),

        // height: 51,
        child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                mainAxisExtent: 50),
            itemCount: _storeDetailController
                .resturantDetails.value.general.facilities.length,
            itemBuilder: (context, ind) {
              var currentObj = _storeDetailController
                  .resturantDetails.value.general.facilities[ind];
              return Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xffd9d9d9),
                    width: 0.10,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0c000000),
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Row(
                    children: [
                      Container(
                        width: (Get.width / 2) - 65,
                        child: Text(
                          toBeginningOfSentenceCase(currentObj.name),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12, fontFamily: AppFont.medium),
                        ),
                      ),
                      SizedBox(width: 3),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Color(AppColor.lightpink),
                            borderRadius: BorderRadius.circular(7)),
                        child: Container(
                            margin: EdgeInsets.all(8),
                            child:
                                SvgPicture.network(currentObj.fullImagePath)),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Container facilitiesWidgets(
      {String text,
      String icon,
      Color color,
      Widget widget = const SizedBox()}) {
    return Container(
      width: 175,
      height: 51,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xffd9d9d9),
          width: 0.10,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0c000000),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(children: [
        const SizedBox(
          width: 20,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xff455a64),
            fontSize: 14,
            fontFamily: "Campton",
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(right: 5),
          width: 41,
          height: 43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color.withOpacity(0.21),
          ),
          child: Center(child: widget),
        ),
      ]),
    );
  }
}

Container starRating({bool isSelected = false}) {
  return Container(
    width: 22.05,
    height: 22.05,
    margin: const EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      border: Border.all(
        color: isSelected ? const Color(0xfffcbe56) : const Color(0xffa4a5a7),
        width: 0.50,
      ),
    ),
    child: Icon(
      Icons.star_rounded,
      size: 18,
      color: isSelected ? const Color(0xfffcbe56) : const Color(0xffa4a5a7),
    ),
  );
}
