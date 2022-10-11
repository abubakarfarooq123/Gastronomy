import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Helper/NotificatiokKeys.dart';
import 'message_list_page.dart';

class UserList extends StatelessWidget {
  const UserList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return ListTile(
            onTap: () {
              Get.to(() => MessageListPage());
            },
            tileColor:
                index.isEven ? Colors.grey.withOpacity(0.03) : Colors.white,
            contentPadding:
                EdgeInsets.only(left: 10, right: 15, top: 20, bottom: 10),
            leading: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg"))),
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 44),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        shape: BoxShape.circle),
                    child: Center(
                        child: Icon(
                      Icons.circle,
                      color: index.isEven ? Colors.green : Colors.grey,
                      size: 12,
                    ))),
              ),
            ),
            title: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text(
                "Omar Stanton",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFont.medium,
                ),
              ),
            ),

            subtitle: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 11,
                fontWeight: FontWeight.normal,
                fontFamily: AppFont.regular,
              ),
            ),
            trailing: index.isEven
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(AppColor.red),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        '${index + 2}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: AppFont.regular,
                        ),
                      ),
                    ),
                  )
                : SizedBox());
      },
    ));
  }
}
