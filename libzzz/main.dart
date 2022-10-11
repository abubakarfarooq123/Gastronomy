import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_places_picker/google_places_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'Helper/Localization/localization.dart';
import 'Helper/NotificatiokKeys.dart';
import 'Helper/router.dart';
import 'package:get/get.dart';
import 'Helper/url.dart';
import 'Pages/Tabbar/bottombar_controller.dart';

Directory appDocsDir;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    Stripe.publishableKey = stripePublishableKey;
    Stripe.merchantIdentifier = 'merchant.reserved4you';
    Stripe.urlScheme = 'flutterstripe';
    await Stripe.instance.applySettings();
  } else {}
  appDocsDir = await getApplicationDocumentsDirectory();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white, statusBarBrightness: Brightness.light));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
    criticalAlert: true,
  );
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  Get.put(LifeCycleController());
  // await firebaseMessaging();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //SharedPreferences.setMockInitialValues({});
  PluginGooglePlacePicker.initialize(
    androidApiKey: googleAndroidApikey,
    iosApiKey: googleiOSApikey,
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Color(AppColor.logoBgColor),
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
  await bottomBarController.getNotifications();
  runApp(GetMaterialApp(
    theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'campton'),
    translations: AppLocalization(),
    navigatorKey: navigatorKey,
    // locale: Locale('en','US'),
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      SfGlobalLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate
    ],
    supportedLocales: [
      const Locale('en'),
      const Locale('de'),
    ],
    fallbackLocale: Locale('en'),
    debugShowCheckedModeBanner: false,
    // defaultTransition: Transition.rightToLeft,
    getPages: RouterForApp.route,
    initialRoute: '/splashView',
    // home: UserReview(),
  ));
}

RemoteMessage messageGlobel;
bool isNotification = false;
final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey(debugLabel: "Main Navigator");

/// firebase messaging integration
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
AndroidNotificationChannel channel;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  bottomBarController.notificationBadge.value = true;
  /*await Firebase.initializeApp().then((value) {
    print("Succsess");
  });
  if (message.notification == null) {
    NotificationService().sendFCMNotification(message.data);
  }*/
}

// Future<void> firebaseMessaging() async {
//   String token = Platform.isIOS
//       ? await FirebaseMessaging.instance.getAPNSToken()
//       : await FirebaseMessaging.instance.getToken();
//   //String androidToken =Platform.isAndroid? await FirebaseMessaging.instance.getToken():;
//   print("token = $token");
//   // print("token = $androidToken");
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   channel = const AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     importance: Importance.high,
//   );
//
//   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//   final IOSInitializationSettings initializationSettingsIOS =
//       IOSInitializationSettings(
//           onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//   final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//   flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onSelectNotification: (String payload) async {
//     print("onSelectNotification Called");
//     if (payload != null) {
//       // final newPay = jsonDecode(payload);
//     }
//   });
//
//   flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onSelectNotification: onSelectNotification);
//
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);
//
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           IOSFlutterLocalNotificationsPlugin>()
//       ?.requestPermissions(alert: true, badge: true, sound: true);
//
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true, badge: true, sound: true);
//
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//     List<IOSNotificationAttachment> attach = [];
//
//     print("onMessage Called");
//
//     bottomBarController.notificationBadge.value = true;
//     if (Platform.isAndroid) {
//       RemoteNotification notification = message.notification;
//       // AndroidNotification android = message.notification?.android;
//       //String imagePath = await downloadImage(message.data['image']);
//       String iconPath;
//       if (message.data.containsKey('icon') && message.data['icon'] != null) {
//         iconPath = await downloadImage(message.data['icon']);
//       }
//       Map<String, dynamic> payload = message.data;
//       attach.add(IOSNotificationAttachment(iconPath));
//       flutterLocalNotificationsPlugin.show(
//         notification != null ? notification.hashCode : 0,
//         message.data['title'],
//         message.data['body'],
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             channel.id,
//             channel.name,
//             icon: '@mipmap/ic_launcher',
//             largeIcon: FilePathAndroidBitmap(iconPath),
//             /*styleInformation: BigPictureStyleInformation(
//             FilePathAndroidBitmap(imagePath),
//             hideExpandedLargeIcon: false,
//           ),*/
//           ),
//           iOS: IOSNotificationDetails(
//             subtitle: channel.description,
//             presentSound: true,
//             presentAlert: true,
//             //   attachments: attach,
//           ),
//         ),
//         payload: jsonEncode(payload),
//       );
//     }
//   });
//
// //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
// //     print("onMessageOpenedApp Called ");
// //     print(message);
// //     print(message.data);
// //     await Firebase.initializeApp();
// //     /* Get.offAll(() => BottomNavBar(pageIndex: 2));*/
// //     if (message.notification.title == 'Stornierung!') {
// //       Get.to(() => MyBooking(), arguments: {
// //         'status': 'cancel',
// //         'appointment_id': message.data['appointment_id'],
// //       });
// //     } else if (message.notification.title == "Termin verschieben ?") {
// //       Get.to(() => MyBooking(), arguments: {
// //         'status': 'pending',
// //         'appointment_id': message.data['appointment_id'],
// //       });
// //     } else if (message.notification.title == "Dein Termin ist bald !") {
// //       Get.to(() => MyBooking(), arguments: {
// //         'status': 'completed',
// //         'appointment_id': message.data['appointment_id'],
// //       });
// //     } else if (message.notification.title == "Neue Antwort !") {
// //       /*Get.to(
// //             () => StoreDetailsView(),
// //         arguments: {
// //           'storeId': message.data['storeid'],
// //           'isHome': true,
// //           'id': message.data['appointment_id'],
// //         },
// //       );*/
// //       Get.offAll(() => BottomNavBar());
// //       Get.to(() => Givenreview(), arguments: {
// //         'appointment_id': message.data['appointment_id'],
// //       });
// //     } else if (message.notification.title == "Bewertungsanfrage !") {
// //       Get.to(() => MyBooking(), arguments: {
// //         'status': 'completed',
// //         'appointment_id': message.data['appointment_id'],
// //         'id': message.data["id"],
// //         'type': message.data["type"],
// //       });
// //       // Get.offAll(() =>BottomNavBar());
// //       // Get.to(() => Givenreview());
// //     } else if (message.notification.title == "Kundenprofil - Anfrage !") {
// //       print('Kundenprofilkjnkejhekgjhekjehgkjghjk3');
// //       Get.to(() => BottomNavBar(pageIndex: 2));
// //     } else if (message.notification.title == "Neue Buchung!") {
// //       Get.to(() => MyBooking(), arguments: {
// //         'status': 'pending',
// //         'appointment_id': message.data['appointment_id'],
// //       });
// //     } else {
// //       Get.to(() => BottomNavBar(pageIndex: 2));
// //     }
// //   });
// //
// //   FirebaseMessaging.instance
// //       .getInitialMessage()
// //       .then((RemoteMessage message) async {
// //     if (message != null) {
// //       messageGlobel = message;
// //       isNotification = true;
// //       await Firebase.initializeApp();
// //       if (message.notification != null) {
// //         /*Get.offAll(() => BottomNavBar(pageIndex: 2));*/
// //       }
// //       if (message.notification.title == 'Stornierung!') {
// //         Get.to(() => MyBooking(), arguments: {
// //           'status': 'cancel',
// //           'appointment_id': message.data['appointment_id'],
// //         });
// //       } else if (message.notification.title == "Termin verschieben ?") {
// //         Get.to(() => MyBooking(), arguments: {
// //           'status': 'pending',
// //           'appointment_id': message.data['appointment_id'],
// //         });
// //       } else if (message.notification.title == "Dein Termin ist bald !") {
// //         Get.to(() => MyBooking(), arguments: {
// //           'status': 'pending',
// //           'appointment_id': message.data['appointment_id'],
// //         });
// //       } else if (message.notification.title == "Neue Antwort !") {
// //         /*Get.to(
// //           () => StoreDetailsView(),
// //           arguments: {
// //             'storeId': message.data['storeid'],
// //             'isHome': true,
// //             'id': message.data['appointment_id'],
// //           },
// //         );*/
// //         Get.offAll(() => BottomNavBar());
// //         Get.to(() => Givenreview(), arguments: {
// //           'appointment_id': message.data['appointment_id'],
// //         });
// //       } else if (message.notification.title == "Bewertungsanfrage !") {
// //         Get.to(() => MyBooking(), arguments: {
// //           'status': 'completed',
// //           'appointment_id': message.data['appointment_id'],
// //         });
// //         // Get.offAll(() =>BottomNavBar());
// //         // Get.to(() => GiveFeedback());
// //       } else if (message.notification.title.toString() ==
// //           "Kundenprofil - Anfrage !") {
// //         print('Kundenprofilkjnkejhekgjhekjehgkjghjk2');
// //         Get.to(() => BottomNavBar(pageIndex: 2));
// //       } else if (message.notification.title == "Neue Buchung!") {
// //         Get.to(() => MyBooking(), arguments: {
// //           'status': 'pending',
// //           'appointment_id': message.data['appointment_id'],
// //         });
// //       } else {
// //         Get.to(() => BottomNavBar(pageIndex: 2));
// //       }
// //     }
// //   });
// // }
// //
// // Future<dynamic> onSelectNotification(data) async {
// //   Map<String, dynamic> payload = jsonDecode(data);
// //   //bottomBarController.notificationBadge.value = false;
// // // navigate to booking screen if the payload equal BOOKING
// //   if (payload['title'] == 'Stornierung!') {
// //     Get.to(() => MyBooking(), arguments: {
// //       'status': 'cancel',
// //       'appointment_id': payload['appointment_id'],
// //     });
// //   } else if (payload['title'] == "Termin verschieben ?") {
// //     Get.to(() => MyBooking(), arguments: {
// //       'status': 'pending',
// //       'appointment_id': payload['appointment_id'],
// //     });
// //   } else if (payload['title'] == "Dein Termin ist bald !") {
// //     Get.to(() => MyBooking(), arguments: {
// //       'status': 'pending',
// //       'appointment_id': payload['appointment_id'],
// //     });
// //   } else if (payload['title'] == "Neue Antwort !") {
// //     /*Get.to(
// //           () => StoreDetailsView(),
// //       arguments: {
// //         'storeId': payload['storeid'],
// //         'isHome': true,
// //         'id': payload['appointment_id'],
// //       },
// //     );*/
// //     Get.offAll(() => BottomNavBar());
// //     Get.to(() => Givenreview(), arguments: {
// //       'appointment_id': payload['appointment_id'],
// //     });
// //   } else if (payload['title'] == "Bewertungsanfrage !") {
// //     Get.to(() => MyBooking(), arguments: {
// //       'status': 'completed',
// //       'appointment_id': payload['appointment_id'],
// //       'id': payload['id'],
// //       'type': payload['type'],
// //     });
// //     // Get.offAll(() =>BottomNavBar());
// //     // Get.to(() => Givenreview());
// //   } else if (payload['title'].toString() == "Kundenprofil - Anfrage !") {
// //     print('Kundenprofilkjnkejhekgjhekjehgkjghjk1');
// //     Get.to(() => BottomNavBar(pageIndex: 2));
// //   } else if (payload['title'] == "Neue Buchung!") {
// //     Get.to(() => MyBooking(), arguments: {
// //       'status': 'pending',
// //       'appointment_id': payload['appointment_id'],
// //     });
// //   } else {
// //     Get.to(() => BottomNavBar(pageIndex: 2));
// //   }
// // /*  Get.offAll(() => BottomNavBar(pageIndex: 2));*/
// // }
// //
// // Future onDidReceiveLocalNotification(
// //   int id,
// //   String title,
// //   String body,
// //   String payload,
// // ) async {
// //   print("iOS notification $title $body $payload");
// // }
// //
// // Future<String> downloadImage(String image) async {
// //   try {
// //     // Saved with this method.
// //     var imageId = await ImageDownloader.downloadImage(image);
// //     if (imageId == null) {
// //       return null;

// //     var path = await ImageDownloader.findPath(imageId);
// //     return path;
// //   } on PlatformException catch (error) {
// //     print(error);
// //   }
// //   return null;
// // }
