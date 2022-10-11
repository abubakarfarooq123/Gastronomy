import 'package:get/get.dart';
import 'package:reserved4u/Pages/Authentication/ForgotPassword/ForgotPasswordView.dart';
import 'package:reserved4u/Pages/Authentication/Introduction/IntroductionView.dart';
import 'package:reserved4u/Pages/Authentication/Login/LoginView.dart';
import 'package:reserved4u/Pages/Authentication/SignUp/SignUpView.dart';
import 'package:reserved4u/Pages/DashBoard/DashBoardView.dart';
import 'package:reserved4u/Pages/DashBoard/Filters/FilterView.dart';
import 'package:reserved4u/Pages/DashBoard/Filters/Mapview.dart';
import 'package:reserved4u/Pages/MainCategory/SelectMainCategoryView.dart';
import 'package:reserved4u/Pages/Profile/MyBooking/MyBooking.dart';
import 'package:reserved4u/Pages/Profile/Setting/About_View.dart';
import 'package:reserved4u/Pages/Profile/Setting/Change_Password.dart';
import 'package:reserved4u/Pages/Profile/Setting/PrivatePolicy.dart';
import 'package:reserved4u/Pages/Profile/Setting/cencelPolicy.dart';
import 'package:reserved4u/Pages/Profile/Setting/givenReview.dart';
import 'package:reserved4u/Pages/Profile/Setting/setting_page.dart';
import 'package:reserved4u/Pages/Profile/Setting/term&condition.dart';
import 'package:reserved4u/Pages/Tabbar/BottomNavBar.dart';
import 'package:reserved4u/Pages/splashView.dart';
import '../Pages/DashBoard/Resturant/resturant_details_view.dart';
import '../Reviews/GiveFeedBack/GiveFeedback.dart';

class RouterForApp {
  static final route = [
    GetPage(
      name: '/dashboard',
      page: () => DashBoardView(),
    ),
    GetPage(
      name: '/filter',
      page: () => FilterView(),
    ),
    GetPage(
      name: '/splashView',
      page: () => SplashView(),
    ),
    GetPage(
      name: '/introduction',
      page: () => IntroductionView(),
    ),
    GetPage(
      name: '/login',
      transition: Transition.downToUp,
      page: () => LoginView(),
    ),
    GetPage(
      name: '/signup',
      page: () => SignUpView(),
    ),
    GetPage(
      name: '/forgotPassword',
      page: () => ForgotPasswordView(),
    ),
    GetPage(
      name: '/selectMainCategory',
      page: () => SelectMainCategoryView(),
    ),
    GetPage(
      name: '/mapView',
      page: () => MapView(),
    ),
    GetPage(
      name: '/restaurantDetails',
      page: () => RestaurantDetailView(),
    ),
    GetPage(
      name: '/bookingView',
      page: () => MyBooking(),
    ),
    GetPage(
      name: '/bottomNavBar',
      page: () => BottomNavBar(),
    ),
    GetPage(
      name: '/settingView',
      page: () => SettingView(),
    ),
    GetPage(
      name: '/changePassword',
      page: () => ChangePassword(),
    ),
    GetPage(
      name: '/givenreview',
      page: () => Givenreview(),
    ),
    GetPage(
      name: '/aboutView',
      page: () => AboutView(),
    ),
    GetPage(
      name: '/termConditon',
      page: () => TermConditon(),
    ),
    GetPage(
      name: '/cancelPolicy',
      page: () => CancelPolicy(),
    ),
    GetPage(
      name: '/privatePolicyView',
      page: () => PrivatePolicyView(),
    ),
  ];
}
