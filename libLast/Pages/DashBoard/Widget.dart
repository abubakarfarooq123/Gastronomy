import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';

class HomeUnits {
  Widget categoryShell({String imgurl, String categoryName, bool isSelected
      /* MaterialColor color,*/
      }) {
    return Container(
      width: Get.width * 0.25,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                height: 60,
                width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Color(0xFFffffff),
                  boxShadow: [
                    BoxShadow(
                        color: isSelected
                            ? Color(0xFFdb8a8a).withOpacity(0.2)
                            : Color(AppColor.logoBgColor),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 20))
                  ],
                ),
                child: SvgPicture.network(
                  "$imgurl",
                  color: isSelected ? Color(0xFFdb8a8a) : Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "$categoryName",
            style: TextStyle(
              fontFamily: isSelected ? AppFont.medium : AppFont.regular,
              fontSize: 12,
              color: isSelected ? Color(0xFF101928) : Color(0xFF87878b),
            ),
          )
        ],
      ),
    );
  }
}
