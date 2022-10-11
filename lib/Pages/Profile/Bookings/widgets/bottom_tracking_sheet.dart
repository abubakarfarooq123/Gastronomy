// import 'package:flutter/material.dart';

// class BottomSheets {
//   static Future<dynamic> _trackBottomSheet(context) {
//     return showModalBottomSheet<dynamic>(
//         // clipBehavior: BorderRadius.only(topLeft: Radius(20),),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
//         ),
//         isScrollControlled: true,
//         context: context,
//         builder: (BuildContext bc) {
//           return SizedBox(
//             height: 770,
//             child: Column(
//               children: [
//                 Stack(children: [
//                   Container(
//                     height: 202,
//                     width: double.maxFinite,
//                     decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(20.0),
//                             topRight: Radius.circular(20.0)),
//                         image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: AssetImage(
//                                 'assets/images/Booking/Rectangle22.png'))),
//                   ),
//                   Positioned(
//                       right: 20,
//                       top: 15,
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Container(
//                             height: 32,
//                             width: 32,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(16),
//                               color: const Color(0xffC4C4C4),
//                             ),
//                             child: const Icon(
//                               Icons.close,
//                             )),
//                       )),
//                   Positioned(
//                     bottom: 10,
//                     right: 40,
//                     child: Container(
//                       height: 52,
//                       width: 332,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFEDEDEA).withOpacity(0.7),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               left: 10,
//                               top: 8,
//                             ),
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: const [
//                                   Text('Distance'),
//                                   Text('3 km',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 18,
//                                         color: Color(0xffE14942),
//                                       ))
//                                 ]),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               right: 45,
//                               top: 5,
//                             ),
//                             child: Row(
//                               children: const [
//                                 Text('Your Food is ',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 12,
//                                     )),
//                                 Text('18 min ',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 16,
//                                       color: Color(0xffE14942),
//                                     )),
//                                 Text('away',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 12,
//                                     )),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ]),
//                 Expanded(
//                     child: Column(
//                   children: [
//                     Container(
//                         margin:
//                             const EdgeInsets.only(top: 16, right: 20, left: 20),
//                         height: 64,
//                         child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           top: 8.0, bottom: 8.0),
//                                       child: Row(
//                                         children: const [
//                                           Text(
//                                             'Booking ID:',
//                                             style: TextStyle(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.w400,
//                                                 color: Colors.grey),
//                                           ),
//                                           SizedBox(width: 3),
//                                           Text(
//                                             '#123456',
//                                             style: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.w600,
//                                               color: Colors.black,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     const Text(
//                                       'Chicken Pizza',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w400,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ]),
//                               const Padding(
//                                 padding: EdgeInsets.only(top: 3),
//                                 child: Text(
//                                   '12.00€',
//                                   style: TextStyle(
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.w600,
//                                       color: Color(0xffE14942)),
//                                 ),
//                               )
//                             ])),
//                     const Divider(height: 4),
//                     Container(
//                       child: Stack(children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   height: 89,
//                                   width: 110,
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xffE14942),
//                                     borderRadius: BorderRadius.circular(10),
//                                     image: const DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: AssetImage(
//                                             'assets/images/Booking/Rectangle(1).png')),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 const Text('Fatija Pizza'),
//                               ],
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   height: 89,
//                                   width: 110,
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xffE14942),
//                                     borderRadius: BorderRadius.circular(10),
//                                     image: const DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: AssetImage(
//                                             'assets/images/Booking/Rectangle(2).png')),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 const Text('Veg Pizza'),
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Container(
//                                   height: 89,
//                                   width: 110,
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xffE14942),
//                                     borderRadius: BorderRadius.circular(10),
//                                     image: const DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: AssetImage(
//                                             'assets/images/Booking/Rectangle(3).png')),
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 20,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Positioned(
//                           right: 20,
//                           child: Container(
//                             height: 89,
//                             width: 110,
//                             decoration: BoxDecoration(
//                               color: Colors.grey.withOpacity(0.8),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: const Center(
//                               child: Text('+3 items',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 22,
//                                     color: Colors.white,
//                                   )),
//                             ),
//                           ),
//                         ),
//                       ]),
//                     ),
//                     Container(
//                         margin:
//                             const EdgeInsets.only(top: 10, right: 20, left: 20),
//                         height: 64,
//                         child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: const [
//                                     Text(
//                                       'Track Your Order',
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                     Padding(
//                                         padding:
//                                             EdgeInsets.only(top: 4, bottom: 4),
//                                         child: Text(
//                                           'Order Status:',
//                                           style: TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w500,
//                                               color: Color(0xff455A64)),
//                                         ))
//                                   ]),
//                               Container(
//                                 height: 35,
//                                 width: 116,
//                                 decoration: BoxDecoration(
//                                   color: const Color(0xFFE14942),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Image.asset(
//                                         'assets/images/Booking/Vector4.png'),
//                                     const SizedBox(width: 5),
//                                     const Text(
//                                       'Live Tracking',
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ])),
//                     Container(
//                         margin: const EdgeInsets.only(left: 30),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(right: 15.0),
//                               child: Column(
//                                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   const SizedBox(height: 27),
//                                   Container(
//                                     height: 16,
//                                     width: 16,
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xffE14942),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     child: const Center(
//                                         child: Icon(Icons.done,
//                                             size: 7.0, color: Colors.white)),
//                                   ),
//                                   Container(
//                                     height: 57,
//                                     width: 1,
//                                     color: const Color(0xffE14942),
//                                   ),
//                                   Container(
//                                     height: 16,
//                                     width: 16,
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xffE14942),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     child: const Center(
//                                         child: Icon(Icons.done,
//                                             size: 7.0, color: Colors.white)),
//                                   ),
//                                   Container(
//                                     height: 57,
//                                     width: 1,
//                                     color: const Color(0xffE14942),
//                                   ),
//                                   Container(
//                                     height: 16,
//                                     width: 16,
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xffE14942),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     child: const Center(
//                                         child: Icon(Icons.done,
//                                             size: 7.0, color: Colors.white)),
//                                   ),
//                                   Container(
//                                     height: 57,
//                                     width: 1,
//                                     color: const Color(0xff7B7E86),
//                                   ),
//                                   Container(
//                                     height: 16,
//                                     width: 16,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: const Color(0xff9E9E9E),
//                                       ),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(5),
//                                   child: Container(
//                                     // margin: EdgeInsets.all(10),
//                                     height: 62,
//                                     width: 314,
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xFFFDF5EF),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Container(
//                                           height: 52,
//                                           width: 53,
//                                           decoration: BoxDecoration(
//                                               color: const Color(0xffE14942),
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               image: const DecorationImage(
//                                                   // fit: BoxFit.cover,
//                                                   image: AssetImage(
//                                                       'assets/images/Booking/Group.png'))),
//                                         ),
//                                         // SizedBox(width: 10),
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               top: 15, bottom: 15, left: 25),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: const [
//                                               Text(
//                                                 'Order Placed',
//                                                 style: TextStyle(
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight.w400,
//                                                     color: Colors.black),
//                                               ),
//                                               SizedBox(height: 2),
//                                               Text(
//                                                 '12:30 AM',
//                                                 style: TextStyle(
//                                                     fontSize: 10,
//                                                     fontWeight: FontWeight.w400,
//                                                     color: Color(0xff7B7E86)),
//                                               )
//                                             ],
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     // child:
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(5),
//                                   child: Container(
//                                     // margin: EdgeInsets.all(10),
//                                     height: 62,
//                                     width: 314,
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xFFFDF5EF),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Container(
//                                           height: 52,
//                                           width: 53,
//                                           decoration: BoxDecoration(
//                                               color: const Color(0xffE14942),
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               image: const DecorationImage(
//                                                   // fit: BoxFit.cover,
//                                                   image: AssetImage(
//                                                       'lib/hart/images/frame.png'))),
//                                         ),
//                                         // SizedBox(width: 10),
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               top: 15, bottom: 15, left: 25),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: const [
//                                               Text(
//                                                 'Order Confirmed',
//                                                 style: TextStyle(
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w400,
//                                                     color: Colors.black),
//                                               ),
//                                               SizedBox(height: 2),
//                                               Text(
//                                                 'Your order has been confirmed',
//                                                 style: TextStyle(
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight.w400,
//                                                     color: Color(0xff7B7E86)),
//                                               )
//                                             ],
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     // child:
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(5),
//                                   child: Container(
//                                     // margin: EdgeInsets.all(10),
//                                     height: 62,
//                                     width: 314,
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xFFFDF5EF),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Container(
//                                           height: 52,
//                                           width: 53,
//                                           decoration: BoxDecoration(
//                                               color: const Color(0xffE14942),
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               image: const DecorationImage(
//                                                   // fit: BoxFit.cover,
//                                                   image: AssetImage(
//                                                       'lib/hart/images/Frame (2).png'))),
//                                         ),
//                                         // SizedBox(width: 10),
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               top: 15, bottom: 15, left: 25),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: const [
//                                               Text(
//                                                 'Order Processed',
//                                                 style: TextStyle(
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight.w400,
//                                                     color: Colors.black),
//                                               ),
//                                               SizedBox(height: 2),
//                                               Text(
//                                                 'We are preparing your order',
//                                                 style: TextStyle(
//                                                     fontSize: 10,
//                                                     fontWeight: FontWeight.w400,
//                                                     color: Color(0xff7B7E86)),
//                                               )
//                                             ],
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     // child:
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(5),
//                                   child: Container(
//                                     // margin: EdgeInsets.all(10),
//                                     height: 62,
//                                     width: 314,
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xFFF9F9FB),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Container(
//                                           height: 52,
//                                           width: 53,
//                                           decoration: BoxDecoration(
//                                               color: const Color(0xffDADADA),
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               image: const DecorationImage(
//                                                   // fit: BoxFit.cover,
//                                                   image: AssetImage(
//                                                       'assets/images/Booking//bike.png'))),
//                                         ),
//                                         // SizedBox(width: 10),
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               top: 15, bottom: 15, left: 25),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: const [
//                                               Text(
//                                                 'Order Shipped',
//                                                 style: TextStyle(
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight.w400,
//                                                     color: Colors.black),
//                                               ),
//                                               SizedBox(height: 2),
//                                               Text(
//                                                 'Your order will be deliver at 01:30 AM',
//                                                 style: TextStyle(
//                                                     fontSize: 10,
//                                                     fontWeight: FontWeight.w400,
//                                                     color: Color(0xff7B7E86)),
//                                               )
//                                             ],
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     // child:
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ))
//                   ],
//                 )),
//               ],
//             ),
//           );
//         });
//   }
// }
