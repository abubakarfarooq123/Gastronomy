import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/commanWidgets.dart';

import '../../../Helper/NotificatiokKeys.dart';
import 'active_vouchers.dart';
import 'my_voucher_controller.dart';
import 'no_voucher_found.dart';

class MyVoucherPage extends StatelessWidget {
  MyVoucherPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyVoucherController _tabx = Get.put(MyVoucherController());

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "My Vouchers",
            style: const TextStyle(color: Colors.black),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              elevation: 1,
              backgroundColor: Colors.white,
              onPressed: () {
                Get.back();
              },
              mini: true,
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: Obx(() => _tabx.isLoader == true
            ? CommanWidget()
                .showlolder(isshowDilog: _tabx.isLoader.value, height: 0)
            : Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.0),
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.grey, width: 0.8))),
                    child: TabBar(
                      controller: _tabx.controller,
                      tabs: _tabx.myTabs,
                      indicatorColor: Color(AppColor.red),
                      indicatorWeight: 2.5,
                      labelColor: Color(AppColor.red),
                      unselectedLabelColor: Colors.grey.shade500,
                      labelStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      unselectedLabelStyle: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                        controller: _tabx.controller,
                        children: [ActiveVouchers(), NoVouchersFound()]),
                  ),
                ],
              )));
  }
}
