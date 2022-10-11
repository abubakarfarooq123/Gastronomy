// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';
// import 'package:reserved4u/Reviews/GiveFeedBack/GiveFeedBackController.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import '../../Helper/NotificatiokKeys.dart';

// // ignore: must_be_immutable
// class GiveFeedback extends StatelessWidget {
//   GiveFeedBackController _giveFeedBackController =
//       Get.put(GiveFeedBackController());
//   var arrList = [
//     'serviceStaff'.tr,
//     'Ambiance'.tr,
//     'priceprefoma'.tr,
//     'waitingPeriod'.tr,
//     'atmosphere'.tr
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: bottomNavBar(),
//       backgroundColor: Color(AppColor.scaffoldbgcolor),
//       appBar: appbar(),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             internetUrlImg(_giveFeedBackController.selectedStoreImage),
//             SizedBox(
//               height: 15,
//             ),
//             Text(_giveFeedBackController.selectedStoreName,
//                 style: TextStyle(
//                     fontFamily: AppFont.semiBold,
//                     fontSize: 22,
//                     color: Color(AppColor.moneytextColor))),
//             SizedBox(
//               height: 5,
//             ),
//             Text('howwasyourexperience'.tr,
//                 style: TextStyle(
//                   fontFamily: AppFont.regular,
//                   fontSize: 12,
//                 )),
//             SizedBox(
//               height: 25,
//             ),
//             Obx(
//               () => selectContainer(
//                   text: _giveFeedBackController.selectedServiceName.value,
//                   assetsimg: "assets/images/selectservices.png",
//                   page: "/selectedServices"),
//             ),
//             Obx(
//               () => selectContainer(
//                   text: _giveFeedBackController.selectedEmployeeName.value,
//                   assetsimg: "assets/images/selectservices.png",
//                   page: "/selectEmployee"),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Text('giveRatings'.tr,
//                     style:
//                         TextStyle(fontFamily: AppFont.semiBold, fontSize: 18),
//                     textAlign: TextAlign.start),
//               ],
//             ),
//             SizedBox(height: 15),
//             giveRatings(),
//             typeYourExperience()
//           ],
//         ),
//       ),
//     );
//   }

//   AppBar appbar() {
//     return AppBar(
//       backgroundColor: Color(
//         AppColor.scaffoldbgcolor,
//       ),
//       title: Image.asset(
//         AssestPath.favourite + "Logo_Home.png",
//         height: 20,
//       ),
//       centerTitle: true,
//       elevation: 1,
//       leading: Container(
//           margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
//           height: 35,
//           width: 35,
//           decoration: BoxDecoration(boxShadow: [
//             const BoxShadow(
//                 color: Colors.black12,
//                 spreadRadius: 1,
//                 offset: Offset(1, 1),
//                 blurRadius: 7)
//           ], color: Colors.white, borderRadius: BorderRadius.circular(100)),
//           child: IconButton(
//             icon: Icon(
//               Icons.arrow_back_ios_outlined,
//               color: Colors.black,
//               size: 15,
//             ),
//             onPressed: () {
//               Get.back();
//             },
//           )),
//     );
//   }

//   Center internetUrlImg(String imgUrl) {
//     return Center(
//       child: Container(
//         margin: EdgeInsets.only(top: 20),
//         alignment: Alignment.bottomCenter,
//         height: 100,
//         width: 100,
//         child: CachedNetworkImage(
//           imageUrl: imgUrl,
//           placeholder: (context, url) =>
//               Image.asset("assets/images/store_default.png"),
//           errorWidget: (context, url, error) => Container(
//             decoration: BoxDecoration(
//               color: Color(AppColor.profileColour),
//               borderRadius: BorderRadius.circular(60),
//               image: DecorationImage(
//                 image: AssetImage(
//                   "assets/images/store_default.png",
//                 ),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           imageBuilder: (context, imageProvider) => Container(
//             decoration: BoxDecoration(
//               color: Color(AppColor.profileColour),
//               borderRadius: BorderRadius.circular(65),
//               image: DecorationImage(
//                 image: imageProvider,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget selectContainer({String text, String assetsimg, String page}) {
//     return GestureDetector(
//       onTap: () {
//         Get.toNamed(page);
//       },
//       child: Container(
//         margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
//         padding: EdgeInsets.only(left: 10, right: 10),
//         height: 50,
//         width: Get.width * 0.90,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: Color(AppColor.thirdColour)),
//         child: Row(
//           children: [
//             Image.asset(
//               "$assetsimg",
//               height: 25,
//               color: Color(AppColor.greytextColor),
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             Text(
//               "$text",
//               style: TextStyle(
//                   fontFamily: AppFont.regular,
//                   color: text == 'selectServices'.tr
//                       ? Color(AppColor.greytextColor)
//                       : text == 'selectEmployee'.tr
//                           ? Color(AppColor.greytextColor)
//                           : Colors.black,
//                   fontSize: 12),
//             ),
//             Spacer(),
//             Icon(
//               Icons.arrow_forward_ios,
//               size: 15,
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget giveRatings() {
//     final controller = PageController(viewportFraction: 0.8);
//     return Column(
//       children: [
//         Container(
//           alignment: Alignment.center,
//           height: 110,
//           width: Get.width,
//           child: PageView(
//             controller: controller,
//             children: List.generate(
//                 arrList.length,
//                 (ind) => Card(
//                       color: Color(0xFFfef5e7),
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16)),
//                       margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Obx(
//                             () => RatingBar.builder(
//                               initialRating: ind == 0
//                                   ? double.parse(
//                                       _giveFeedBackController.servicerate.value)
//                                   : ind == 1
//                                       ? double.parse(_giveFeedBackController
//                                           .ambiente.value)
//                                       : ind == 2
//                                           ? double.parse(_giveFeedBackController
//                                               .preieleistungsrate.value)
//                                           : ind == 3
//                                               ? double.parse(
//                                                   _giveFeedBackController
//                                                       .wartezeit.value)
//                                               : double.parse(
//                                                   _giveFeedBackController
//                                                       .atmosphare.value),
//                               minRating: 0,
//                               direction: Axis.horizontal,
//                               allowHalfRating: true,
//                               glowColor: Colors.white,
//                               itemSize: 30,
//                               unratedColor: Color(0xFFdadbde),
//                               itemPadding:
//                                   EdgeInsets.symmetric(horizontal: 3.0),
//                               itemBuilder: (context, index) {
//                                 return Container(
//                                   child: Image.asset(
//                                     AssestPath.homeView + "Star.png",
//                                     height: 18,
//                                     width: 18,
//                                   ),
//                                 );
//                               },
//                               onRatingUpdate: (value) {
//                                 if (ind == 0) {
//                                   _giveFeedBackController.servicerate.value =
//                                       value.toString();
//                                 }

//                                 if (ind == 1) {
//                                   _giveFeedBackController.ambiente.value =
//                                       value.toString();
//                                 }

//                                 if (ind == 2) {
//                                   _giveFeedBackController.preieleistungsrate
//                                       .value = value.toString();
//                                 }

//                                 if (ind == 3) {
//                                   _giveFeedBackController.wartezeit.value =
//                                       value.toString();
//                                 }

//                                 if (ind == 4) {
//                                   _giveFeedBackController.atmosphare.value =
//                                       value.toString();
//                                 }
//                               },
//                             ),
//                           ),
//                           Text(
//                             arrList[ind],
//                             style: TextStyle(
//                                 fontFamily: AppFont.medium, fontSize: 13),
//                           ),
//                         ],
//                       ),
//                     )),
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         SmoothPageIndicator(
//             controller: controller,
//             count: 5,
//             effect: ScrollingDotsEffect(
//               activeStrokeWidth: 1.5,
//               activeDotScale: 1.8,
//               radius: 8,
//               dotHeight: 8,
//               dotWidth: 8,
//               fixedCenter: true,
//               // strokeWidth: 0.2,
//               dotColor: Colors.grey[400],
//               activeDotColor: Color(0xFFdc8e8d),
//               spacing: 10,
//             )),
//       ],
//     );
//   }

//   Widget typeYourExperience() {
//     return Container(
//       margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
//       height: 150,
//       width: Get.width,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15), color: Color(0xfff9f9fb)),
//       child: Padding(
//         padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
//         child: TextFormField(
//           controller: _giveFeedBackController.txtTypeYourExep,
//           maxLines: 10,
//           keyboardType: TextInputType.text,
//           style: TextStyle(fontFamily: AppFont.regular, fontSize: 15),
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: 'typeYourExperience'.tr,
//             hintStyle: TextStyle(fontFamily: AppFont.regular, fontSize: 13),
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             counterStyle: TextStyle(fontFamily: AppFont.regular, fontSize: 13),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget bottomNavBar() {
//     return InkWell(
//       onTap: () {
//         _giveFeedBackController.validateReview();
//       },
//       child: Container(
//         height: 80,
//         width: Get.width,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(15), topRight: Radius.circular(15)),
//             color: Color(0xFFdb8a8a)),
//         child: Center(
//           child: Text("giveFeedBack".tr,
//               style: TextStyle(
//                   fontFamily: AppFont.regular,
//                   fontSize: 15,
//                   color: Color(AppColor.scaffoldbgcolor))),
//         ),
//       ),
//     );
//   }
// }
