import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:reserved4u/Helper/url.dart';
import 'package:reserved4u/Pages/Profile/vochers/model/vocher_model.dart';

class MyVoucherController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Active'),
    Tab(text: 'Used'),
  ];

  TabController controller;

  RxInt selectedTab = 0.obs;
  var activeArray = <VochersModel>[].obs;
  var usedArray = <VochersModel>[].obs;
  var isLoader = false.obs;

  @override
  void onInit() {
    getVouchers();
    controller = TabController(vsync: this, length: myTabs.length);

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    Get.delete<MyVoucherController>();
  }

  getVouchers() async {
    isLoader.value = true;
    ApiProvider api = ApiProvider();
    var res = await api.getApiCall(ApiUrl.allVouchers);
    VochersModel model = VochersModel();
    print(res.body);
    var jsonString = jsonDecode(res.body);
    if (jsonString["ResponseData"]["active_data"].length != 0) {
      jsonString["ResponseData"]["active_data"].forEach((data) {
        model = VochersModel.fromJson(data);
        activeArray.add(model);
        print(activeArray.toString());
      });
    }
    if (jsonString["ResponseData"]["used_data"].length != 0) {
      jsonString["ResponseData"]["used_data"].forEach((data) {
        model = VochersModel.fromJson(data);
        usedArray.add(model);
        print(usedArray.toString());
      });
    }
    isLoader.value = false;
  }
}
