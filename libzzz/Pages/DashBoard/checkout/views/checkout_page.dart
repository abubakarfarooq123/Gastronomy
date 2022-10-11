import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../controllers/checkout_controller.dart';
import '../widgets/billing_details.dart';
import '../widgets/complete_payment.dart';
import '../widgets/custom_button.dart';
import 'order_confirmation_page.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.delete<CheckoutController>();
    final CheckoutController controller = Get.put(CheckoutController());
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark

        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "Checkout Process",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            heroTag: "checkout",
            backgroundColor: Colors.white,
            onPressed: controller.onBackButtonPressed,
            mini: true,
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: appDimYellow,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 35),
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: Get.width*0.032,),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: appRedColor),
                              ),
                              SizedBox(
                                width: Get.width*0.08, /// 30
                              ),
                              Container(
                                color: appRedColor,
                                height: 1,
                                width: deviceWidth * 0.11,
                              ),
                              SizedBox(
                                width: Get.width*0.04, /// 30
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Booking\nSummary",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: appRedColor),
                          )
                        ],
                      ),
                      SizedBox(
                        width: Get.width*0.033, /// 20
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: Get.width*0.01,
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: appRedColor),
                                child: controller.step.value == 1
                                    ? const Icon(
                                        Icons.circle,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                    : SizedBox(),
                              ),
                              SizedBox(
                                width: Get.width*0.068,
                              ),
                              Container(
                                color: controller.step.value == 1
                                    ? Colors.grey.shade400
                                    : appRedColor,
                                height: 1,
                                width: deviceWidth * 0.12,
                              ),
                              SizedBox(
                                width: Get.width*0.035,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Billing\nDetails",
                            style: TextStyle(
                                color: controller.step.value == 1
                                    ? Colors.black
                                    : appRedColor),
                          )
                        ],
                      ),
                      SizedBox(
                        width: Get.width*0.0,  /// 20
                      ),
                      Column(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.step.value == 2
                                    ? appRedColor
                                    : Colors.transparent,
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.3))),
                            child: controller.step.value == 2
                                ? const Icon(
                                    Icons.circle,
                                    color: Colors.white,
                                    size: 15,
                                  )
                                : SizedBox(),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Complete\nPayment",
                            style: TextStyle(
                                color: controller.step.value != 2
                                    ? Colors.grey
                                    : controller.step.value == 2
                                        ? Colors.black
                                        : appRedColor),
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          ),
          Obx(
            () => controller.step.value == 1
                ? const BillingsDetail()
                : CompletePayment(),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
                width: deviceWidth,
                child: Obx(
                  () => CustomButton(
                    title: controller.step.value == 1
                        ? "Continue to Payment"
                        : "Proceed to Billing Detail",
                    onPressed: () {
                      if (controller.step.value == 2) {
                        // controller.openBottomSheet(context);
                        Get.to(() => OrderConfirmationPage());
                      }
                      if (controller.step.value != 2) {
                        controller.step.value++;
                      }
                    },
                  ),
                )),
          )
        ],
      ),
    );
  }
}
