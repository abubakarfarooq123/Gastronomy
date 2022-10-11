import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/preferences.dart';
import 'package:reserved4u/Pages/Profile/Setting/givenReview.dart';
import 'package:reserved4u/Pages/Tabbar/BottomNavBar.dart';
import 'package:reserved4u/main.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    getSelectedLanguage();
    Timer(Duration(milliseconds: 5000), () async {
      if (isNotification == false) {
        var isIntroduction = await Preferences.preferences.getBool(
            key: PrefernceKey.isIntroductionScreenLoaded, defValue: false);

        if (isIntroduction == true) {
          Get.offNamed('/selectMainCategory');
        } else {
          Get.offNamed('/introduction');
        }
      } else {
        // await Firebase.initializeApp();
        // if (messageGlobel.notification.title == 'Stornierung!') {
        //   Get.to(() => MyBooking(), arguments: {
        //     'status': 'cancel',
        //     'appointment_id': messageGlobel.data['appointment_id'],
        //   });
        // } else if (messageGlobel.notification.title == "Termin verschieben ?") {
        //   Get.to(() => MyBooking(), arguments: {
        //     'status': 'pending',
        //     'appointment_id': messageGlobel.data['appointment_id'],
        //   });
        // } else if (messageGlobel.notification.title ==
        //     "Dein Termin ist bald !") {
        //   Get.to(() => MyBooking(), arguments: {
        //     'status': 'pending',
        //     'appointment_id': messageGlobel.data['appointment_id'],
        //   });
        // } else if (messageGlobel.notification.title == "Neue Antwort !") {
        //   Get.offAll(() => BottomNavBar());
        //   Get.to(() => Givenreview());
        // } else if (messageGlobel.notification.title == "Neue Buchung!") {
        //   Get.to(() => MyBooking(), arguments: {
        //     'status': 'pending',
        //     'appointment_id': messageGlobel.data['appointment_id'],
        //   });
        // } else if (messageGlobel.notification.title == "Bewertungsanfrage !") {
        //   Get.to(() => MyBooking(), arguments: {
        //     'status': 'completed',
        //     'appointment_id': messageGlobel.data['appointment_id'],
        //   });
        // } else if (messageGlobel.notification.title ==
        //     "Kundenprofil - Anfrage !") {
        //   print('messagetittle');
        //   Get.to(() => BottomNavBar(pageIndex: 2));
        // } else {
        //   Get.to(() => Get.to(() => BottomNavBar(pageIndex: 2)));
        // }
      }
    });

    // Timer(Duration(milliseconds: 2000), () async {
    //   if (isNotification == false) {
    //     var isIntroduction = await Preferences.preferences.getBool(
    //         key: PrefernceKey.isIntroductionScreenLoaded, defValue: false);

    //     if (isIntroduction == true) {
    //       // introduction screen appears ,go to home if true else login

    //       Get.offNamed('/selectMainCategory');
    //     } else {
    //       Get.offNamed('/introduction');
    //     }
    //   } else {
    //     await Firebase.initializeApp();
    //     /*Get.offAll(() => BottomNavBar(pageIndex: 2));*/
    //     if (messageGlobel.notification.title == 'Stornierung!') {
    //       // Get.to(() => MyBooking(), arguments: {
    //       //   'status': 'cancel',
    //       //   'appointment_id': messageGlobel.data['appointment_id'],
    //       // });
    //     } else if (messageGlobel.notification.title == "Termin verschieben ?") {
    //       // Get.to(() => MyBooking(), arguments: {
    //       //   'status': 'pending',
    //       //   'appointment_id': messageGlobel.data['appointment_id'],
    //       // });
    //     } else if (messageGlobel.notification.title ==
    //         "Dein Termin ist bald !") {
    //       // Get.to(() => MyBooking(), arguments: {
    //       //   'status': 'pending',
    //       //   'appointment_id': messageGlobel.data['appointment_id'],
    //       // });
    //     } else if (messageGlobel.notification.title == "Neue Antwort !") {
    //       /*Get.to(
    //         () => StoreDetailsView(),
    //         arguments: {
    //           'storeId': messageGlobel.data['storeid'],
    //           'isHome': true,
    //           'id': messageGlobel.data['appointment_id'],
    //         },
    //       );*/
    //       Get.offAll(() => BottomNavBar());
    //       Get.to(() => Givenreview());
    //     } else if (messageGlobel.notification.title == "Neue Buchung!") {
    //       // Get.to(() => MyBooking(), arguments: {
    //       //   'status': 'pending',
    //       //   'appointment_id': messageGlobel.data['appointment_id'],
    //       // });
    //     } else if (messageGlobel.notification.title == "Bewertungsanfrage !") {
    //       // Get.offAll(() => BottomNavBar());
    //       // Get.to(() => MyBooking(), arguments: {
    //       //   'status': 'completed',
    //       //   'appointment_id': messageGlobel.data['appointment_id'],
    //       // });
    //     } else if (messageGlobel.notification.title ==
    //         "Kundenprofil - Anfrage !") {
    //       print('messagetittle');
    //       Get.to(() => BottomNavBar(pageIndex: 2));
    //     } else {
    //       Get.to(() => Get.to(() => BottomNavBar(pageIndex: 2)));
    //     }
    //   }
    // });
  }

  void getSelectedLanguage() async {
    var selectedLanguage = await Preferences.preferences
        .getString(key: PrefernceKey.savelanguageKey);
    if (selectedLanguage == null) {
      Get.updateLocale(Locale("de"));
      Preferences.preferences
          .saveString(key: PrefernceKey.savelanguageKey, value: "de");
    } else {
      Get.updateLocale(Locale(selectedLanguage));
    }
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: Colors.white,
    //     systemNavigationBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Lottie.asset("assets/images/Logorevise.json"),
      ),
    );
  }
}
