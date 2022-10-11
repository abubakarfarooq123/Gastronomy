import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';

import '../../../Helper/NotificatiokKeys.dart';
import '../../DashBoard/checkout/constants/app_colors.dart';
import '../../DashBoard/checkout/widgets/custom_button.dart';
import 'my_addresses_controller.dart';
import 'my_addresses_page.dart';

// ignore: must_be_immutable
class MyAddressHome extends StatelessWidget {
  MyAddressHome({Key key}) : super(key: key);

  MyAddressesController controller = Get.put(MyAddressesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "My Addresses",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              Get.back();
            },
            mini: true,
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height - 200,
                  width: MediaQuery.of(context).size.width,
                  child: Obx(
                    () => controller.homeList.isEmpty &&
                            controller.officeList.isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  "assets/images/noAddressFound.svg"),
                              SizedBox(height: 10),
                              Text("You don't have any addresses yet!",
                                  style: TextStyle(
                                      color: Color(0xFF7B7B7B),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16))
                            ],
                          )
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Obx(() => controller.homeList.isNotEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: GestureDetector(
                                            onTap: () {
                                              controller.selectedAddressType
                                                  .value = 0;
                                              print("home " +
                                                  controller
                                                      .selectedAddressType.value
                                                      .toString());
                                            },
                                            onLongPress: () {
                                              print("object");
                                              Get.defaultDialog(
                                                content: Container(
                                                  width: 300,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 12),
                                                    child: Column(
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              Get.back();
                                                              controller
                                                                  .selectedAddressTabIndex
                                                                  .value = 0;
                                                              controller
                                                                  .selectedAddressType
                                                                  .value = 0;
                                                              controller
                                                                  .editHome
                                                                  .value = true;
                                                              Get.to(
                                                                  MyAddressesPage());
                                                            },
                                                            child: Container(
                                                              height: 60,
                                                              width: Get.width,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      AppColor
                                                                          .textFieldBg),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15)),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        15),
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .edit,
                                                                      color: Color(
                                                                          AppColor
                                                                              .red),
                                                                      size: 28,
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            10),
                                                                    Text(
                                                                      "Edit",
                                                                      style: TextStyle(
                                                                          fontFamily: AppFont
                                                                              .medium,
                                                                          fontSize:
                                                                              18),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )),
                                                        SizedBox(height: 10),
                                                        InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .selectedAddressType
                                                                  .value = 0;

                                                              controller
                                                                  .deleteAddressFromServer();
                                                            },
                                                            child: Container(
                                                              height: 60,
                                                              width: Get.width,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      AppColor
                                                                          .textFieldBg),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15)),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        15),
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .delete,
                                                                      size: 28,
                                                                      color: Color(
                                                                          AppColor
                                                                              .red),
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            10),
                                                                    Text(
                                                                      "Delete",
                                                                      style: TextStyle(
                                                                          fontFamily: AppFont
                                                                              .medium,
                                                                          fontSize:
                                                                              18),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )),
                                                        SizedBox(height: 10),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                title: "Choose",
                                                titleStyle: TextStyle(
                                                    fontSize: 25,
                                                    fontFamily: AppFont.bold),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: appDimYellow,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 50,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            color: Color(
                                                                AppColor.red),
                                                          ),
                                                          child: Image.asset(
                                                              "assets/images/checkout/ep_location-information.png"),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                              "Home Address",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 14),
                                                            ),
                                                            SizedBox(
                                                              height: 3,
                                                            ),
                                                            Text(
                                                              controller
                                                                      .homeList
                                                                      .first
                                                                      .streetName +
                                                                  " " +
                                                                  controller
                                                                      .homeList
                                                                      .first
                                                                      .houseNo +
                                                                  " " +
                                                                  controller
                                                                      .homeList
                                                                      .first
                                                                      .bellName
                                                                      .toString() +
                                                                  "\n " +
                                                                  controller
                                                                      .homeList
                                                                      .first
                                                                      .postcode +
                                                                  " " +
                                                                  controller
                                                                      .homeList
                                                                      .first
                                                                      .city,
                                                              // "Andsberger Allle 65 im andel’s Hoteconst l\nBerlin, 12369 Berlin",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.5)),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    controller.selectedAddressType
                                                                .value ==
                                                            0
                                                        ? Container(
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Color(
                                                                    AppColor
                                                                        .red)),
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: Icon(
                                                                Icons.circle,
                                                                color: Colors
                                                                    .white,
                                                                size: 8,
                                                              ),
                                                            ))
                                                        : Container(
                                                            width: 15,
                                                            height: 15,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey)),
                                                          )
                                                  ],
                                                ),
                                              ),
                                            )),
                                      )
                                    : Container()),
                                Obx(() => controller.officeList.isNotEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: GestureDetector(
                                            onTap: () {
                                              controller.selectedAddressType
                                                  .value = 1;
                                              print("office " +
                                                  controller
                                                      .selectedAddressType.value
                                                      .toString());
                                            },
                                            onLongPress: () {
                                              Get.defaultDialog(
                                                content: Container(
                                                  width: 300,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 12),
                                                    child: Column(
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              Get.back();
                                                              controller
                                                                  .selectedAddressTabIndex
                                                                  .value = 1;
                                                              controller
                                                                  .selectedAddressType
                                                                  .value = 1;
                                                              controller
                                                                  .editOffice
                                                                  .value = true;
                                                              Get.to(
                                                                  MyAddressesPage());
                                                            },
                                                            child: Container(
                                                              height: 60,
                                                              width: Get.width,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      AppColor
                                                                          .textFieldBg),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15)),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        15),
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .edit,
                                                                      color: Color(
                                                                          AppColor
                                                                              .red),
                                                                      size: 28,
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            10),
                                                                    Text(
                                                                      "Edit",
                                                                      style: TextStyle(
                                                                          fontFamily: AppFont
                                                                              .medium,
                                                                          fontSize:
                                                                              18),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )),
                                                        SizedBox(height: 10),
                                                        InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .selectedAddressType
                                                                  .value = 1;

                                                              controller
                                                                  .deleteAddressFromServer();
                                                            },
                                                            child: Container(
                                                              height: 60,
                                                              width: Get.width,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      AppColor
                                                                          .textFieldBg),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15)),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        15),
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .delete,
                                                                      size: 28,
                                                                      color: Color(
                                                                          AppColor
                                                                              .red),
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            10),
                                                                    Text(
                                                                      "Delete",
                                                                      style: TextStyle(
                                                                          fontFamily: AppFont
                                                                              .medium,
                                                                          fontSize:
                                                                              18),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )),
                                                        SizedBox(height: 10),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                title: "Choose",
                                                titleStyle: TextStyle(
                                                    fontSize: 25,
                                                    fontFamily: AppFont.bold),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: appDimYellow,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 50,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            color: Color(
                                                                AppColor.red),
                                                          ),
                                                          child: Image.asset(
                                                              "assets/images/checkout/ep_location-information.png"),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                              "Office Address",
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 14),
                                                            ),
                                                            SizedBox(
                                                              height: 3,
                                                            ),
                                                            Text(
                                                              controller
                                                                      .officeList
                                                                      .first
                                                                      .streetName +
                                                                  " " +
                                                                  controller
                                                                      .officeList
                                                                      .first
                                                                      .houseNo +
                                                                  " " +
                                                                  controller
                                                                      .officeList
                                                                      .first
                                                                      .bellName
                                                                      .toString() +
                                                                  "\n" +
                                                                  controller
                                                                      .officeList
                                                                      .first
                                                                      .postcode +
                                                                  " " +
                                                                  controller
                                                                      .officeList
                                                                      .first
                                                                      .city,
                                                              // "Andsberger Allle 65 im andel’s Hoteconst l\nBerlin, 12369 Berlin",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.5)),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    controller.selectedAddressType
                                                                .value ==
                                                            1
                                                        ? Container(
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Color(
                                                                    AppColor
                                                                        .red)),
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: Icon(
                                                                Icons.circle,
                                                                color: Colors
                                                                    .white,
                                                                size: 8,
                                                              ),
                                                            ))
                                                        : Container(
                                                            width: 15,
                                                            height: 15,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey)),
                                                          )
                                                  ],
                                                ),
                                              ),
                                            )),
                                      )
                                    : Container()),
                                Obx(() => controller.homeList.isNotEmpty &&
                                        controller.selectedAddressType.value ==
                                            0
                                    ? Container(
                                        height: 400,
                                        child: Obx(
                                          () => GoogleMap(
                                              initialCameraPosition:
                                                  controller.kGooglePlex,
                                              key: key,
                                              markers: controller.markers.values
                                                  .toSet(),
                                              zoomControlsEnabled: false,
                                              zoomGesturesEnabled: false,
                                              mapType: MapType.normal,
                                              onMapCreated: controller
                                                  .zoomForPerticuarIndex),
                                        ))
                                    : Container(
                                        height: 0,
                                      )),
                                Obx(() => controller.officeList.isNotEmpty &&
                                        controller.selectedAddressType.value ==
                                            1
                                    ? Container(
                                        height: 400,
                                        child: Obx(
                                          () => GoogleMap(
                                              initialCameraPosition:
                                                  controller.kGooglePlex2,
                                              markers: controller.marker2.values
                                                  .toSet(),
                                              zoomControlsEnabled: false,
                                              zoomGesturesEnabled: false,
                                              mapType: MapType.normal,
                                              onMapCreated: controller
                                                  .onMapCreatedOffice),
                                        ))
                                    : Container(
                                        height: 0,
                                      ))
                                // Expanded(
                                //     child: Padding(
                                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                                //   child: ClipRRect(
                                //       borderRadius:
                                //           const BorderRadius.all(Radius.circular(10)),
                                //       child: Column(
                                //         children: [

                                //         ],
                                //       )),
                                // )),
                                // Expanded(
                                //     child: Obx(() => controller
                                //                 .officeList.isNotEmpty &&
                                //             controller.selectedAddressType.value == 1
                                //         ? Padding(
                                //             padding: const EdgeInsets.symmetric(
                                //                 horizontal: 20),
                                //             child: SizedBox(
                                //               child: ClipRRect(
                                //                   borderRadius:
                                //                       const BorderRadius.all(
                                //                           Radius.circular(10)),
                                //                   child: GoogleMap(
                                //                       initialCameraPosition:
                                //                           controller.kGooglePlex2,
                                //                       markers: controller
                                //                           .marker2.values
                                //                           .toSet(),
                                //                       zoomControlsEnabled: false,
                                //                       zoomGesturesEnabled: false,
                                //                       mapType: MapType.normal,
                                //                       onMapCreated: controller
                                //                           .onMapCreatedOffice)),
                                //             ))
                                //         : Container())),
                              ],
                            ),
                          ),
                  ))
            ],
          ),
          Obx(() => CommanWidget(context: context)
              .showlolder(isshowDilog: controller.showLoader.value))
        ],
      ),
      bottomSheet: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: CustomButton(
                title: "Add Address",
                onPressed: () {
                  Get.to(MyAddressesPage());
                }),
          )),
    );
  }
}
