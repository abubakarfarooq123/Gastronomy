import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../views/order_confirmation_page.dart';
import '../widgets/custom_button.dart';

class CheckoutController extends GetxController {
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  RxInt selectedIndex = 1.obs;

  List<String> tipList = [
    "0.50€",
    "1.00€",
    "2.00€",
    "3.00€",
    "Other",
  ];

  RxBool saveCardForFuture = false.obs;
  RxInt step = 1.obs;

  RxInt selectedTipIndex = 0.obs;
  RxInt selectedPaymentMethod = 0.obs;

  void onBackButtonPressed() {
    Get.back();
  }

  selectDeliveryTime(BuildContext context) async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      selectedTime.value = timeOfDay;
    }
  }

  void openBottomSheet(BuildContext context) {
    Get.bottomSheet(
        SizedBox(
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 5,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: appLightGrey,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "Suitable 23.00",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
                child: Text(
                  "25.00",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
                child: Text(
                  "30.00",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
                child: Text(
                  "40.00",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.2),
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
                child: Text(
                  "50.00",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.1),
                      fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    child: CustomButton(
                        title: "Proceed to Billing Detail",
                        onPressed: () {
                          Get.back();
                          Get.to(() => const OrderConfirmationPage());
                        }),
                  ))
            ],
          ),
        ),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))));
  }
}
