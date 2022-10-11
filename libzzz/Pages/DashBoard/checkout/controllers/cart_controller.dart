import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:reserved4u/Helper/preferences.dart';
import 'package:reserved4u/Helper/url.dart';
import 'package:reserved4u/Pages/DashBoard/checkout/model/selected_menu_item.dart';
import 'package:reserved4u/Pages/DashBoard/checkout/views/cart_page.dart';
import 'package:reserved4u/global_variables/global_variables.dart';

import '../../Resturant/resturant_detail_controller.dart';
import '../views/checkout_page.dart';

class CartController extends GetxController {
  RxBool isLoading = true.obs;

  RxInt numberOfItem = 0.obs;

  var cartList = <Map<String, dynamic>>[].obs;
  Map<String, dynamic> cartObject = {"products": [], "extras": []};
  var extras = [].obs;
  Rx<SelectedMenuItem> selectedMenuItem = SelectedMenuItem().obs;

  void incrementCount() {
    numberOfItem.value++;
  }

  void decrementCount(int value) {
    if (value > 0) {
      numberOfItem.value--;
    }
  }

  void onCheckoutButtonClick() {
    Get.to(() => CheckoutPage());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
  }

  void onAddToCardButtonClick() async {
    await assignExtraToProducts();
    print(cartObject['products']);
    await hitAddToCartAPI();
    Get.to(() => CartPage());
  }

  Future assignExtraToProducts() async {
    for (int i = 0; i < cartObject['products'].length; i++) {
      cartObject['products'][i]['extras'] = cartObject['extras'].toString();
    }
  }

  /// save cart data in database
  hitAddToCartAPI() async {
    for (int i = 0; i < cartObject['products'].length; i++) {
      print(cartObject['products'][0]);
      var token =
          await Preferences.preferences.getString(key: PrefernceKey.loginToken);

      var response = await http.post(Uri.parse(ApiUrl.addToCartAPI),
          body: cartObject['products'][i],
          headers: {
            "Authorization": token
            // "eyJpdiI6IlRnd2UzWUh2U2RkQWtMb3JHSFRDWnc9PSIsInZhbHVlIjoidUlWS0RBemFRTFJSdi9PSlY3dXpGUT09IiwibWFjIjoiMGEzNmJkODVkOWExZmNmMzUyYzA3ODE4YWExOTE0YWYyOGRmZDI0ZGRiYzFlZTdmMzExMzQ2NzUxODBhNjQ3MyIsInRhZyI6IiJ9"
          });

      print(response.body);
    }
  }

  getSelectedMenuItems() async {
    var response =
        await ApiProvider().getApiCall(ApiUrl.getSelectedMenuItemAPI);
    var jsonBody = json.decode(response.body);

    if (jsonBody['ResponseCode'] == 1) {
      selectedMenuItem.value = selectedMenuItemFromJson(response.body);
    }
    isLoading.value = false;
  }

  clearAllVariablesData() {
    cartObject = {"products": [], "extras": []};
    cartList.value = [];
    totalPrice.value = 0;
    deliveryCharges.value = 0;
    Get.find<ResturantController>().checkBoxListData = [
      {"title": "Diced Chiken", "isCheck": false.obs},
      {"title": "Cilantro", "isCheck": false.obs},
      {"title": "Cheese", "isCheck": false.obs},
      {"title": "Peppers", "isCheck": false.obs},
      {"title": "Olives", "isCheck": false.obs},
      {"title": "Chilli Sauce", "isCheck": false.obs},
    ];
  }
}
