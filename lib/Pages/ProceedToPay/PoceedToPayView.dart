// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:reserved4u/Helper/NotificatiokKeys.dart';
// import 'package:reserved4u/Helper/commanFuncation.dart';
// import 'package:reserved4u/Helper/commanWidgets.dart';
// import 'package:reserved4u/Pages/ProceedToPay/ProceedToPayController.dart';
// import 'package:reserved4u/Pages/ProceedToPay/SelectedServiceModel.dart';
//
// // ignore: must_be_immutable
// class ProceedToPayView extends StatefulWidget {
//   @override
//   _ProceedToPayViewState createState() => _ProceedToPayViewState();
// }
//
// class _ProceedToPayViewState extends State<ProceedToPayView> {
//   ProceedToPayController _proceedToPayController = Get.put(ProceedToPayController());
//
//   @override
//   void initState() {
//     super.initState();
//     _proceedToPayController.onInit();
// /*    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       systemNavigationBarColor: Colors.black,
//         statusBarIconBrightness: Brightness.dark,
//       systemNavigationBarIconBrightness:  Brightness.light,
//
//
//       statusBarColor: Color(
//         //AppColor.logoBgColor,
//           AppColor.black
//       ), //
//       // status bar color
//     ));*/
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(50),
//         child: appbar(),
//       ),
//       bottomNavigationBar: bottomNavBar(),
//       backgroundColor: Color(AppColor.scaffoldbgcolor),
//       body: Stack(
//         children: [
//           Obx(() => ListView.builder(
//               //shrinkWrap: true,
//               //physics: NeverScrollableScrollPhysics(),
//               scrollDirection: Axis.vertical,
//               itemCount: _proceedToPayController.arrSelectedServices.length,
//               itemBuilder: (context, ind) {
//                 var currentObj = _proceedToPayController.arrSelectedServices[ind];
//                 return mainCellStack(currentObj, ind);
//               })),
//           Obx(() => CommanWidget(context: context).showlolder(isshowDilog: _proceedToPayController.isLoader.value)),
//         ],
//       ),
//     );
//   }
//
//   //
//
//   AppBar appbar() {
//     return AppBar(
//       backgroundColor: Color(
//         AppColor.scaffoldbgcolor,
//       ),
//       leading: Container(
//         margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
//         height: 35.0,
//         width: 35.0,
//         child: FittedBox(
//           child: FloatingActionButton(
//             heroTag: 'btn6',
//             onPressed: () {
//               Get.back();
//             },
//             child: Icon(
//               Icons.arrow_back_ios_outlined,
//               color: Colors.black,
//             ),
//             backgroundColor: Color(AppColor.scaffoldbgcolor),
//           ),
//         ),
//       ),
//       actions: [
//         Container(
//           margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
//           height: 35.0,
//           width: 35.0,
//           child: FittedBox(
//             child: FloatingActionButton(
//               heroTag: 'btn7',
//               onPressed: () {
//                 Get.back();
//               },
//               child: Icon(
//                 Icons.add,
//                 color: Color(AppColor.scaffoldbgcolor),
//               ),
//               backgroundColor: Color(0xFFdb8a8a),
//             ),
//           ),
//         ),
//       ],
//       title: Text(
//         'proccedTopay2'.tr,
//         style: TextStyle(fontFamily: AppFont.semiBold, color: Colors.black, fontSize: 16),
//       ),
//       centerTitle: true,
//       elevation: 0,
//     );
//   }
//
//   Column mainCellStack(SelectedServiceModel currentObj, int currentIndex) {
//     return Column(
//       children: [
//         Stack(
//           children: [
//             Container(
//               margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//               height: 110,
//               color: Color(AppColor.logoBgColor),
//               child: Row(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.fromLTRB(15, 0, 20, 25),
//                     padding: EdgeInsets.all(15),
//                     height: 60,
//                     width: 60,
//                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(35), color: Color(AppColor.scaffoldbgcolor)),
//                     child: SvgPicture.network(
//                       currentObj.categoryImagePath,
//                       color: Color(0xFFdb8a8a),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           currentObj.name,
//                           style: TextStyle(fontFamily: AppFont.bold, fontSize: 20),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             _proceedToPayController.currentSelectedIndex = currentIndex;
//                             var storeId = currentObj.servicecategory.first.storeId.toString();
//                             _proceedToPayController.getServiceViseEmployee(serviceid: currentObj.id.toString(), storeid: storeId);
//                             _proceedToPayController.getAvailbleTimeForStoreWithoutEmp();
//                             Get.toNamed("/timeSlotForService");
//                             // Get.to(TimeSlotForService());
//                           },
//                           child: Container(
//                             width: Get.width - 100,
//                             child: Text(
//                               'chooseStylistandSetDate'.tr,
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 2,
//                               style: TextStyle(letterSpacing: 1, decoration: TextDecoration.underline, fontFamily: AppFont.medium, fontSize: 13, color: Color(0xFFdb8a8a)),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             currentObj.appodatetemp.isEmpty
//                 ? Obx(() => _proceedToPayController.showErrorBox.isTrue ? errorContainer(currentObj.name) : SizedBox())
//                 : dateAndTimeContainer(currentObj)
//             //dateAndTimeContainer(currentObj)
//           ],
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         Container(
//           child: ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               scrollDirection: Axis.vertical,
//               itemCount: currentObj.servicecategory.length,
//               itemBuilder: (context, ind) {
//                 var serviceC = currentObj.servicecategory[ind];
//                 return urlimgContainer(serviceC, context);
//               }),
//         ),
//         SizedBox(
//           height: 20,
//         )
//       ],
//     );
//   }
//
//   Container urlimgContainer(Servicecategory currentobj, BuildContext context) {
//     return Container(
//       margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
//       width: Get.width,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(width: 2, color: Color(0xFFf5f5f7))),
//       child: Column(
//         children: [
//           Container(
//             height: Get.height * 0.13,
//             width: Get.width,
//             color: Color(0xFFf9f9fb),
//             child: Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.fromLTRB(15, 10, 15, 12),
//                   height: 82,
//                   width: 130,
//                   child: CachedNetworkImage(
//                     imageUrl: currentobj.serviceImagePath,
//                     placeholder: (context, url) => Image.asset("assets/images/store_default.png"),
//                     errorWidget: (context, url, error) => Image.asset(
//                       "assets/images/store_default.png",
//                       fit: BoxFit.cover,
//                     ),
//                     imageBuilder: (context, imageProvider) => Container(
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: imageProvider,
//                           fit: BoxFit.cover,
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.transparent.withOpacity(0.2),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//                       child: SizedBox(
//                         width: Get.width * 0.40,
//                         child: Text(
//                           currentobj.serviceName,
//                           style: TextStyle(fontSize: 16, fontFamily: AppFont.bold),
//                           softWrap: true,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 3,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 scrollDirection: Axis.vertical,
//                 itemCount: currentobj.serviceVariant.length,
//                 itemBuilder: (context, ind) {
//                   return serviceVarientCell(currentobj.serviceVariant[ind], context);
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Column serviceVarientCell(SelectedServiceVariant currentObj, BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: Get.width * 0.43,
//                     child: Text(
//                       currentObj.description == null ? " - " : currentObj.description,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         fontFamily: AppFont.semiBold,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     /*CommonVariables(context: context).durationToString(
//                         int.parse(currentObj.durationOfService)),*/
//                     "${currentObj.durationOfService} min",
//                     style: TextStyle(
//                       fontFamily: AppFont.regular,
//                       fontSize: 13,
//                       color: Color(0xFF9fa3a9),
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                 ],
//               ),
//               Spacer(),
//               Text(
//                 '${currentObj.vpricefinal}' + appStaticPriceSymbol,
//                 style: TextStyle(
//                   fontFamily: AppFont.medium,
//                   fontSize: 13,
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   _proceedToPayController.cancelService(
//                     serviceid: currentObj.serviceId.toString(),
//                     servicevariantid: currentObj.serviceVariantId.toString(),
//                     storeid: currentObj.storeid.toString(),
//                   );
//                 },
//                 child: Container(
//                   margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                   height: 35,
//                   width: 80,
//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black),
//                   child: Center(child: Text('clear'.tr, style: TextStyle(color: Color(AppColor.scaffoldbgcolor), fontFamily: AppFont.semiBold))),
//                 ),
//               )
//             ],
//           ),
//         ),
//         Divider(
//           height: 0,
//         )
//       ],
//     );
//   }
//
//   Container bottomNavBar() {
//     return Container(
//         padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
//         height: 80,
//         width: Get.width,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
//           color: Color(0xFFdb8a8a),
//         ),
//         child: Container(
//           margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
//           child: InkWell(
//             onTap: () async {
//               _proceedToPayController.checkIfDateAndTimeSelectedThenGoToNext();
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'letsCheckout'.tr,
//                   style: TextStyle(color: Color(AppColor.scaffoldbgcolor), fontFamily: AppFont.semiBold, fontSize: 18),
//                 ),
//                 Obx(
//                   () => Text(
//                     'totalBooking'.tr + "\n" + "${_proceedToPayController.totalPrice.value.toStringAsFixed(2)} " + appStaticPriceSymbol,
//                     style: TextStyle(
//                       color: Colors.grey[300],
//                     ),
//                     textAlign: TextAlign.right,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
//
//   Container dateAndTimeContainer(SelectedServiceModel obj) {
//     List<String> nameList = obj.empname.split(' ');
//     String name = '';
//     if (nameList.length == 2) {
//       name = nameList.first[0].toUpperCase() + nameList.last[0].toUpperCase();
//     } else {
//       name = nameList.first[0].toUpperCase() + nameList.first[1].toUpperCase();
//     }
//     return Container(
//       margin: EdgeInsets.fromLTRB(15, 85, 15, 0),
//       height: 55,
//       width: Get.width * 90,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(color: Color(0xFFfffdfd), width: 4),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey[300],
//           ),
//         ],
//         color: Color(0xFFdb8a8a),
//       ),
//       child: Row(
//         children: [
//           Container(
//             margin: EdgeInsets.fromLTRB(10, 0, 15, 0),
//             height: 35,
//             width: 35,
//             child: obj.empimage == 'https://www.reserved4you.de/storage/app/public/default/default-user.png' || obj.empimage == null || obj.empimage == ''
//                 ? Container(
//                     height: 35,
//                     width: 35,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                     ),
//                     child: Center(
//                       child: Text(
//                         name,
//                         style: TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xFFdb8a8a),
//                         ),
//                       ),
//                     ),
//                   )
//                 : CachedNetworkImage(
//                     imageUrl: obj.empimage,
//                     placeholder: (context, url) => Image.asset("assets/images/store_default.png"),
//                     errorWidget: (context, url, error) => Container(
//                       height: 35,
//                       width: 35,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Color(AppColor.scaffoldbgcolor),
//                         image: DecorationImage(image: AssetImage("assets/images/defaultuser.png")),
//                       ),
//                     ),
//                     imageBuilder: (context, imageProvider) => Container(
//                       height: 35,
//                       width: 35,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Color(AppColor.scaffoldbgcolor),
//                         image: DecorationImage(
//                           image: imageProvider,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Icon(
//                     Icons.date_range,
//                     size: 13,
//                     color: Color(AppColor.scaffoldbgcolor),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     obj.appodatetemp,
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 2,
//                     style: TextStyle(color: Color(AppColor.scaffoldbgcolor), fontSize: 12, fontFamily: AppFont.semiBold),
//                   ),
//                   Container(
//                     margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
//                     height: 15,
//                     width: 1,
//                     color: Color(
//                       AppColor.scaffoldbgcolor,
//                     ),
//                   ),
//                   Icon(
//                     Icons.alarm,
//                     color: Color(
//                       AppColor.scaffoldbgcolor,
//                     ),
//                     size: 13,
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     obj.appotime,
//                     style: TextStyle(color: Color(AppColor.scaffoldbgcolor), fontSize: 12, fontFamily: AppFont.semiBold),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 3,
//               ),
//               Text(
//                 obj.empname,
//                 style: TextStyle(color: Color(AppColor.textFieldBg), fontSize: 12, fontFamily: AppFont.semiBold),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   Container errorContainer(String serviceName) {
//     return Container(
//       margin: EdgeInsets.fromLTRB(15, 85, 15, 0),
//       height: 55,
//       width: Get.width * 90,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(color: Color(0xFFfffdfd), width: 4),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey[300],
//           ),
//         ],
//         color: Color(0xFFf33738),
//       ),
//       child: Row(
//         children: [
//           Container(
//             margin: EdgeInsets.fromLTRB(10, 0, 15, 0),
//             padding: EdgeInsets.all(8),
//             height: 35,
//             width: 35,
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(AppColor.scaffoldbgcolor)),
//             child: Image.asset(AssestPath.detailScreen + "warning.png"),
//           ),
//           SizedBox(
//             width: MediaQuery.of(context).size.width / 1.4,
//             child: Text(
//               'pleaseChooseDate'.tr + " $serviceName " + 'servicesText'.tr,
//               overflow: TextOverflow.ellipsis,
//               maxLines: 2,
//               style: TextStyle(
//                 color: Color(AppColor.scaffoldbgcolor),
//                 fontSize: 13,
//                 fontFamily: AppFont.regular,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
