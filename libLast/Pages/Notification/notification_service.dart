import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/apiProvider.dart';
import 'package:reserved4u/Helper/preferences.dart';
import 'package:reserved4u/Helper/url.dart';
import 'package:reserved4u/Pages/Notification/notifications_model.dart';
import 'package:reserved4u/Pages/Profile/Profiile_Model.dart';

class NotificationService {
  static Future<NotificationsModel> getNotifications() async {
    String userStr =
        await Preferences.preferences.getString(key: PrefernceKey.userData);
    User user = User.fromJson(jsonDecode(userStr));
    String userId = user.id.toString();
    String url = ApiUrl.notification;
    try {
      ApiProvider apiProvider = ApiProvider();
      final http.Response response = await apiProvider.post(url, {
        'user_id': userId,
      });
      /*http.post(
          Uri.parse(url),

        body: {
          'user_id': userId,
        },
      );*/

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        return notificationsModelFromMap(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static const String serverToken =
      'AAAAVE5r2FQ:APA91bHx9j0ShRBUtcmQksk1mXitT92oSA57dk0aQiQcHgAA-Jm-ynwSlSjlEKXOlH287sKZa9ijso37rkPh_zT3IDAG0gN_myCPQAJSHuUzKjgwrTYPnf0euaHMg--AYsep2V9lJN6x';

  FirebaseMessaging message = FirebaseMessaging.instance;

  Future<String> getFcmToken() async {
    return await message.getToken();
  }

  void sendFCMNotification(Map<String, dynamic> data) async {
    await Firebase.initializeApp().then((value) {
      print("Succsess");
    });
    String fcmToken = await getFcmToken();
    Map<String, dynamic> map = {
      "${fcmToken == null ? "registration_ids" : "to"}": fcmToken,
      "data": {
        "id": "0",
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "sound": "default",
        "message": data["message"],
      },
      "priority": "high",
      "notification": {
        "title": data["title"],
        "body": data["body"],
        //"icon": data["icon"],
        "image": data['icon'],
      },
    };

    Response response = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(map),
    );

    print(response.statusCode);
    print(response.body);
  }
}
