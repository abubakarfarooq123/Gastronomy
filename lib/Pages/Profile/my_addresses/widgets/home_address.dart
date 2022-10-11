import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../my_addresses_controller.dart';
import 'asset_image_input_field.dart';

class HomeAddress extends StatefulWidget {
  @override
  State<HomeAddress> createState() => _HomeAddressState();
}

class _HomeAddressState extends State<HomeAddress> {
  MyAddressesController controller = Get.put(MyAddressesController());
  @override
  void initState() {
    super.initState();
    if (controller.homeList.isNotEmpty && controller.editHome.value) {
      controller.street =
          TextEditingController(text: controller.homeList.first.streetName);
      controller.house =
          TextEditingController(text: controller.homeList.first.houseNo);
      controller.city =
          TextEditingController(text: controller.homeList.first.city);
      controller.postalCode =
          TextEditingController(text: controller.homeList.first.postcode);
      controller.bellName =
          TextEditingController(text: controller.homeList.first.bellName);
      controller.lati.value = controller.homeList.first.latitude;
      controller.longi.value = controller.homeList.first.longitude;
      controller.kGoogle = CameraPosition(
        target: LatLng(double.parse(controller.homeList.first.latitude),
            double.parse(controller.homeList.first.longitude)),
        zoom: 14.4746,
      );
    } else {
      controller.street.clear();
      controller.house.clear();
      controller.bellName.clear();
      controller.city.clear();
      controller.postalCode.clear();
      controller.lati.value = '';
      controller.longi.value = '';
    }
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
                SizedBox(
                  height: 2,
                ),
                InkWell(
                  onTap: () {
                    controller.openPlacePicker(context);
                  },
                  child: AssetImageInputField(
                      controller: controller.street,
                      enable: false,
                      hintText: "Street",
                      imageUrl: "assets/images/checkout/street.png"),
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
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 240,
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Obx(() => controller.homeList.isNotEmpty &&
                              controller.editHome.value
                          ? GoogleMap(
                              initialCameraPosition: controller.kGooglePlex,
                              markers: controller.markers.values.toSet(),
                              zoomControlsEnabled: false,
                              zoomGesturesEnabled: false,
                              mapType: MapType.normal,
                              onMapCreated: controller.zoomForPerticuarIndex)
                          : Obx(
                              () => GoogleMap(
                                  zoomControlsEnabled: false,
                                  zoomGesturesEnabled: false,
                                  markers: controller.markers.values.toSet(),
                                  mapType: MapType.normal,
                                  initialCameraPosition: controller.kGoogle,
                                  onMapCreated: controller.onMapCreated),
                            ))),
                ),
                SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
