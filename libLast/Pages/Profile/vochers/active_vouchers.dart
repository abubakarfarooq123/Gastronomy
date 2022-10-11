import 'dart:ui';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Pages/Profile/vochers/my_voucher_controller.dart';

import '../../../Helper/NotificatiokKeys.dart';

class ActiveVouchers extends StatelessWidget {
  final MyVoucherController controller = Get.put(MyVoucherController());
  @override
  Widget build(BuildContext context) {
    return controller.activeArray.length == 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/noVouchers.svg"),
              SizedBox(height: 10),
              Text("You don't have any Vouchers to use!",
                  style: TextStyle(
                      color: Color(0xFF7B7B7B),
                      fontWeight: FontWeight.w400,
                      fontSize: 16)),
              SizedBox(height: 30)
            ],
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: controller.activeArray.length,
            itemBuilder: (context, index) {
              return Obx(
                () => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(10)),
                    child: Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/checkout/img1.jpg"))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                controller.activeArray[index].startPeriod ==
                                            null &&
                                        controller
                                                .activeArray[index].endPeriod ==
                                            null
                                    ? Container()
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white
                                                  .withOpacity(0.85),
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            child: Text(
                                                "${controller.activeArray[index].startPeriod} - ${controller.activeArray[index].endPeriod}"),
                                          ),
                                        ),
                                      ),

                                Container(
                                  height: 50,
                                  color: Colors.grey.withOpacity(0.5),
                                  child: ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 5.0,
                                        sigmaY: 5.0,
                                      ),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.1),
                                        child: Center(
                                          child: Text(
                                            "${controller.activeArray[index].createdBy}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // const Center(
                                //   child:  Text(
                                //     "SkyKitchen",
                                //     style: TextStyle(
                                //       color: Colors.white,
                                //       fontSize: 22
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Chicken Pizza",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  controller.activeArray[index].discountType ==
                                          "percentage"
                                      ? "${controller.activeArray[index].discount}%"
                                      : "${controller.activeArray[index].discount}€",
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Color(AppColor.red)),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const DottedLine(
                            direction: Axis.horizontal,
                            lineLength: double.infinity,
                            lineThickness: 2.0,
                            dashLength: 4.0,
                            dashColor: Colors.grey,
                            dashRadius: 0.0,
                            dashGapLength: 4.0,
                            dashGapColor: Colors.transparent,
                            dashGapRadius: 0.0,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              color: Colors.grey.shade100,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.activeArray[index].voucherCode,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    IconButton(
                                      splashColor: Colors.transparent,
                                      icon: const Icon(
                                        Icons.copy,
                                        color: Colors.blue,
                                        size: 15,
                                      ),
                                      onPressed: () {
                                        Clipboard.setData(const ClipboardData(
                                                text:
                                                    "45eg67urhr94j504tnf945g94"))
                                            .then((_) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "coupon code copied")));
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
