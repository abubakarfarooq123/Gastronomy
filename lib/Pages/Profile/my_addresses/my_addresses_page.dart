import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';
import 'package:reserved4u/Pages/Profile/my_addresses/widgets/home_address.dart';
import 'package:reserved4u/Pages/Profile/my_addresses/widgets/my_address_selection_page.dart';
import 'package:reserved4u/Pages/Profile/my_addresses/widgets/office_address.dart';
import '../../../Helper/NotificatiokKeys.dart';
import '../../DashBoard/checkout/widgets/custom_button.dart';
import 'my_addresses_controller.dart';

// ignore: must_be_immutable
class MyAddressesPage extends StatelessWidget {
  MyAddressesPage({Key key}) : super(key: key);

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
              controller.editHome.value = false;
              controller.editOffice.value = false;
            },
            mini: true,
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
        ),
      ),
      bottomSheet: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: CustomButton(
                title: "Add Addresss",
                onPressed: () {
                  if (controller.selectedAddressTabIndex.value == 0) {
                    if (controller.homeList.isNotEmpty &&
                        controller.editHome.value) {
                      controller.checkUpdateValidation();
                    } else {
                      controller.checkValidation();
                    }
                  } else if (controller.selectedAddressTabIndex.value == 1) {
                    if (controller.officeList.isNotEmpty &&
                        controller.editHome.value) {
                      controller.checkUpdateValidation();
                    } else {
                      controller.checkValidation();
                    }
                  } else {
                    if (controller.otherList.isNotEmpty) {
                      controller.checkUpdateValidation();
                    } else {
                      controller.checkValidation();
                    }
                  }
                }),
          )),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  const SizedBox(
                    height: 94,
                    width: double.infinity,
                  ),
                  Container(
                    color: Color(AppColor.lightpink),
                    child: Container(
                      height: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.selectedAddressTabIndex.value = 0;
                            },
                            child: Obx(() => Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.04,
                                      ),
                                      Image.asset(
                                        "assets/images/checkout/home.png",
                                        color: controller
                                                    .selectedAddressTabIndex
                                                    .value ==
                                                0
                                            ? Color(AppColor.red)
                                            : Colors.grey,
                                        height: 13,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Home",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: controller
                                                        .selectedAddressTabIndex
                                                        .value ==
                                                    0
                                                ? Color(AppColor.red)
                                                : Colors.grey),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          Container(
                            height: 30,
                            width: 1.7,
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
                          GestureDetector(
                            onTap: () {
                              controller.selectedAddressTabIndex.value = 1;
                            },
                            child: Obx(() => Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.0,
                                      ),
                                      Image.asset(
                                        "assets/images/checkout/office.png",
                                        color: controller
                                                    .selectedAddressTabIndex
                                                    .value ==
                                                1
                                            ? Color(AppColor.red)
                                            : Colors.grey,
                                        height: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Office",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: controller
                                                        .selectedAddressTabIndex
                                                        .value ==
                                                    1
                                                ? Color(AppColor.red)
                                                : Colors.grey),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          Container(
                            height: 30,
                            width: 1.7,
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
                          GestureDetector(
                            onTap: () {
                              controller.selectedAddressTabIndex.value = 2;
                            },
                            child: Obx(() => Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/checkout/other.png",
                                        color: controller
                                                    .selectedAddressTabIndex
                                                    .value ==
                                                2
                                            ? Color(AppColor.red)
                                            : Colors.grey,
                                        height: 15,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Other",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: controller
                                                        .selectedAddressTabIndex
                                                        .value ==
                                                    2
                                                ? Color(AppColor.red)
                                                : Colors.grey),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.06,
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// first step circle point
                  Obx(() => Positioned(
                      top: 58,
                      left: controller.selectedAddressTabIndex.value == 0
                          ? Get.width * 0.02
                          : Get.width * 0.14,

                      /// 50
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedAddressTabIndex.value = 0;
                        },
                        child: controller.selectedAddressTabIndex.value == 0
                            ? Container(
                                width: 120,
                                height: 25,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/checkout/line.png"))),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(AppColor.red)),
                                  child: const Icon(
                                    Icons.circle,
                                    color: Colors.white,
                                    size: 13,
                                  ),
                                ),
                              )
                            : const Icon(
                                Icons.circle_outlined,
                                color: Colors.grey,
                                size: 25,
                              ),
                      ))),

                  /// second step circle point
                  Obx(() => Positioned(
                      top: 58,
                      left: controller.selectedAddressTabIndex.value == 1
                          ? Get.width * 0.339
                          : Get.width * 0.46,

                      ///140:186
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedAddressTabIndex.value = 1;
                        },
                        child: controller.selectedAddressTabIndex.value == 1
                            ? Container(
                                width: 120,
                                height: 25,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/checkout/line.png"))),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(AppColor.red)),
                                  child: const Icon(
                                    Icons.circle,
                                    color: Colors.white,
                                    size: 13,
                                  ),
                                ),
                              )
                            : const Icon(
                                Icons.circle_outlined,
                                color: Colors.grey,
                                size: 25,
                              ),
                      ))),

                  /// third step circle point
                  Obx(() => Positioned(
                      top: 58,
                      left: controller.selectedAddressTabIndex.value == 2
                          ? Get.width * 0.672
                          : Get.width * 0.79,

                      /// 270P:320
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedAddressTabIndex.value = 2;
                        },
                        child: controller.selectedAddressTabIndex.value == 2
                            ? Container(
                                width: 120,
                                height: 25,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/checkout/line.png"))),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(AppColor.red)),
                                  child: const Icon(
                                    Icons.circle,
                                    color: Colors.white,
                                    size: 13,
                                  ),
                                ),
                              )
                            : const Icon(
                                Icons.circle_outlined,
                                color: Colors.grey,
                                size: 25,
                              ),
                      ))),
                ],
              ),
              Obx(() => controller.selectedAddressTabIndex.value == 0
                  ? HomeAddress()
                  : controller.selectedAddressTabIndex.value == 1
                      ? OfficeAddress()
                      : MyAddressSelectionPage()),
            ],
          ),
          Obx(() => CommanWidget(context: context)
              .showlolder(isshowDilog: controller.showLoader.value))
        ],
      ),
    );
  }
}
