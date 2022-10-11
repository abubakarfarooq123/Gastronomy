import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_picker/google_places_picker.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/ResponseModel.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:reserved4u/Helper/url.dart';
import 'package:reserved4u/Pages/Profile/my_addresses/widgets/AddressModel.dart';

class MyAddressesController extends GetxController {
  CameraPosition kGoogle = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 16.4746,
  );
  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  CameraPosition kGooglePlex2 = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  RxInt selectedAddressTabIndex = 0.obs;
  RxInt selectedAddressType = 0.obs;
  var homeList = <Office>[].obs;
  var officeList = <Office>[].obs;
  var otherList = <Office>[].obs;
  var lati = '37.42796133580664'.obs;
  var longi = '-122.085749655962'.obs;
  var street = TextEditingController();
  var house = TextEditingController();
  var city = TextEditingController();
  var postalCode = TextEditingController();
  var bellName = TextEditingController();
  var floor = TextEditingController();
  var officeNum = TextEditingController();
  var entrance = TextEditingController();
  var colony = TextEditingController();
  var editHome = false.obs;
  var editOffice = false.obs;

  var showLoader = false.obs;
  @override
  void onInit() async {
    getAddressesList();
    super.onInit();
  }

  void checkValidation() {
    if (street.text.isEmpty) {
      showTostMessage(message: 'street'.tr);
    } else if (house.text.isEmpty) {
      showTostMessage(message: 'house'.tr);
    } else if (city.text.isEmpty) {
      showTostMessage(message: 'city'.tr);
    } else if (postalCode.text.isEmpty) {
      showTostMessage(message: 'postal'.tr);
    } else {
      showLoader.value = true;
      saveAddressToServer();
    }
  }

  void checkUpdateValidation() {
    if (street.text.isEmpty) {
      showTostMessage(message: 'street'.tr);
    } else if (house.text.isEmpty) {
      showTostMessage(message: 'house'.tr);
    } else if (city.text.isEmpty) {
      showTostMessage(message: 'city'.tr);
    } else if (postalCode.text.isEmpty) {
      showTostMessage(message: 'postal'.tr);
    } else {
      showLoader.value = true;
      updateAddressToServer();
    }
  }

  Future<void> openPlacePicker(BuildContext context) async {
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
      final coordinates =
          new Coordinates(placeName.latitude, placeName.longitude);
      kGooglePlex = CameraPosition(
        target: LatLng(placeName.latitude, placeName.longitude),
        zoom: 18.4746,
      );
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      postalCode.text = first.postalCode;
      city.text = first.locality;
      street.text = first.thoroughfare;
      house.text = first.featureName;
      lati = first.coordinates.latitude.toString().obs;
      longi = first.coordinates.longitude.toString().obs;
      onMapCreated;
    } on Exception catch (e) {
      print(e);
    }
  }

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}.obs;
  Map<MarkerId, Marker> marker2 = <MarkerId, Marker>{}.obs;

  final Set<Polyline> polylines = {};
  Completer<GoogleMapController> mapController = Completer();
  static const LatLng center = const LatLng(0.0, 0.0);
  GoogleMapController controllerss;

  void zoomForPerticuarIndex(GoogleMapController controller) async {
    controller = await mapController.future;

    controller.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(double.parse(homeList.first.latitude),
            double.parse(homeList.first.longitude)),
        18));
    final marker = Marker(
      markerId: MarkerId('place_name'),
      position: LatLng(double.parse(homeList.first.latitude),
          double.parse(homeList.first.longitude)),
      icon: BitmapDescriptor.defaultMarker,
      visible: true,
      infoWindow: InfoWindow(
        title: "Home",
        snippet: homeList.first.streetName,
      ),
    );
    markers[MarkerId('place_name')] = marker;
  }

  void onMapCreatedOffice(GoogleMapController controller) async {
    controller = await mapController.future;

    controller.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(double.parse(officeList.first.latitude),
            double.parse(officeList.first.longitude)),
        18));

    final marker = Marker(
      markerId: MarkerId('place'),
      position: LatLng(double.parse(officeList.first.latitude),
          double.parse(officeList.first.longitude)),
      icon: BitmapDescriptor.defaultMarker,
      visible: true,
      infoWindow: InfoWindow(
        title: 'Office',
        snippet: officeList.first.streetName,
      ),
    );
    marker2[MarkerId('place')] = marker;
  }

  void onMapCreated(GoogleMapController controller) async {
    controller = await mapController.future;

    controller.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(double.parse(lati.value), double.parse(longi.value)), 18));
    mapController.complete(controller);
    final marker = Marker(
      markerId: MarkerId('place'),
      position: LatLng(double.parse(lati.value), double.parse(longi.value)),
      icon: BitmapDescriptor.defaultMarker,
      visible: true,
    );
    marker2[MarkerId('place')] = marker;
  }

  Future getAddressesList() async {
    showLoader.value = true;
    var api = ApiProvider();
    var res = await api.getApiCall(ApiUrl.getAddressList);
    final jsonString = json.decode(res.body);
    if (jsonString["ResponseData"] != null) {
      if (jsonString["ResponseData"]['home'] != null) {
        Office homeModel = Office();
        homeModel = Office.fromJson(jsonString["ResponseData"]['home']);
        homeList.add(homeModel);

        kGooglePlex = CameraPosition(
            zoom: 16.77,
            target: LatLng(double.parse(homeList.first.latitude),
                double.parse(homeList.first.longitude)));
      }
      if (jsonString["ResponseData"]['office'] != null) {
        Office officeModel = Office();
        officeModel = Office.fromJson(jsonString["ResponseData"]['office']);
        officeList.add(officeModel);
        kGooglePlex2 = CameraPosition(
            zoom: 16.77,
            target: LatLng(double.parse(officeList.first.latitude),
                double.parse(officeList.first.longitude)));
      }
      if (jsonString["ResponseData"][''] != null) {
        Office otherModel = Office();
        otherModel = Office.fromJson(jsonString["ResponseData"]['']);
        otherList.add(otherModel);
      }
    }
    showLoader.value = false;
    if (homeList.length != 0) {
      selectedAddressType.value = 0;
    } else if (officeList.length != 0) {
      selectedAddressType.value = 1;
    } else {
      selectedAddressType.value = 0;
    }
    return jsonString["ResponseData"];
  }

  void saveAddressToServer() async {
    ApiProvider apiProvider = ApiProvider();
    await apiProvider.post(ApiUrl.addAddress, {
      "type": selectedAddressTabIndex.value == 0
          ? "home"
          : selectedAddressTabIndex.value == 1
              ? "office"
              : "other",
      "street_name": street.text.trim(),
      "house_no": house.text.trim(),
      "city": city.text.trim(),
      "postcode": postalCode.text.trim(),
      "bell_name": bellName.text.trim(),
      "floor": floor.text.trim(),
      "office_no": officeNum.text.trim(),
      "entrance": entrance.text.trim(),
      "latitude": lati.value,
      "longitude": longi.value
    }).then(
      (value) {
        showLoader.value = true;
        var responseJson = json.decode(value.body);
        ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
        if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
          getAddressesList();
          showLoader.value = false;
          print("${_responseModel.responseText}");
          showTostMessage(message: _responseModel.responseText);
          Get.back();
        } else {
          showLoader.value = false;
          showTostMessage(message: _responseModel.responseText);
        }
      },
    );
  }

  void updateAddressToServer() async {
    ApiProvider apiProvider = ApiProvider();
    await apiProvider.post(ApiUrl.updateAddress, {
      "address_id": selectedAddressTabIndex.value == 0
          ? homeList.first.id.toString()
          : selectedAddressTabIndex.value == 1
              ? officeList.first.id.toString()
              : otherList.first.id.toString(),
      "type": selectedAddressTabIndex.value == 0
          ? "home"
          : selectedAddressTabIndex.value == 1
              ? "office"
              : "other",
      "street_name": street.text.trim(),
      "house_no": house.text.trim(),
      "city": city.text.trim(),
      "postcode": postalCode.text.trim(),
      "bell_name": bellName.text.trim(),
      "floor": floor.text.trim(),
      "office_no": officeNum.text.trim(),
      "entrance": entrance.text.trim(),
      "latitude": lati.value,
      "longitude": longi.value
    }).then(
      (value) {
        var responseJson = json.decode(value.body);
        ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
        if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
          homeList.clear();
          officeList.clear();
          otherList.clear();
          showLoader.value = false;
          showTostMessage(message: _responseModel.responseText);
          getAddressesList();
          editHome.value = false;
          editOffice.value = false;
          Get.back();
        } else {
          showLoader.value = false;
          showTostMessage(message: _responseModel.responseText);
        }
      },
    );
  }

  void deleteAddressFromServer() async {
    showLoader.value = true;
    ApiProvider apiProvider = ApiProvider();
    await apiProvider.post(ApiUrl.deleteAddress, {
      "address_id": selectedAddressType == 0
          ? homeList.first.id.toString()
          : selectedAddressType == 1
              ? officeList.first.id.toString()
              : otherList.first.id.toString(),
    }).then(
      (value) {
        var responseJson = json.decode(value.body);
        ResponseModel _responseModel = ResponseModel.fromJson(responseJson);
        if (_responseModel.responseCode == ResponseCodeForAPI.sucessC) {
          showLoader.value = false;
          showTostMessage(message: _responseModel.responseText);
          getAddressesList();
          Get.back();
          Get.back();
          selectedAddressType == 0 ? homeList.clear() : officeList.clear();
        } else {
          showLoader.value = false;
          showTostMessage(message: _responseModel.responseText);
        }
      },
    );
  }
}
