import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/resturant_detail_controller.dart';
import 'package:reserved4u/Pages/DashBoard/checkout/widgets/custom_button.dart';
import 'package:reserved4u/Pages/DashBoard/checkout/widgets/input_field.dart';
import 'package:reserved4u/Pages/DashBoard/checkout/widgets/input_field_without_icon.dart';
import 'package:reserved4u/global_variables/global_variables.dart';

import '../../../../Helper/NotificatiokKeys.dart';
import '../controllers/cart_controller.dart';
import '../widgets/checkout_rounded_button.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController controller = Get.find<CartController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getSelectedMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark

              // Status bar brightness (optional)

              ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            "My Cart",
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
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                heroTag: "cart",
                elevation: 1.0,
                backgroundColor: Color(AppColor.red),
                onPressed: () {
                  Get.back();
                  Get.back();
                  controller.clearAllVariablesData();
                },
                mini: true,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Column(
                            children: List.generate(
                              controller
                                  .selectedMenuItem.value.responseData.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.2)),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        color: Colors.grey.withOpacity(0.1),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 100,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            controller
                                                                .selectedMenuItem
                                                                .value
                                                                .responseData[
                                                                    index]
                                                                .menuData
                                                                .menuImagePath))),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      controller
                                                                  .selectedMenuItem
                                                                  .value
                                                                  .responseData[
                                                                      index]
                                                                  .menuVariant
                                                                  .name ==
                                                              null
                                                          ? controller
                                                              .selectedMenuItem
                                                              .value
                                                              .responseData[
                                                                  index]
                                                              .menuData
                                                              .itemName
                                                          : controller
                                                                  .selectedMenuItem
                                                                  .value
                                                                  .responseData[
                                                                      index]
                                                                  .menuData
                                                                  .itemName +
                                                              " " +
                                                              controller
                                                                  .selectedMenuItem
                                                                  .value
                                                                  .responseData[
                                                                      index]
                                                                  .menuVariant
                                                                  .name
                                                                  .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    controller
                                                                    .selectedMenuItem
                                                                    .value
                                                                    .responseData[
                                                                        index]
                                                                    .extras ==
                                                                null ||
                                                            controller
                                                                    .selectedMenuItem
                                                                    .value
                                                                    .responseData[
                                                                        index]
                                                                    .extras ==
                                                                ""
                                                        ? SizedBox()
                                                        : Row(
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  controller
                                                                      .selectedMenuItem
                                                                      .value
                                                                      .responseData[
                                                                          index]
                                                                      .extras
                                                                      .replaceAll(
                                                                          RegExp(
                                                                              '[^A-Za-z]'),
                                                                          '')
                                                                      .replaceAll(
                                                                          "id",
                                                                          "")
                                                                      .replaceAll(
                                                                          "title",
                                                                          "")
                                                                      .replaceAll(
                                                                          "quantity",
                                                                          ","),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal),
                                                                ),
                                                              ),
                                                              Icon(
                                                                Icons.edit,
                                                                color: Color(
                                                                    AppColor
                                                                        .red),
                                                              )
                                                            ],
                                                          )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.defaultDialog(
                                                    title: 'Comment',
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10,
                                                                  right: 10),
                                                          child:
                                                              InputFieldWithoutIcon(
                                                            maxLines: 4,
                                                            hintText:
                                                                "Write your comment",
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        CustomButton(
                                                            title: "Submit",
                                                            onPressed: () {})
                                                      ],
                                                    ));
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Icon(
                                                    Icons.messenger_outline,
                                                    color: Color(AppColor.red),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          Color(AppColor.red)),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 8),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {
                                                          if (controller
                                                                  .selectedMenuItem
                                                                  .value
                                                                  .responseData[
                                                                      index]
                                                                  .quantity >
                                                              0) {
                                                            controller
                                                                .selectedMenuItem
                                                                .value
                                                                .responseData[
                                                                    index]
                                                                .quantity--;
                                                          }
                                                          setState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: Color(
                                                              AppColor.red),
                                                        )),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Obx(() => Text(
                                                          '${controller.selectedMenuItem.value.responseData[index].quantity}',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  AppColor.red),
                                                              fontSize: 16),
                                                        )),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .selectedMenuItem
                                                              .value
                                                              .responseData[
                                                                  index]
                                                              .quantity++;
                                                          setState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Color(
                                                              AppColor.red),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
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
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.2)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Sub Total",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "${totalPrice.value}€",
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Delivery Costs",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "${deliveryCharges.value}€",
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total",
                                          style: TextStyle(
                                            color: Color(AppColor.red),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "${totalPrice.value + deliveryCharges.value}€",
                                          style: TextStyle(
                                            color: Color(AppColor.red),
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
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CheckoutRoundedButton(
                        amount: "${totalPrice.value + deliveryCharges.value}€",
                        onPressed: controller.onCheckoutButtonClick,
                      ),
                    )
                  ],
                ),
        ));
  }
}
