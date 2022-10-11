import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'address_input.dart';
import 'input_field.dart';

class BillingsDetail extends StatelessWidget {
  const BillingsDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
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
                  children: const [
                    Expanded(
                        child: InputField(
                            hintText: "First Name", preFixIcon: Icons.person)),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: InputField(
                            hintText: "Last Name", preFixIcon: Icons.person)),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                const InputField(
                  hintText: "Email",
                  preFixIcon: Icons.email_outlined,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 18,
                ),
                const InputField(
                  hintText: "Phone Number",
                  preFixIcon: Icons.phone,
                  textInputType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 18,
                ),
                InputField(
                  hintText: "Address",
                  preFixIcon: Icons.pin_drop_outlined,
                  textInputType: TextInputType.text,
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
                  children: const [
                    Expanded(
                        child: InputField(
                            hintText: "Postal code",
                            preFixIcon: Icons.add_business_outlined)),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: InputField(
                            hintText: "City",
                            preFixIcon: Icons.location_city_rounded)),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                const AddressInput(
                  hintText: "Write Your note about delivery (Optional)...",
                  maxLines: 4,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
