// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../Helper/NotificatiokKeys.dart';
// import '../DashBoard/DashBoardView.dart';
// import '../DashBoard/Notification/notificationView.dart';
// import '../Favourite/favouriteView.dart';
// import '../Profile/Profile_view.dart';
// import 'bottombar_controller.dart';
//
// class CustomShape extends StatefulWidget {
//   const CustomShape({Key key, this.pageIndex}) : super(key: key);
//   final int pageIndex;
//   @override
//   State<CustomShape> createState() => _CustomShapeState();
// }
//
// class _CustomShapeState extends State<CustomShape> {
//   var currentIndex = 0;
//
//   selectedIndex(index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }
//
//   @override
//   void initState() {
//     if (widget.pageIndex != null) {
//       currentIndex = widget.pageIndex;
//       setState(() {});
//     }
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       bottomNavigationBar: Stack(
//         children: [
//           Positioned(
//               bottom: 0,
//               left: 0,
//               child: Container(
//                 width: size.width,
//                 // color: Colors.white,
//                 height: 80,
//                 child: Stack(
//                   children: [
//                     CustomPaint(
//                       size: Size(size.width, 80),
//                       painter: RPSCustomPainter(),
//                     ),
//                     Center(
//                       heightFactor: 0.2,
//                       child: Container(
//                         height: 65,
//                         width: 65,
//                         child: FloatingActionButton(
//                             backgroundColor: Color(0xFFffffff),
//                             child: Center(
//                               child: Image.asset(
//                                 AssestPath.bottomnavbar + "LOGO.png",
//                                 height: 40,
//                               ),
//                             ),
//                             elevation: 1,
//                             onPressed: () {
//                               Get.offAllNamed('/selectMainCategory');
//                             }),
//                       ),
//                     ),
//                     Container(
//                       width: Get.width,
//                       height: 80,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               SizedBox(
//                                 width: Get.width * 0.2,
//                                 child: iconButton(
//                                   iconImg: "Home2.png",
//                                   iconName: 'home'.tr,
//                                   currentInd: 0,
//                                   selectedind: 0,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: Get.width * 0.2,
//                                 child: iconButton(
//                                   iconImg: "Fav.png",
//                                   iconName: 'favourite'.tr,
//                                   currentInd: 1,
//                                   selectedind: 1,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               SizedBox(
//                                 width: Get.width * 0.2,
//                                 child: iconButton(
//                                   iconImg: "Notification.png",
//                                   iconName: 'notification'.tr,
//                                   currentInd: 2,
//                                   selectedind: 2,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: Get.width * 0.2,
//                                 child: iconButton(
//                                   iconImg: "User.png",
//                                   iconName: 'profile'.tr,
//                                   currentInd: 3,
//                                   selectedind: 3,
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ))
//         ],
//       ),
//       body: Stack(
//         children: [
//           if (currentIndex == 0)
//             DashBoardView()
//           else if (currentIndex == 1)
//             FavouriteView()
//           else if (currentIndex == 2)
//             NotificationView()
//           else
//             ProfileView()
//         ],
//       ),
//     );
//   }
//
//   Widget iconButton(
//       {page, currentInd, selectedind, String iconImg, String iconName}) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           height: 35,
//           child: IconButton(
//             icon: Image.asset(
//               AssestPath.bottomnavbar + "$iconImg",
//               color: currentIndex == currentInd
//                   ? Color(AppColor.red)
//                   : Color(0xFF7f848d),
//               height: 25,
//             ),
//             onPressed: () {
//               selectedIndex(selectedind);
//             },
//           ),
//         ),
//         Text(
//           "$iconName",
//           style: TextStyle(
//             fontSize: 10,
//             color:
//                 currentIndex == currentInd ? Colors.black : Color(0xFF7f848d),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.5517267);
    path_0.cubicTo(
        size.width * 0.5154365,
        size.height * 0.5517587,
        size.width * 0.5306218,
        size.height * 0.5319240,
        size.width * 0.5441091,
        size.height * 0.4940933);
    path_0.cubicTo(
        size.width * 0.5575990,
        size.height * 0.4562613,
        size.width * 0.5689442,
        size.height * 0.4016813,
        size.width * 0.5770660,
        size.height * 0.3355160);
    path_0.lineTo(size.width * 0.5770685, size.height * 0.3354960);
    path_0.cubicTo(
        size.width * 0.5847157,
        size.height * 0.2727120,
        size.width * 0.5954315,
        size.height * 0.2207760,
        size.width * 0.6082030,
        size.height * 0.1846493);
    path_0.cubicTo(
        size.width * 0.6209746,
        size.height * 0.1485227,
        size.width * 0.6353706,
        size.height * 0.1294135,
        size.width * 0.6500279,
        size.height * 0.1291537);
    path_0.lineTo(size.width * 0.9987310, size.height * 0.1291537);
    path_0.lineTo(size.width * 0.9987310, size.height * 0.9878240);
    path_0.lineTo(size.width * 0.9093325, size.height * 0.9878107);
    path_0.lineTo(size.width * 0.001269036, size.height * 0.9878107);
    path_0.lineTo(size.width * 0.001269036, size.height * 0.1291407);
    path_0.lineTo(size.width * 0.3499619, size.height * 0.1291407);
    path_0.cubicTo(
        size.width * 0.3646218,
        size.height * 0.1293964,
        size.width * 0.3790228,
        size.height * 0.1485067,
        size.width * 0.3917944,
        size.height * 0.1846373);
    path_0.cubicTo(
        size.width * 0.4045660,
        size.height * 0.2207693,
        size.width * 0.4152843,
        size.height * 0.2727147,
        size.width * 0.4229315,
        size.height * 0.3355093);
    path_0.lineTo(size.width * 0.4229340, size.height * 0.3355293);
    path_0.cubicTo(
        size.width * 0.4310558,
        size.height * 0.4016933,
        size.width * 0.4424036,
        size.height * 0.4562707,
        size.width * 0.4558909,
        size.height * 0.4941013);
    path_0.cubicTo(
        size.width * 0.4693807,
        size.height * 0.5319293,
        size.width * 0.4845635,
        size.height * 0.5517613,
        size.width * 0.5000000,
        size.height * 0.5517267);
    path_0.close();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.5517267);
    path_0.cubicTo(
        size.width * 0.5000000,
        size.height * 0.5517267,
        size.width * 0.5000000,
        size.height * 0.5517267,
        size.width * 0.5000000,
        size.height * 0.5517267);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.5450600);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.5517267);
    path_0.cubicTo(
        size.width * 0.5000000,
        size.height * 0.5517267,
        size.width * 0.5000000,
        size.height * 0.5517267,
        size.width * 0.5000000,
        size.height * 0.5517267);
    path_0.close();

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5..color=Colors.grey[100];
    // paint_0_stroke.shader = ui.Gradient.linear(Offset(size.width*0.5013325,size.height*-48.79280), Offset(size.width*0.5001117,size.height*0.9944933), [Color(0xffE5E5E5).withOpacity(1),Color(0xff000000).withOpacity(0)], [0,0.614583]);
    canvas.drawPath(path_0, paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
