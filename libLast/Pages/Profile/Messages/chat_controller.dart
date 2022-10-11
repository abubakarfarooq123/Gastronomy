import 'package:get/get.dart';

import 'message.dart';


class ChatController extends GetxController {

  RxInt selectedTab = 0.obs;

  List<Message> messageList = [
    Message(time: DateTime.now(), content: "Hey, I’m on your way", isSender: true),
    Message(time: DateTime.now().add(Duration(days: 2)), content: "Ok, waiting for you near supermarket", isSender: false),
    Message(time: DateTime.now().add(Duration(days: 5)), content: "Hold on, i will be in 5 minutes", isSender: true),
    Message(time: DateTime.now().add(Duration(days: 7)), content: "🙂", isSender: true),
  ];
}