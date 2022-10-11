// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'dart:ui';
// import 'package:get/get.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:reserved4u/Helper/NotificatiokKeys.dart';
// import 'package:reserved4u/Helper/commanWidgets.dart';
// import 'package:reserved4u/Pages/Notification/notification_controller.dart';
// import 'package:reserved4u/Pages/Notification/notifications_model.dart';
// import 'package:intl/intl.dart';

// class NotificationView extends StatelessWidget {
//   NotificationController controller = Get.put(NotificationController());
//   var img = [
//     "assets/images/Profile/c.png",
//     "assets/images/Profile/b.png",
//     "assets/images/Profile/a.png"
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: Get.width,
//         height: Get.height,
//         child: Column(
//           children: [
//             Container(
//               width: Get.width,
//               color: Color(AppColor.maincategorySelectedColor),
//               margin: EdgeInsets.only(left: 0, top: 0, bottom: 0),
//               padding: EdgeInsets.only(left: 20, top: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Image.asset(
//                     AssestPath.profile + "Logo_Home.png",
//                     height: 30,
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Notification',
//                     style: TextStyle(fontFamily: AppFont.bold, fontSize: 22),
//                   ),
//                   SizedBox(height: 20),
//                 ],
//               ),
//             ),
//             Obx(() => controller.loader.value == false
//                 ? controller.notification.value.responseData.length == 0
//                     ? Expanded(
//                         child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SvgPicture.asset(
//                             AssestPath.noNotifiation + 'noNotification.svg',
//                           ),
//                           SizedBox(
//                             height: 25,
//                           ),
//                           Text(
//                             "No notifications yet!",
//                             style: TextStyle(
//                                 color: Color(0xFF7B7B7B), fontSize: 20),
//                           ),
//                         ],
//                       ))
//                     : Expanded(
//                         child: ListView.builder(
//                           physics: BouncingScrollPhysics(),
//                           padding: EdgeInsets.only(top: 10),
//                           itemCount:
//                               controller.notification.value.responseData.length,
//                           itemBuilder: (context, index) {
//                             // timeAgo(DateTime.parse(obj.updatedAt.toString()));
//                             return Obx(() => Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: notificationView(
//                                       controller.notification.value
//                                           .responseData[index].title,
//                                       controller.notification.value
//                                           .responseData[index].description,
//                                       controller.notification.value
//                                           .responseData[index].timeago,
//                                       controller.notification.value
//                                           .responseData[index].type,
//                                       controller.notification.value
//                                           .responseData[index].createdAt),
//                                 ));
//                           },
//                         ),
//                       )
//                 : Expanded(
//                     child: CommanWidget().showlolder(
//                         isshowDilog: controller.loader.value, height: 0))),
//           ],
//         ),
//       ),
//     );
//   }

//   String timeAgo(DateTime d) {
//     Duration diff = DateTime.now().difference(d);
//     if (diff.inDays > 365)
//       return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
//     if (diff.inDays > 30)
//       return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
//     if (diff.inDays > 7)
//       return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
//     if (diff.inDays > 0)
//       return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
//     if (diff.inHours > 0)
//       return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
//     if (diff.inMinutes > 0)
//       return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
//     return "just now";
//   }

//   Widget notificationView(title, desc, timeago, type, time) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 5),
//       color: Colors.grey.shade100,
//       child: Row(children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
//           child: Image.asset(
//             "assets/images/Profile/c.png",
//             height: 50,
//             width: 50,
//             fit: BoxFit.cover,
//           ),
//         ),
//         Container(
//           child: Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   title,
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   desc,
//                   style: TextStyle(
//                       color: Color(AppColor.greytextColor),
//                       fontWeight: FontWeight.w400,
//                       fontSize: 12),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "${timeago} second ago",
//                       style: TextStyle(
//                           color: Color(AppColor.greytextColor),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 12),
//                     ),
//                     Text(
//                       "${DateFormat('hh:mm a').format(time)}   ",
//                       style: TextStyle(
//                           color: Color(AppColor.greytextColor),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 12),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         )
//       ]),
//     );
//   }

//   String getMonthName(int month) {
//     List<String> list = [
//       'january'.tr,
//       'february'.tr,
//       'march'.tr,
//       'april'.tr,
//       'may'.tr,
//       'june'.tr,
//       'july'.tr,
//       'august'.tr,
//       'september'.tr,
//       'october'.tr,
//       'november'.tr,
//       'december'.tr,
//     ];

//     return list[month - 1];
//   }

//   bool isToday(DateTime time) {
//     DateTime now = DateTime.now();

//     if (now.day == time.day &&
//         now.month == time.month &&
//         now.year == time.year) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:intl/intl.dart';
import 'package:reserved4u/Pages/Notification/notifications_model.dart';

import '../../Helper/NotificatiokKeys.dart';
import '../../Helper/commanWidgets.dart';
import 'notification_controller.dart';

class NotificationView extends StatefulWidget {
  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  NotificationController _notificationController =
      Get.put(NotificationController());

  @override
  void initState() {
    super.initState();
    print("notification");
    _notificationController.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Container(
              width: Get.width,
              color: Color(AppColor.maincategorySelectedColor),
              margin: EdgeInsets.only(left: 0, top: 0, bottom: 0),
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AssestPath.profile + "Logo_Home.png",
                    height: 20,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'notification'.tr,
                    style: TextStyle(fontFamily: AppFont.bold, fontSize: 22),
                  )
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if (_notificationController.loader.isFalse) {
                  return _notificationController
                              .notificationModel.value.responseData.length ==
                          0
                      ? Expanded(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AssestPath.noNotifiation + 'noNotification.svg',
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "No notifications yet!",
                              style: TextStyle(
                                  color: Color(0xFF7B7B7B), fontSize: 20),
                            ),
                          ],
                        ))
                      : SmartRefresher(
                          controller: _notificationController.refreshController,
                          onRefresh: () {
                            _notificationController.getNotifications();
                          },
                          header: ClassicHeader(
                            completeText: 'refreshCompleted'.tr,
                            releaseText: 'releaseToRefresh'.tr,
                            idleText: 'pullDownRefresh'.tr,
                          ),
                          enablePullDown: true,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.only(top: 10),
                            itemCount: _notificationController
                                .notificationModel.value.responseData.length,
                            itemBuilder: (context, index) {
                              ResponseDatum obj = _notificationController
                                  .notificationModel.value.responseData[index];
                              timeAgo(DateTime.parse(obj.updatedAt.toString()));
                              return Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    print('onNotificationTap');
                                    print(obj);
                                    _notificationController
                                        .onNotificationTap(obj);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade200,
                                          width: 0.5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(AppColor
                                              .maincategorySelectedColor),
                                          offset: Offset(0, 0.7),
                                          blurRadius: 3,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              obj.title,
                                              style: TextStyle(
                                                color: obj.title ==
                                                        "Termin storniert !"
                                                    ? Color(0xFFdb8a8a)
                                                    : obj.title ==
                                                            "Appointment Postpond !"
                                                        ? Color(0xFFfaba5f)
                                                        : obj.title ==
                                                                "Feedback reply !"
                                                            ? Color(0xFF17a2b8)
                                                            : Colors.black,
                                                fontSize: 14.5,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              isToday(obj.createdAt.toLocal())
                                                  ? DateFormat('kk:mm').format(
                                                      obj.createdAt.toLocal())
                                                  : DateFormat(
                                                          'dd.MM.yyyy',
                                                          'nextbtn'.tr == "Next"
                                                              ? 'de'
                                                              : 'en')
                                                      .format(obj.createdAt
                                                          .toLocal()),
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          obj.description.trimLeft(),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13.5,
                                          ),
                                        ),
                                        SizedBox(height: 35),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              obj.timeago,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15),
                                            ),
                                            _notificationController
                                                        .notificationModel
                                                        .value
                                                        .responseData[index]
                                                        .type ==
                                                    Type.CUSTOMER_REQUEST
                                                ? Row(
                                                    children: [
                                                      InkWell(
                                                          onTap: () =>
                                                              _notificationController
                                                                  .setPermission(
                                                                      obj, "1"),
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xff006633),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25)),
                                                            child: Text(
                                                              "accept".tr,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          )),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      InkWell(
                                                        onTap: () =>
                                                            _notificationController
                                                                .setPermission(
                                                                    obj, "2"),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xffff0000),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)),
                                                          child: Text(
                                                            "reject".tr,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : (_notificationController
                                                            .notificationModel
                                                            .value
                                                            .responseData[index]
                                                            .type ==
                                                        Type.REVIEW_REQUEST
                                                    ? InkWell(
                                                        onTap: () => _notificationController
                                                            .giveFeedBack(
                                                                _notificationController
                                                                    .notificationModel
                                                                    .value
                                                                    .responseData[index]),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .yellow),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          child: Text(
                                                            "review".tr,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      )
                                                    : Container())
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                } else {
                  return CommanWidget(context: context)
                      .showlolder(isshowDilog: true);
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  String timeAgo(DateTime d) {
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365)
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    if (diff.inDays > 30)
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    if (diff.inDays > 7)
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    if (diff.inDays > 0)
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    if (diff.inHours > 0)
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    if (diff.inMinutes > 0)
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    return "just now";
  }

  String getMonthName(int month) {
    List<String> list = [
      'january'.tr,
      'february'.tr,
      'march'.tr,
      'april'.tr,
      'may'.tr,
      'june'.tr,
      'july'.tr,
      'august'.tr,
      'september'.tr,
      'october'.tr,
      'november'.tr,
      'december'.tr,
    ];

    return list[month - 1];
  }

  bool isToday(DateTime time) {
    DateTime now = DateTime.now();

    if (now.day == time.day &&
        now.month == time.month &&
        now.year == time.year) {
      return true;
    } else {
      return false;
    }
  }

  void detailPopup(ResponseDatum obj) {}
}
