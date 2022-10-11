

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Pages/Profile/Messages/user_list.dart';

import '../../../Helper/NotificatiokKeys.dart';
import 'chat_controller.dart';


class ChatListPage extends StatelessWidget {
  ChatListPage({Key key}) : super(key: key);

  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Color(AppColor.red),

        ),
        toolbarHeight: 80,
        backgroundColor: Color(AppColor.red),
        elevation: 0.0,
        //title: const Text("My Addresses", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            elevation: 1,
            backgroundColor: Colors.white,
            onPressed: (){
              Get.back();
            },
            mini: true,
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.black,),
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search, color: Colors.white,),
          )
        ],

      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  children: [

                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          controller.selectedTab.value = 0;
                        },
                        child: Obx(() => Container(
                          decoration: BoxDecoration(
                              color: controller.selectedTab.value == 0?  Color(AppColor.red) : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Gastronomie",
                                  style: TextStyle(
                                      color: controller.selectedTab.value == 0? Colors.white : Colors.black,
                                      fontFamily: AppFont.regular
                                  ),
                                ),
                                SizedBox(width: 8,),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: controller.selectedTab.value == 0? Colors.white:Colors.black.withOpacity(0.6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text("8", style: TextStyle(color: controller.selectedTab.value == 0? Color(AppColor.red) : Colors.white, fontSize: 15,fontFamily: AppFont.regular),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          controller.selectedTab.value = 1;
                        },
                        child: Obx(() => Container(
                          decoration: BoxDecoration(
                              color: controller.selectedTab.value == 1?  Color(AppColor.red) : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Cosmetics ",
                                  style: TextStyle(
                                    fontFamily: AppFont.medium,
                                      color: controller.selectedTab.value == 1? Colors.white : Colors.black
                                  ),
                                ),
                                SizedBox(width: 8,),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: controller.selectedTab.value == 1? Colors.white:Colors.black.withOpacity(0.6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text("3", style: TextStyle(color: controller.selectedTab.value == 1? Color(AppColor.red) : Colors.white, fontSize: 15),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Obx(() => controller.selectedTab.value == 0? UserList() : Text("Cosmetics"),)

        ],
      ),
    );
  }
}
