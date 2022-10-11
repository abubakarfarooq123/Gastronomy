import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../my_addresses_controller.dart';
import 'asset_image_input_field.dart';

class OfficeAddress extends StatefulWidget {
  @override
  State<OfficeAddress> createState() => _OfficeAddressState();
}

class _OfficeAddressState extends State<OfficeAddress> {
  MyAddressesController controller = Get.put(MyAddressesController());
  @override
  void initState() {
    if (controller.officeList.isNotEmpty && controller.editOffice.value) {
      controller.street =
          TextEditingController(text: controller.officeList.first.streetName);
      controller.house =
          TextEditingController(text: controller.officeList.first.houseNo);
      controller.city =
          TextEditingController(text: controller.officeList.first.city);
      controller.postalCode =
          TextEditingController(text: controller.officeList.first.postcode);
      controller.bellName =
          TextEditingController(text: controller.officeList.first.bellName);
      controller.floor =
          TextEditingController(text: controller.officeList.first.floor);
      controller.officeNum =
          TextEditingController(text: controller.officeList.first.officeNo);
      controller.entrance =
          TextEditingController(text: controller.officeList.first.entrance);
      controller.lati.value = controller.officeList.first.latitude;
      controller.longi.value = controller.officeList.first.longitude;
      controller.kGoogle = CameraPosition(
        target: LatLng(double.parse(controller.officeList.first.latitude),
            double.parse(controller.officeList.first.longitude)),
        zoom: 14.4746,
      );
    } else {
      controller.street.clear();
      controller.house.clear();
      controller.bellName.clear();
      controller.city.clear();
      controller.postalCode.clear();
      controller.entrance.clear();
      controller.floor.clear();
      controller.officeNum.clear();
      controller.lati.value = '';
      controller.longi.value = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    controller.openPlacePicker(context);
                  },
                  child: AssetImageInputField(
                    controller: controller.street,
                    enable: false,
                    hintText: "Street",
                    imageUrl: "assets/images/checkout/street.png",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                AssetImageInputField(
                  controller: controller.house,
                  enable: true,
                  hintText: "House No",
                  imageUrl: "assets/images/checkout/home.png",
                ),
                SizedBox(
                  height: 10,
                ),
                AssetImageInputField(
                  controller: controller.city,
                  enable: true,
                  hintText: "City",
                  imageUrl: "assets/images/checkout/city.png",
                ),
                SizedBox(
                  height: 10,
                ),
                AssetImageInputField(
                  controller: controller.postalCode,
                  enable: true,
                  hintText: "Postal Code",
                  imageUrl: "assets/images/checkout/post_code.png",
                ),
                SizedBox(
                  height: 10,
                ),
                AssetImageInputField(
                  controller: controller.bellName,
                  enable: true,
                  hintText: "Bell Name",
                  imageUrl: "assets/images/checkout/bell_name.png",
                ),
                const SizedBox(
                  height: 10,
                ),
                AssetImageInputField(
                  controller: controller.floor,
                  enable: true,
                  hintText: "Enter Floor",
                  imageUrl: "assets/images/checkout/colony.png",
                ),
                const SizedBox(
                  height: 10,
                ),
                AssetImageInputField(
                  controller: controller.officeNum,
                  enable: true,
                  hintText: "Enter Office Number",
                  imageUrl: "assets/images/checkout/office.png",
                ),
                const SizedBox(
                  height: 10,
                ),
                AssetImageInputField(
                    controller: controller.entrance,
                    enable: true,
                    hintText: "Select Entrance",
                    imageUrl: "assets/images/checkout/entrance.png",
                    suffix: Icon(Icons.keyboard_arrow_down)),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10)),
                    child: Obx(
                      () => controller.otherList.isNotEmpty &&
                              controller.editOffice.value
                          ? GoogleMap(
                              initialCameraPosition: controller.kGooglePlex2,
                              markers: controller.marker2.values.toSet(),
                              zoomControlsEnabled: false,
                              zoomGesturesEnabled: false,
                              mapType: MapType.normal,
                              onMapCreated: controller.onMapCreatedOffice)
                          : GoogleMap(
                              zoomControlsEnabled: false,
                              zoomGesturesEnabled: false,
                              markers: controller.markers.values.toSet(),
                              mapType: MapType.normal,
                              initialCameraPosition: controller.kGoogle,
                              onMapCreated: controller.onMapCreated),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
