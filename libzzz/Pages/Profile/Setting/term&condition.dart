import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Pages/Profile/Setting/SettingController.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
//import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class TermConditon extends StatelessWidget {
  SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Scaffold(
        appBar: termsHeader(),
        body: SafeArea(
          child: Obx((){
            if(settingController.termsConditionCode.value != ''){
              return webView();
            }else{
              return Center(child: CircularProgressIndicator());
            }
          })
        ),
      ),
    );
  }

  AppBar termsHeader() {
    return AppBar(
      backgroundColor: Color(AppColor.bgColor),
      elevation: 1,
      title: Text(
        'trems'.tr,
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontFamily: AppFont.medium),
      ),
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(12, 2, 0, 12),
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(boxShadow: [
            const BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                offset: Offset(1, 1),
                blurRadius: 7)
          ], color: Colors.white, borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
            iconSize: 20,
          ),
        ),
      ),
    );
  }

  Widget webView(){
    return WebViewPlus(
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        controller.loadString(settingController.termsConditionCode.value);
      },
    );
  }
}
