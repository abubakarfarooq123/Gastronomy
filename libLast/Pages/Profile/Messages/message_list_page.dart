
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../Helper/NotificatiokKeys.dart';

import 'chat_controller.dart';

class MessageListPage extends StatelessWidget {
  const MessageListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatController controller = Get.find<ChatController>();
    return Scaffold(

      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Color(AppColor.red),
        ),
        toolbarHeight: 80,
        backgroundColor: Color(AppColor.red),
        elevation: 0.0,
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage("https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg")
                  )
              ),

            ),
            SizedBox(width: 8,),
            Text("Micheal Khan", style: TextStyle(fontSize: 16),)
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: (){Get.back();},
            mini: true,
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.black,),
          ),
        ),

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                reverse: false,
                itemCount: controller.messageList.length,
                itemBuilder: (context, int index) {
                  /// separate feed by dates
                  // Widget separator = SizedBox();
                  // if (index != 0 && controller.messageList[index].time.day != controller.messageList[index - 1].time.day) {
                  //   separator = Container(
                  //     height: 2,
                  //     width: 80,
                  //     color: Colors.black,
                  //   );
                  // }
                  return Column(
                    children: [

                      index == 0? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 30,),
                          Text("Yesterday, 2/19/22", style: TextStyle(color: Colors.black.withOpacity(0.5), fontWeight: FontWeight.w500),),
                        ],
                      ):Container(),
                      Container(
                        padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                        child: Align(
                          alignment: (controller.messageList[index].isSender?Alignment.topLeft:Alignment.topRight),
                          child: Column(
                            crossAxisAlignment: controller.messageList[index].isSender? CrossAxisAlignment.start:CrossAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:  BorderRadius.only(
                                    topRight: controller.messageList[index].isSender? Radius.circular(20):Radius.circular(0),
                                    topLeft: controller.messageList[index].isSender? Radius.circular(0):Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)
                                  ),
                                  color: (controller.messageList[index].isSender? Colors.grey.shade200:Color(AppColor.red)),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text(controller.messageList[index].content, style: TextStyle(fontSize: 15, color: controller.messageList[index].isSender? Colors.black:Colors.white),),
                              ),
                              SizedBox(height: 10,),
                              Text("2:00am")
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),

          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10, top: 15),
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                          hintText: "Type your message...",
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("assets/images/checkout/image.png"),
                              SizedBox(width: 14,),
                              Image.asset("assets/images/checkout/Vector.png"),
                              SizedBox(width: 8,),
                            ],
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(
                  mini: false,
                  heroTag: "record audio",
                  backgroundColor: Color(AppColor.red),
                  child: Icon(Icons.mic, color: Colors.white,),
                  onPressed: (){},
                ),
                SizedBox(width: 10,)
              ],
            ),
          ),

        ],
      ),

    );
  }
}
