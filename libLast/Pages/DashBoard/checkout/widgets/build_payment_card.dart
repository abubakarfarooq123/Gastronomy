import 'package:flutter/material.dart';

class BuildPaymentCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;
  final Color bgColor;
  const BuildPaymentCard({Key key, @required this.title, @required this.imageUrl, @required this.bgColor, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Column(
            children: [
              Image.asset(imageUrl, height: 40,),
              Text(
                  title
              )
            ],
          ),
        ),
      ),
    );
  }
}
