import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Pages/DashBoard/DashBoardController.dart';
import 'package:get/get.dart';
import 'package:google_places_picker/google_places_picker.dart';
import 'package:reserved4u/Pages/DashBoard/Resturant/models/restaurant_typeModel.dart';

// ignore: must_be_immutable
class FilterView extends StatelessWidget {
  DashBoardController _dashboardController = Get.put(DashBoardController());

  RxBool isVegon = false.obs;
  RxBool isVeggie = false.obs;
  RxBool isHalal = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FilterAppBar(),
      // bottomSheet: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //   child: SizedBox(width: Get.width, child: bottomPart()),
      // ),
      bottomNavigationBar: bottomPart(),

      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            //scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Obx(
                  () => middlePart(context),
                ),
                SizedBox(height: 20),
                Obx(
                  () => filterBottom(),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 0, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Min order amount",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _dashboardController.minOrderType.value = 0;
                            },
                            child: Obx(() => Container(
                                  decoration: BoxDecoration(
                                      color: _dashboardController
                                                  .minOrderType.value ==
                                              0
                                          ? Color(AppColor.red)
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 8),
                                    child: Text(
                                      "10€ or less",
                                      style: TextStyle(
                                          color: _dashboardController
                                                      .minOrderType.value ==
                                                  0
                                              ? Colors.white
                                              : Colors.grey.shade300,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              _dashboardController.minOrderType.value = 1;
                            },
                            child: Obx(() => Container(
                                  decoration: BoxDecoration(
                                      color: _dashboardController
                                                  .minOrderType.value ==
                                              1
                                          ? Color(AppColor.red)
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 8),
                                    child: Text(
                                      "More than 10€",
                                      style: TextStyle(
                                          color: _dashboardController
                                                      .minOrderType.value ==
                                                  1
                                              ? Colors.white
                                              : Colors.grey.shade300,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Free delivery cost",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Text(
                            "Off",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Obx(() => Switch(
                              value: _dashboardController.free_delivery.value,
                              onChanged: (v) {
                                _dashboardController.free_delivery.value = v;
                              })),
                          const Text(
                            "On",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // SizedBox(width: Get.width, child: bottomPart()),
                      const SizedBox(
                        height: 20,
                      ),
                      // const Center(
                      //   child: Text(
                      //     "Loschen",
                      //     style: TextStyle(
                      //         color: Colors.black,
                      //         fontSize: 15,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  AppBar FilterAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color(0xFFfef4ec),
      leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: FloatingActionButton(
            backgroundColor: Color(AppColor.scaffoldbgcolor),
            onPressed: () {},
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
                size: 15,
              ),
              onPressed: () {
                Get.back();
                // _dashboardController.resetFilters();
              },
            ),
          )),
      title: Text(
        'filter'.tr,
        style: TextStyle(
            color: Color(AppColor.black),
            fontSize: 20,
            fontFamily: AppFont.bold),
      ),
      actions: [
        InkWell(
          onTap: () {
            _dashboardController.resetFilters();
          },
          child: Container(
            margin: EdgeInsets.all(10),
            height: 30,
            width: 70,
            decoration: BoxDecoration(
                color: Color(0xFFfef6f1),
                border: Border.all(color: Colors.black38),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                'clear'.tr,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: AppFont.medium,
                    color: Colors.black),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget middlePart(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text('filterByPrice'.tr,
              style: TextStyle(fontSize: 18, fontFamily: AppFont.semiBold)),
        ),
        SizedBox(height: 5),
        /*price*/ Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RatingBar.builder(
                initialRating:
                    double.parse(_dashboardController.selectedPrice.value),
                minRating: 0,
                itemCount: 5,
                direction: Axis.horizontal,
                allowHalfRating: false,
                glowColor: Colors.white,
                itemSize: 40,
                unratedColor: Color(0xFFdadbde),
                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                itemBuilder: (context, index) {
                  return Container(
                    height: 22,
                    width: 22,
                    child: Text(
                      appStaticPriceSymbol,
                      style: TextStyle(
                          color: Color(AppColor.red),
                          fontFamily: AppFont.regular,
                          fontSize: 20),
                    ),
                  );
                },
                onRatingUpdate: (value) {
                  _dashboardController.selectedPrice.value = value.toString();
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text('filterByRating'.tr,
              style: TextStyle(fontSize: 18, fontFamily: AppFont.semiBold)),
        ),
        SizedBox(height: 5),
        /*Rattings*/ Padding(
          padding: const EdgeInsets.only(left: 18),
          child: RatingBar.builder(
            initialRating:
                double.parse(_dashboardController.selectedRating.value),
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            glowColor: Colors.white,
            itemSize: 40,
            unratedColor: Color(0xFFdadbde),
            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
            itemBuilder: (context, index) {
              return Container(
                height: 45,
                width: 45,
                child: Image.asset(
                  AssestPath.homeView + "Star.png",
                  height: 18,
                  width: 18,
                ),
              );
            },
            onRatingUpdate: (value) {
              _dashboardController.selectedRating.value = value.toString();
            },
          ),
        ),
      ],
    );
  }

  Widget googlemap() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(_dashboardController.selectedLat.value,
            _dashboardController.selectedLon.value),
        zoom: 5,
      ),
      markers: _dashboardController.markers,
      myLocationButtonEnabled: false, //right bottom button
    );
  }

  Widget filterBottom() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Text('filterRestaurantType'.tr,
              style: TextStyle(fontSize: 18, fontFamily: AppFont.semiBold)),
        ),
        SizedBox(height: 10),
        /*Specification data*/ Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Container(
            //height: 450,
            decoration: BoxDecoration(
                color: Color(0xFFf9f9fb),
                borderRadius: BorderRadius.circular(15)),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _dashboardController.arrSpecifics.length,
                itemBuilder: (context, ind) {
                  var currentObj = _dashboardController.arrSpecifics[ind];
                  return InkWell(
                    onTap: () {
                      _dashboardController.selectedSpecificationIdAdd(
                          _dashboardController.arrSpecifics[ind].id);

                      // ignore: unrelated_type_equality_checks

                      // _dashboardController.selectedSpecificationIdAdd(
                      //     _dashboardController.arrSpecifics[ind].id);
                    },
                    child: restaurantTypeCell(currentObj),
                  );
                }),
          ),
        ),
        SizedBox(height: 22),
      ],
    );
  }

  Widget bottomPart() {
    return InkWell(
      onTap: () {
        _dashboardController.getAllRestaurantssort();
        Get.back();
      },
      child: Container(
        height: 90,
        width: Get.width,
        child: Center(
            child: Text(
          "applyFilter".tr,
          style: TextStyle(
              fontSize: 19, fontFamily: AppFont.medium, color: Colors.white),
        )),
        decoration: BoxDecoration(
          color: Color(AppColor.maincategorySelectedTextColor),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
      ),
    );

    //  CustomButton(
    //     title: "applyFilter".tr,
    //     onPressed: () {
    //       _dashboardController.getAllRestaurantssort();
    //       Get.back();
    //     });
  }

  Widget restaurantTypeCell(RestaurantTypeModel currentObj) {
    return Obx(() => Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
          child: Container(
            child: Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  child:
                      _dashboardController.selectedIds.contains(currentObj.id)
                          ? Image.asset(AssestPath.homeView + "check.png")
                          : Image.asset(
                              AssestPath.homeView + "checkBoxUnSelected.png",
                              color: Color(0xFFe8e8ec),
                            ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  currentObj.name,
                  style: TextStyle(
                    fontFamily: AppFont.regular,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Future<void> openPlacePicker(BuildContext context) async {
    if (await Permission.location.request().isGranted) {
      print("cxv");
    }
    PluginGooglePlacePicker.initialize(
      androidApiKey: googleAndroidApikey,
      iosApiKey: googleiOSApikey,
    );

    try {
      var placeName;
      var place = await PluginGooglePlacePicker.showAutocomplete(
        mode: PlaceAutocompleteMode.MODE_OVERLAY,
        countryCode: 'DE',
      );
      placeName = place;

      _dashboardController.selectedAddressForFilter.value = place.address;

      _dashboardController.selectedLat.value = placeName.latitude;
      _dashboardController.selectedLon.value = placeName.longitude;

      _dashboardController.markers.removeAll(_dashboardController.markers);
      _dashboardController.markers.add(Marker(
        markerId: MarkerId("xcvxcv"),
        position: LatLng(placeName.latitude, placeName.longitude),
      ));
    } on Exception catch (e) {
      print(e);
    }
  }
}
