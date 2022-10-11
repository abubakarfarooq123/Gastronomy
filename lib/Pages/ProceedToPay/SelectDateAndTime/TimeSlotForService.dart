// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:reserved4u/Helper/NotificatiokKeys.dart';
// import 'package:reserved4u/Helper/apiProvider.dart';
// import 'package:reserved4u/Pages/ProceedToPay/SelectedServiceModel.dart';
// import 'package:shimmer/shimmer.dart';
// import '../ProceedToPayController.dart';
//
// // ignore: use_key_in_widget_constructors, must_be_immutable
// class TimeSlotForService extends StatelessWidget {
//   final ProceedToPayController _proceedToPayController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     // ignore: sized_box_for_whitespace
//     return Container(
//       height: Get.height,
//       width: Get.width,
//       child: Scaffold(
//         appBar: appbar(),
//         backgroundColor: Color(AppColor.bgColor),
//         bottomSheet: btnDone(),
//         body: SafeArea(
//           child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: InkWell(
//                 onTap: () {
//                   _proceedToPayController.isOpenStylist.value = false;
//                 },
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     vanueName(),
//                     Stack(
//                       alignment: Alignment.topCenter,
//                       children: [
//                         Column(
//                           children: [
//                             SizedBox(
//                               height: 70,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                               child: Text(
//                                 'selectDateTime'.tr,
//                                 style: TextStyle(color: Colors.black45, fontSize: 20, fontFamily: AppFont.medium),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                               child: selectDateContainer(context),
//                             ),
//                             Obx(
//                               () => Padding(
//                                 padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                                 child: _proceedToPayController.isLoader.value ? shimmerBotttomTimeSloyGrid() : botttomTimeSloyGrid(),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 100,
//                             ),
//                           ],
//                         ),
//                         Positioned(
//                           child: Obx(
//                             () => Column(
//                               children: [
//                                 selectStylist(context),
//                                 Padding(
//                                     padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                                     child: Visibility(
//                                       visible: _proceedToPayController.isOpenStylist.value,
//                                       child: showAvailblrStylist(),
//                                     ))
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               )),
//         ),
//       ),
//     );
//   }
//
//   //======== Header ==========
//   AppBar appbar() {
//     return AppBar(
//       backgroundColor: Color(AppColor.scaffoldbgcolor),
//       elevation: 0,
//       leading: Padding(
//           padding: const EdgeInsets.fromLTRB(25, 0, 0, 10),
//           child: Container(
//             height: 35,
//             width: 35,
//             child: FloatingActionButton(
//               backgroundColor: Color(AppColor.scaffoldbgcolor),
//               child: Icon(
//                 Icons.arrow_back_ios_outlined,
//                 size: 15,
//                 color: Color(0xFF000000),
//               ),
//               onPressed: () {
//                 Get.back();
//               },
//             ),
//           )),
//       title: Padding(
//         padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//         child: Text(
//           'checkOut'.tr,
//           style: TextStyle(
//             fontFamily: AppFont.medium,
//             fontSize: 20,
//             color: Color(AppColor.maincategorySelectedTextColor),
//           ),
//         ),
//       ),
//       actions: [],
//     );
//   }
//
//   //======== Vanue Name ==========
//
//   Widget vanueName() {
//     var currentObj = _proceedToPayController.arrSelectedServices[_proceedToPayController.currentSelectedIndex];
//     return Container(
//       width: Get.width,
//       height: 100,
//       color: Color(AppColor.maincategorySelectedColor),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Row(
//           children: [
//             Container(
//               padding: EdgeInsets.all(15),
//               height: 80,
//               width: 80,
//               child: SvgPicture.network(
//                 currentObj.categoryImagePath,
//                 color: Color(0xFFdb8a8a),
//               ),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.white, width: 3),
//                 borderRadius: BorderRadius.circular(40),
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(width: 15),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   currentObj.name,
//                   style: TextStyle(fontSize: 22, fontFamily: AppFont.medium),
//                 ),
//                 Container(
//                   width: 200,
//                   child: Text(
//                     currentObj.storename,
//                     style: TextStyle(fontSize: 15, fontFamily: AppFont.regular, color: Colors.black45),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
// //======== Select Stylist ==========
//
//   Widget selectStylist(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         _proceedToPayController.isOpenStylist.value = !_proceedToPayController.isOpenStylist.value;
//         _proceedToPayController.fabIconNumber.value = !_proceedToPayController.fabIconNumber.value;
//       },
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 50,
//                   width: Get.width,
//                   decoration: BoxDecoration(color: Color(AppColor.maincategoryDisableColor), borderRadius: BorderRadius.circular(15)),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 40,
//                           width: 40,
//                           child: Container(
//                             decoration: BoxDecoration(),
//                             child: _proceedToPayController.slectedStylistImage.value == null ||
//                                     _proceedToPayController.slectedStylistImage.value == '' ||
//                                     _proceedToPayController.slectedStylistImage.value == "null" ||
//                                     _proceedToPayController.slectedStylistImage.value == 'https://www.reserved4you.de/storage/app/public/default/default-user.png'
//                                 ? Container(
//                                     decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white, border: Border.all(color: Color(0xFFdb8a8a), width: 0.3)),
//                                     child: Center(
//                                       child: Obx(() {
//                                         List<String> nameList = _proceedToPayController.selectedStylistName.value.split(' ');
//                                         String name = '';
//                                         if (nameList.length == 2) {
//                                           name = nameList.first[0].toUpperCase() + nameList.last[0].toUpperCase();
//                                         } else {
//                                           name = nameList.first[0].toUpperCase() + nameList.first[1].toUpperCase();
//                                         }
//                                         return Text(
//                                           name,
//                                           style: TextStyle(
//                                             fontSize: 10,
//                                             fontWeight: FontWeight.w600,
//                                             color: Color(0xFFdb8a8a),
//                                           ),
//                                         );
//                                       }),
//                                     ),
//                                   )
//                                 : CachedNetworkImage(
//                                     imageUrl: _proceedToPayController.slectedStylistImage.toString(),
//                                     placeholder: (context, url) => Image.asset(
//                                       "assets/images/DetailScreen/Select Stylist.png",
//                                       fit: BoxFit.cover,
//                                     ),
//                                     imageBuilder: (context, imageProvider) => Container(
//                                       decoration: BoxDecoration(
//                                         image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
//                                         borderRadius: BorderRadius.circular(15),
//                                       ),
//                                     ),
//                                   ),
//                             margin: const EdgeInsets.all(6),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Obx(
//                           () => Text(
//                             _proceedToPayController.selectedStylistName.value,
//                             style: TextStyle(fontSize: 15, fontFamily: AppFont.regular, color: Colors.black45),
//                           ),
//                         ),
//                         const Spacer(),
//                         InkWell(
//                           onTap: () {
//                             _proceedToPayController.isOpenStylist.value = !_proceedToPayController.isOpenStylist.value;
//                             _proceedToPayController.fabIconNumber.value = !_proceedToPayController.fabIconNumber.value;
//                           },
//                           child: Container(
//                             height: 30,
//                             width: 30,
//                             decoration: BoxDecoration(
//                                 // ignore: prefer_const_literals_to_create_immutables
//                                 boxShadow: [const BoxShadow(color: Colors.black12, spreadRadius: 1, offset: Offset(1, 1), blurRadius: 7)],
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(25)),
//                             child: Container(
//                               child: Image.asset(
//                                 AssestPath.detailScreen + 'down.png',
//                                 color: Colors.black38,
//                               ),
//                               margin: const EdgeInsets.all(9),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget btnDone() {
//     return InkWell(
//       onTap: () {
//         if (_proceedToPayController.timeSloteSelectedInd.value == "") {
//           showTostMessage(message: 'selectTimeSlot'.tr);
//         } else {
//           var currentObj = _proceedToPayController.arrSelectedServices[_proceedToPayController.currentSelectedIndex];
//           _proceedToPayController.addDateAndTimeInTheSelectedService(
//             serviceid: currentObj.id.toString(),
//             storeid: currentObj.servicecategory.first.storeId.toString(),
//           );
//           Get.back();
//         }
//       },
//       child: Container(
//         height: 60,
//         width: Get.width,
//         decoration: BoxDecoration(color: Color(AppColor.maincategorySelectedTextColor), borderRadius: BorderRadius.circular(15)),
//         child: Center(
//             child: Text(
//           'done'.tr,
//           style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: AppFont.medium),
//         )),
//       ),
//     );
//   }
//
//   Widget selectDateContainer(BuildContext context) {
//     return Container(
//       height: 125,
//       width: Get.width,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
//       child: Stack(
//         children: [
//           Container(
//             height: 80,
//             width: Get.width,
//             decoration: BoxDecoration(color: Color(AppColor.stackColor), borderRadius: BorderRadius.circular(20)),
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   /*Left buttn*/ Obx(
//                     () => Visibility(
//                       visible: _proceedToPayController.isPrevious.value,
//                       child: Container(
//                         height: 30,
//                         width: 30,
//                         decoration: BoxDecoration(
//                             // ignore: prefer_const_literals_to_create_immutables
//                             boxShadow: [const BoxShadow(color: Colors.black12, spreadRadius: 1, offset: Offset(1, 1), blurRadius: 7)],
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(15)),
//                         child: InkWell(
//                           onTap: () {
//                             _proceedToPayController.incrementDecrementDate(false);
//                           },
//                           child: Container(
//                             child: Image.asset(
//                               AssestPath.detailScreen + 'Back.png',
//                               color: Colors.black38,
//                             ),
//                             margin: const EdgeInsets.all(9),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Obx(
//                     () => Text(
//                       _proceedToPayController.currentDateFormated.value,
//                       style: TextStyle(fontSize: 15, fontFamily: AppFont.medium),
//                     ),
//                   ),
//                   /*Right Button*/ InkWell(
//                     onTap: () {
//                       _proceedToPayController.incrementDecrementDate(true);
//                     },
//                     child: Container(
//                       height: 30,
//                       width: 30,
//                       decoration: BoxDecoration(
//                           // ignore: prefer_const_literals_to_create_immutables
//                           boxShadow: [const BoxShadow(color: Colors.black12, spreadRadius: 1, offset: Offset(1, 1), blurRadius: 7)],
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15)),
//                       child: Container(
//                         child: Image.asset(
//                           AssestPath.detailScreen + 'Right.png',
//                           color: Colors.black38,
//                         ),
//                         margin: const EdgeInsets.all(9),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           /*Choose date */ Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(top: 60),
//                 alignment: Alignment.bottomCenter,
//                 height: 35,
//                 width: 169,
//                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(AppColor.maincategorySelectedTextColor)),
//                 // ignore: deprecated_member_use
//                 child: FlatButton(
//                   onPressed: () {
//                     _proceedToPayController.selectDate(context);
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         AssestPath.detailScreen + "Calander1.png",
//                         width: 20,
//                         color: Colors.white,
//                       ),
//                       const SizedBox(width: 2),
//                       Text(
//                         'chooseDate'.tr,
//                         style: TextStyle(color: Colors.white, fontFamily: AppFont.medium, fontSize: 15),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget showAvailblrStylist() {
//     return Container(
//       width: Get.width / 1.3,
//       padding: EdgeInsets.only(left: 0, right: 10, top: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.grey[50],
//       ),
//       child: ListView.builder(
//           itemCount: _proceedToPayController.arrAvailbleEmplloyee.length,
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemBuilder: (context, ind) {
//             var currentObj = _proceedToPayController.arrAvailbleEmplloyee[ind];
//             print("data = ${currentObj.empImagePath}");
//             List<String> nameList = currentObj.empName.split(' ');
//             String name = '';
//             if (nameList.length == 2) {
//               name = nameList.first[0].toUpperCase() + nameList.last[0].toUpperCase();
//             } else {
//               name = nameList.first[0].toUpperCase() + nameList.first[1].toUpperCase();
//             }
//             return InkWell(
//               onTap: () {
//                 // if (currentObj.id == null) {
//                 //   _proceedToPayController.getAvailbleTimeForStoreWithoutEmp();
//                 //   _proceedToPayController.isOpenStylist.value =
//                 //       !_proceedToPayController.isOpenStylist.value;
//                 //   _proceedToPayController.selectedStylistName.value =
//                 //       'selectStylist'.tr;
//                 //   _proceedToPayController.selectedEmpId = "";
//                 // } else {
//
//                 // }
//
//                 _proceedToPayController.selectedStylistName.value = currentObj.empName;
//                 _proceedToPayController.slectedStylistImage.value = currentObj.empImagePath;
//                 _proceedToPayController.isOpenStylist.value = !_proceedToPayController.isOpenStylist.value;
//                 _proceedToPayController.getAvailbleTimeForStoreWithEmp(empid: currentObj.id.toString());
//               },
//               child: Column(
//                 children: [
//                   Container(
//                     height: 35,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Container(
//                           height: 20,
//                           width: 20,
//                           child: currentObj.empImagePath == 'https://www.reserved4you.de/storage/app/public/default/default-user.png' ||
//                                   currentObj.empImagePath == null ||
//                                   currentObj.empImagePath == ''
//                               ? Container(
//                                   height: 20,
//                                   width: 20,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.white,
//                                     border: Border.all(color: Color(0xFFdb8a8a), width: 0.2),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       name,
//                                       style: TextStyle(
//                                         fontSize: 8,
//                                         fontWeight: FontWeight.w600,
//                                         color: Color(0xFFdb8a8a),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : CachedNetworkImage(
//                                   imageUrl: currentObj.empImagePath,
//                                   placeholder: (context, url) => Image.asset("assets/images/store_default.png"),
//                                   errorWidget: (context, url, error) => Container(
//                                         child: Text(currentObj.empName[0].toString() + currentObj.empName[1].toString()),
//                                       ),
//                                   imageBuilder: (context, imageProvider) => Container(
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(
//                                             image: imageProvider,
//                                             fit: BoxFit.cover,
//                                           ),
//                                           borderRadius: BorderRadius.circular(10),
//                                           color: Colors.transparent.withOpacity(0.2),
//                                         ),
//                                       )),
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Text(
//                           currentObj.empName,
//                           style: TextStyle(color: Colors.black, fontFamily: AppFont.regular, fontSize: 15),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                 ],
//               ),
//             );
//           }),
//     );
//   }
//
//   Widget botttomTimeSloyGrid() {
//     return Obx(
//       () => _proceedToPayController.arrAvailbleTimeSlote.length == 0
//           ? Container(
//               child: Center(
//                 child: Text(
//                   'thisDayHoliday'.tr,
//                   style: TextStyle(
//                     fontFamily: AppFont.medium,
//                     fontSize: 18,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             )
//           : GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, mainAxisSpacing: 15.0, crossAxisSpacing: 15.0, mainAxisExtent: 40),
//               itemCount: _proceedToPayController.arrAvailbleTimeSlote.length,
//               itemBuilder: (context, ind) {
//                 var currentObj = _proceedToPayController.arrAvailbleTimeSlote[ind];
//
//                 if (currentObj.flag == "Booked") {
//                   return InkWell(
//                     onTap: () {
//                       //_proceedToPayController.timeSloteSelectedInd.value = ind;
//                     },
//                     child: Obx(() => disableCelenderView(_proceedToPayController.arrAvailbleTimeSlote[ind])),
//                   );
//                 } else {
//                   return InkWell(
//                     onTap: () {
//                       _proceedToPayController.timeSloteSelectedInd.value = ind.toString();
//                     },
//                     child: Obx(() => celenderView(_proceedToPayController.arrAvailbleTimeSlote[ind], ind)),
//                   );
//                 }
//               }),
//     );
//   }
//
//   Widget shimmerBotttomTimeSloyGrid() {
//     return Shimmer.fromColors(
//       baseColor: Colors.transparent,
//       highlightColor: Colors.grey[100],
//       enabled: true,
//       period: Duration(seconds: 3),
//       child: GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, mainAxisSpacing: 15.0, crossAxisSpacing: 15.0, mainAxisExtent: 40),
//           itemCount: 20,
//           itemBuilder: (context, ind) {
//             return InkWell(
//               onTap: () {
//                 //_proceedToPayController.timeSloteSelectedInd.value = ind;
//               },
//               child: celenderViewShimmer(),
//             );
//           }),
//     );
//   }
//
// //======== Celender ==========
//
//   Widget celenderView(AvailableTimeSlot obj, int ind) {
//     return Container(
//       decoration: BoxDecoration(
//           color: _proceedToPayController.timeSloteSelectedInd.value == ind.toString() ? Colors.black : Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: Colors.black)),
//       child: Center(
//           child: Text(
//         obj.time,
//         style: TextStyle(
//           fontFamily: AppFont.medium,
//           color: _proceedToPayController.timeSloteSelectedInd.value == ind.toString() ? Colors.white : Colors.black,
//         ),
//       )),
//     );
//   }
//
//   Widget disableCelenderView(AvailableTimeSlot obj) {
//     return Container(
//       decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey[400])),
//       child: Center(
//           child: Text(
//         obj.time,
//         style: TextStyle(
//           fontFamily: AppFont.medium,
//           color: Colors.grey[400],
//         ),
//       )),
//     );
//   }
//
//   Widget celenderViewShimmer() {
//     return Container(
//       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black)),
//       child: Center(
//           child: Text(
//         "",
//         style: TextStyle(
//           fontFamily: AppFont.medium,
//           color: Colors.black,
//         ),
//       )),
//     );
//   }
// }
