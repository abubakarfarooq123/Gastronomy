import 'package:flutter/material.dart';

import '../../../../Helper/NotificatiokKeys.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomButton({Key key, @required this.title, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      height: 49,
      color: Color(AppColor.red),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: AppFont.semiBold
        ),
      ),
      onPressed: onPressed,
    );
  }
}
