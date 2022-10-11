// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:reserved4u/Reviews/GiveFeedBack/GiveFeedBackController.dart';

// import '../../Helper/NotificatiokKeys.dart';
// import 'AllServiceDetailsModel.dart';

// // ignore: must_be_immutable
// class SelectedServices extends StatelessWidget {
//   GiveFeedBackController _feedBackcontroller =
//       Get.put(GiveFeedBackController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appbar(),
//       bottomNavigationBar: bottomNavBar(),
//       backgroundColor: Color(0xFFf7f7fa),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         height: 25,
//                         color: Color(AppColor.logoBgColor),
//                       ),
//                       Container(
//                         height: 170,
//                         color: Color(AppColor.scaffoldbgcolor),
//                         child: Center(
//                           child: Obx(() => viewCategory()),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Obx(() {
//                             if (_feedBackcontroller.selectedCategoryId.value !=
//                                 "") {
//                               return Text(
//                                 'selectsub-categorieshint'.tr,
//                                 style: TextStyle(
//                                     fontFamily: AppFont.semiBold, fontSize: 20),
//                               );
//                             } else {
//                               return SizedBox();
//                             }
//                           }),
//                         ],
//                       ),
//                       Obx(
//                         () => ListView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           scrollDirection: Axis.vertical,
//                           itemCount:
//                               _feedBackcontroller.arrAllServiceData.length,
//                           itemBuilder: (context, index) {
//                             var currentObj =
//                                 _feedBackcontroller.arrAllServiceData[index];
//                             return bottomDropDown(currentObj);
//                           },
//                         ),
//                       )
//                     ],
//                   ),
//                   categoriesSearch(),
//                   Container(
//                     margin: EdgeInsets.only(top: 70),
//                     height: Get.height,
//                     color: Color(AppColor.scaffoldbgcolor),
//                     child: Column(
//                       children: [
//                         Obx(
//                           () => Visibility(
//                             visible:
//                                 _feedBackcontroller.isSearchServicepen.value,
//                             child: Container(
//                               height: 200,
//                               child: ListView.builder(
//                                   itemCount: _feedBackcontroller
//                                       .arrSearchService.length,
//                                   itemBuilder: (context, ind) {
//                                     var currentObj = _feedBackcontroller
//                                         .arrSearchService[ind];
//                                     return InkWell(
//                                         onTap: () {
//                                           _feedBackcontroller
//                                               .selectedSubCategoryId.value = "";

//                                           _feedBackcontroller
//                                                   .selectedSubCategoryId.value =
//                                               currentObj.subcategoryId
//                                                   .toString();
//                                           _feedBackcontroller
//                                               .selectedSubCategoryWiseServiceID
//                                               .value = currentObj.id.toString();

//                                           _feedBackcontroller
//                                               .selectedServiceName
//                                               .value = currentObj.serviceName;
//                                         },
//                                         child: Obx(
//                                           () => specificationCell(currentObj),
//                                         ));
//                                   }),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Center categoriesSearch() {
//     return Center(
//       child: Container(
//         // margin: EdgeInsets.only(top: 70),
//         height: 50,
//         width: Get.width * 0.90,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//                 blurRadius: 15,
//                 color: Color(AppColor.logoBgColor),
//                 spreadRadius: 5)
//           ],
//           color: Color(AppColor.scaffoldbgcolor),
//         ),
//         child: buildTextFieldContainer(
//             searchimg: AssestPath.homeView + "Search.png",
//             hinttext: 'findbyservicehint'.tr,
//             enabled: true),
//       ),
//     );
//   }

//   AppBar appbar() {
//     return AppBar(
//       backgroundColor: Color(
//         AppColor.logoBgColor,
//       ),
//       title: Container(
//         child: Text(
//           'selectedservices'.tr,
//           style: TextStyle(
//               fontFamily: AppFont.semiBold,
//               fontSize: 18,
//               color: Color(AppColor.moneytextColor)),
//           textAlign: TextAlign.center,
//         ),
//       ),
//       centerTitle: true,
//       elevation: 0,
//       actions: [
//         InkWell(
//           onTap: () {
//             _feedBackcontroller.selectedSubCategoryId.value = "";
//             _feedBackcontroller.selectedCategoryId.value = "";
//             _feedBackcontroller.selectedSubCategoryWiseServiceID.value = "";

//             _feedBackcontroller.selectedServiceName.value = 'selectServices'.tr;
//             _feedBackcontroller.arrAllServiceData.clear();
//           },
//           child: Center(
//             child: Container(
//               padding: EdgeInsets.only(right: 10),
//               child: Text(
//                 'clear'.tr,
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontFamily: AppFont.medium,
//                     decoration: TextDecoration.underline),
//               ),
//             ),
//           ),
//         )
//       ],
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

//   Widget bottomDropDown(AllServiceData currentObj) {
//     return Stack(
//       children: [
//         Center(
//           child: Obx(() => Container(
//                 margin: EdgeInsets.only(top: 10),
//                 height: 45,
//                 width: Get.width * 0.90,
//                 decoration: BoxDecoration(
//                   borderRadius: currentObj.isBottomContainerOpen.value == false
//                       ? BorderRadius.circular(15)
//                       : BorderRadius.only(
//                           topLeft: Radius.circular(15),
//                           topRight: Radius.circular(15)),
//                   color: currentObj.isBottomContainerOpen.value == false
//                       ? Color(AppColor.scaffoldbgcolor)
//                       : Colors.black,
//                 ),
//                 child: InkWell(
//                   onTap: () => currentObj.isBottomContainerOpen.value =
//                       !currentObj.isBottomContainerOpen.value,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: 20,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         currentObj.name,
//                         style: TextStyle(
//                             color:
//                                 currentObj.isBottomContainerOpen.value == false
//                                     ? Colors.black
//                                     : Colors.white,
//                             fontFamily: AppFont.regular,
//                             fontSize: 15),
//                       ),
//                       Spacer(),
//                       if (currentObj.serviceSubcategory.length > 0)
//                         iconButton(currentObj),
//                     ],
//                   ),
//                 ),
//               )),
//         ),
//         Obx(
//           () => Visibility(
//             visible: currentObj.isBottomContainerOpen.value,
//             child: dropDownContainer(currentObj),
//           ),
//         )
//       ],
//     );
//   }

//   Container iconButton(AllServiceData currentObj) {
//     return Container(
//       child: IconButton(
//           icon: currentObj.isBottomContainerOpen.value == false
//               ? Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 30)
//               : Icon(Icons.keyboard_arrow_up, color: Colors.white, size: 30),
//           onPressed: () {
//             currentObj.isBottomContainerOpen.value =
//                 !currentObj.isBottomContainerOpen.value;
//           }),
//     );
//   }

//   Widget dropDownContainer(AllServiceData currentObj) {
//     return Center(
//       child: Container(
//         margin: EdgeInsets.only(top: 55),
//         width: Get.width * 0.90,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(15),
//                 bottomRight: Radius.circular(15)),
//             color: Color(AppColor.scaffoldbgcolor)),
//         child: ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: currentObj.serviceSubcategory.length,
//             itemBuilder: (context, ind) {
//               var obj = currentObj.serviceSubcategory[ind];
//               return InkWell(
//                 onTap: () {
//                   _feedBackcontroller.selectedSubCategoryId.value = "";

//                   _feedBackcontroller.selectedSubCategoryId.value =
//                       obj.subcategoryId.toString();
//                   _feedBackcontroller.selectedSubCategoryWiseServiceID.value =
//                       obj.id.toString();

//                   _feedBackcontroller.selectedServiceName.value =
//                       obj.serviceName;
//                 },
//                 child: Obx(
//                   () => specificationCell(obj),
//                 ),
//               );
//             }),
//       ),
//     );
//   }

//   Widget bottomNavBar() {
//     return InkWell(
//       onTap: () {
//         Get.back();
//       },
//       child: Container(
//         height: 80,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(15), topRight: Radius.circular(15)),
//             color: Color(0xFFdb8a8a)),
//         child: Center(
//           child: Text('done'.tr,
//               style: TextStyle(
//                   fontFamily: AppFont.semiBold,
//                   fontSize: 15,
//                   color: Color(AppColor.scaffoldbgcolor))),
//         ),
//       ),
//     );
//   }

//   Widget viewCategory() {
//     return Container(
//       width: Get.width,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         // ignore: invalid_use_of_protected_member
//         itemCount: _feedBackcontroller.arrCategory.value.length,
//         itemBuilder: (context, ind) {
//           // ignore: invalid_use_of_protected_member
//           var currentObj = _feedBackcontroller.arrCategory.value[ind];

//           return InkWell(
//               onTap: () {
//                 _feedBackcontroller.selectedCategoryId.value =
//                     currentObj.categoryId.toString();
//                 _feedBackcontroller.getAllServiceDataAccrodingCat();
//               },
//               child: Obx(
//                 () => Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(15),
//                       margin: EdgeInsets.only(left: 12, top: 20),
//                       width: 65,
//                       height: 65,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(35),
//                         color: _feedBackcontroller.selectedCategoryId.value ==
//                                 currentObj.categoryId.toString()
//                             ? Color(0xFFdb8a8a)
//                             : Color(AppColor.logoBgColor),
//                       ),
//                       child: SvgPicture.network(
//                         currentObj.categoryImagePath,
//                         color: _feedBackcontroller.selectedCategoryId.value ==
//                                 currentObj.categoryId.toString()
//                             ? Colors.white
//                             : Color(0xFF242c39),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(
//                         left: 20,
//                       ),
//                       child: Text(
//                         currentObj.categoryName,
//                         style: TextStyle(
//                             fontFamily: AppFont.medium,
//                             color:
//                                 _feedBackcontroller.selectedCategoryId.value ==
//                                         currentObj.id.toString()
//                                     ? Color(0xFFdb8a8a)
//                                     : Color(0xFF878c93),
//                             fontSize: 15),
//                       ),
//                     )
//                   ],
//                 ),
//               ));
//         },
//       ),
//     );
//   }

//   Widget specificationCell(AllServiceServiceSubcategory obj) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(15, 10, 3, 5),
//       child: Row(
//         children: [
//           Container(
//             height: 20,
//             width: 20,
//             child: _feedBackcontroller.selectedSubCategoryWiseServiceID.value ==
//                     obj.id.toString()
//                 ? Image.asset(AssestPath.homeView + "checkBoxSelected.png")
//                 : Image.asset(
//                     AssestPath.homeView + "checkBoxUnSelected.png",
//                     color: Color(0xFFe8e8ec),
//                   ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Text(
//             obj.serviceName,
//             style: TextStyle(
//               fontFamily: AppFont.regular,
//               fontSize: 12,
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Container buildTextFieldContainer(
//       {String hinttext, String searchimg, bool enabled = true}) {
//     return Container(
//         alignment: Alignment.center,
//         margin: EdgeInsets.only(
//           left: 20,
//           right: 10,
//         ),
//         child: TextField(
//           onChanged: (str) {
//             if (str.isEmpty) {
//               _feedBackcontroller.isSearchServicepen.value = false;
//             } else {
//               _feedBackcontroller.getAllServiceFromSearch(str);
//             }
//           },
//           textAlignVertical: TextAlignVertical.center,
//           enabled: enabled,
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: "$hinttext",
//             hintStyle: TextStyle(
//                 fontFamily: AppFont.regular, color: Color(0xFFafb3b8)),
//             floatingLabelBehavior: FloatingLabelBehavior.never,
//             icon: Image.asset(
//               AssestPath.homeView + "Search.png",
//               height: 20,
//               color: Colors.black,
//             ),
//           ),
//         ));
//   }
// }
