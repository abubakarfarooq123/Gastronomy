import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Pages/DashBoard/checkout/controllers/checkout_controller.dart';

import '../../DashBoardController.dart';
import '../constants/app_colors.dart';
import 'address_input.dart';
import 'input_field.dart';

// ignore: must_be_immutable
class BillingsDetail extends StatelessWidget {
  BillingsDetail({Key key}) : super(key: key);
  CheckoutController _checkoutController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 20),
            child: Text(
              "Contact Data",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: appRedColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          /// form
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: InputField(
                            hintText: 'firstnamehint'.tr,
                            keyboardType: TextInputType.emailAddress,
                            controller: _checkoutController.fname,
                            focusNode: _checkoutController.fNameFocus,
                            preFixIcon: Icons.person)),
                    SizedBox(
                      width: 15,
                    ),
                    Obx(() =>
                        errorText(_checkoutController.firstNameEmpty.value)),
                    Expanded(
                        child: InputField(
                            hintText: 'lastnamehint'.tr,
                            keyboardType: TextInputType.emailAddress,
                            controller: _checkoutController.lname,
                            focusNode: _checkoutController.lNameFocus,
                            preFixIcon: Icons.person)),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                InputField(
                  hintText: "Email",
                  preFixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  controller: _checkoutController.emailText,
                  enable: _checkoutController.emailEnable.value,
                  focusNode: _checkoutController.emailFocus,
                ),
                const SizedBox(
                  height: 18,
                ),
                InputField(
                  preFixIcon: Icons.phone,
                  textInputType: TextInputType.phone,
                  hintText: 'phoneNumber'.tr,
                  maxLength: 13,
                  /*keyboardType:
                TextInputType.numberWithOptions(signed: true, decimal: true),*/
                  keyboardType: TextInputType.phone,
                  controller: _checkoutController.phnNoText,
                  // focusNode: _checkoutController.phoneFocus,
                ),
                const SizedBox(
                  height: 18,
                ),
                InputField(
                  hintText: "Address",
                  preFixIcon: Icons.pin_drop_outlined,
                  textInputType: TextInputType.text,
                  keyboardType: TextInputType.streetAddress,
                  controller: _checkoutController.address,
                  focusNode: _checkoutController.phoneFocus,
                  suffix: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    width: 120,
                    decoration: BoxDecoration(
                        color: appRedColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.pin_drop_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            "Old Address",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Expanded(
                        child: InputField(
                            hintText: "Postal code",
                            keyboardType: TextInputType.number,
                            controller: _checkoutController.postalCode,
                            focusNode: _checkoutController.cityFocus,
                            preFixIcon: Icons.add_business_outlined)),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: InputField(
                            hintText: "City",
                            keyboardType: TextInputType.text,
                            controller: _checkoutController.city,
                            preFixIcon: Icons.location_city_rounded)),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                AddressInput(
                  hintText: "Write Your note about delivery (Optional)...",
                  controller: _checkoutController.commentText,
                  maxLines: 4,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget errorText(String error) {
    if (error != "") {
      return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Text(
          error,
          style: TextStyle(color: Colors.red, fontSize: 11.5),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
