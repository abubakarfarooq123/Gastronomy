import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../controllers/checkout_controller.dart';
import 'build_payment_card.dart';
import 'input_field_without_icon.dart';

class CompletePayment extends StatelessWidget {
  const CompletePayment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 20),
            child: Text(
              "Delivery Time",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: appRedColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 18, top: 20, right: 18),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print("Time");
                      Get.find<CheckoutController>().selectedIndex.value = 0;
                      Get.find<CheckoutController>()
                          .selectDeliveryTime(context);
                    },
                    child: Obx(() => Container(
                          decoration: BoxDecoration(
                              color: Get.find<CheckoutController>()
                                          .selectedIndex
                                          .value ==
                                      0
                                  ? appRedColor
                                  : appLightGrey,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${Get.find<CheckoutController>().selectedTime.value.format(context)}",
                                  style: TextStyle(
                                    color: Get.find<CheckoutController>()
                                                .selectedIndex
                                                .value ==
                                            0
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Get.find<CheckoutController>()
                                              .selectedIndex
                                              .value ==
                                          0
                                      ? Colors.white
                                      : Colors.grey,
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.find<CheckoutController>().selectedIndex.value = 1;
                    },
                    child: Obx(() => Container(
                          decoration: BoxDecoration(
                            color: Get.find<CheckoutController>()
                                        .selectedIndex
                                        .value ==
                                    1
                                ? appRedColor
                                : appLightGrey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Center(
                                child: Text(
                              "ASAP",
                              style: TextStyle(
                                  color: Get.find<CheckoutController>()
                                              .selectedIndex
                                              .value ==
                                          1
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 16),
                            )),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),

          /// tip
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 20),
            child: Text(
              "Tip",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: appRedColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 18, top: 10),
            child: Text(
              "Send a little token of thanks by tipping to delivery partner. who delivering your meal today",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.normal),
            ),
          ),

          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 10),
            child: SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Get.find<CheckoutController>().tipList.length,
                  itemBuilder: (context, index) {
                    return Obx(() => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                            onTap: () {
                              Get.find<CheckoutController>()
                                  .selectedTipIndex
                                  .value = index;
                            },
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: Get.width*0.18,
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Get.find<CheckoutController>()
                                                  .selectedTipIndex
                                                  .value ==
                                              index
                                          ? appRedColor
                                          : appLightGrey,
                                    ),
                                    height: 40,
                                    width: Get.width*0.17,
                                    alignment: Alignment.center,
                                    child: Text(
                                        Get.find<CheckoutController>()
                                            .tipList[index],
                                        style: TextStyle(
                                            color: Get.find<CheckoutController>()
                                                        .selectedTipIndex
                                                        .value ==
                                                    index
                                                ? Colors.white
                                                : Colors.black))),
                                Get.find<CheckoutController>()
                                            .selectedTipIndex
                                            .value ==
                                        index
                                    ? Positioned(
                                        right:- Get.width*0.002,
                                        top: 6,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: appRedColor)),
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.red,
                                              size: 15,
                                            )))
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                    ));
                  },
                )),
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 18,
            ),
            child: Row(
              children: [
                Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: appRedColor),
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 5,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Automatically add this tip for future orders",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 18, top: 20),
            child: Text(
              "Voucher",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: appRedColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 18, right: 18, top: 10),
            child: InputFieldWithoutIcon(
              hintText: 'Enter voucher',
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black.withOpacity(0.2)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Sub Total",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "28.00€",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Delivery Costs",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "3.00€",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                            Colors.grey,
                            Colors.black,
                            Colors.grey
                          ])),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            color: appRedColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "31.00€",
                          style: TextStyle(
                            color: appRedColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// complete payment
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 10),
            child: Text(
              "Complete Payment",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: appRedColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),

          /// payment methods
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
            child: Obx(() => Column(
                  children: [
                    Row(
                      children: [
                        BuildPaymentCard(
                          title: "Master Card",
                          imageUrl: "assets/images/checkout/master_card.png",
                          bgColor: Get.find<CheckoutController>()
                                      .selectedPaymentMethod
                                      .value ==
                                  0
                              ? appDimYellow
                              : Colors.white,
                          onTap: () {
                            Get.find<CheckoutController>()
                                .selectedPaymentMethod
                                .value = 0;
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BuildPaymentCard(
                          title: "Visa Card",
                          imageUrl: "assets/images/checkout/visa.png",
                          bgColor: Get.find<CheckoutController>()
                                      .selectedPaymentMethod
                                      .value ==
                                  1
                              ? appDimYellow
                              : Colors.white,
                          onTap: () {
                            Get.find<CheckoutController>()
                                .selectedPaymentMethod
                                .value = 1;
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BuildPaymentCard(
                          title: "Klarna",
                          imageUrl: "assets/images/checkout/klarna.png",
                          bgColor: Get.find<CheckoutController>()
                                      .selectedPaymentMethod
                                      .value ==
                                  2
                              ? appDimYellow
                              : Colors.white,
                          onTap: () {
                            Get.find<CheckoutController>()
                                .selectedPaymentMethod
                                .value = 2;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        BuildPaymentCard(
                          title: "Paypal",
                          imageUrl: "assets/images/checkout/paypal.png",
                          bgColor: Get.find<CheckoutController>()
                                      .selectedPaymentMethod
                                      .value ==
                                  3
                              ? appDimYellow
                              : Colors.white,
                          onTap: () {
                            Get.find<CheckoutController>()
                                .selectedPaymentMethod
                                .value = 3;
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BuildPaymentCard(
                          title: "Cash On Venue",
                          imageUrl: "assets/images/checkout/cash.png",
                          bgColor: Get.find<CheckoutController>()
                                      .selectedPaymentMethod
                                      .value ==
                                  4
                              ? appDimYellow
                              : Colors.white,
                          onTap: () {
                            Get.find<CheckoutController>()
                                .selectedPaymentMethod
                                .value = 4;
                            Get.find<CheckoutController>()
                                .openBottomSheet(context);
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BuildPaymentCard(
                          title: "Apple pay",
                          imageUrl: "assets/images/checkout/apple_pay.png",
                          bgColor: Get.find<CheckoutController>()
                                      .selectedPaymentMethod
                                      .value ==
                                  5
                              ? appDimYellow
                              : Colors.white,
                          onTap: () {
                            Get.find<CheckoutController>()
                                .selectedPaymentMethod
                                .value = 5;
                          },
                        ),
                      ],
                    ),
                  ],
                )),
          ),

          Obx(() => Visibility(
                visible: Get.find<CheckoutController>()
                            .selectedPaymentMethod
                            .value ==
                        4
                    ? false
                    : true,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 18, right: 18, top: 20),
                      child: InputFieldWithoutIcon(
                        hintText: "Card Number",
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, right: 18, top: 20),
                      child: Row(
                        children: const [
                          Expanded(
                            child: InputFieldWithoutIcon(
                              hintText: "(MM/YYYY)Exp...",
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: InputFieldWithoutIcon(
                              hintText: "CVV",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(() => CheckboxListTile(
                          checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            "Save Card For Next Payment",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          value: Get.find<CheckoutController>()
                              .saveCardForFuture
                              .value,
                          onChanged: (val) {
                            Get.find<CheckoutController>()
                                .saveCardForFuture
                                .value = val;
                          },
                        )),
                  ],
                ),
              )),

          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 5),
            child: Container(
              color: appLightGrey,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "By continue you are agree to our ",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "Booking Condition",
                      style: TextStyle(
                          fontSize: 12, decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
