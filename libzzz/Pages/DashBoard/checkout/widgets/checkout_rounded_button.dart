import 'package:flutter/material.dart';

import '../../../../Helper/NotificatiokKeys.dart';

class CheckoutRoundedButton extends StatelessWidget {
  final String amount;
  final VoidCallback onPressed;
  const CheckoutRoundedButton({Key key, @required this.amount, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      MaterialButton(
        height: 49,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        color: Color(AppColor.red),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Checkout", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
            Text(amount, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
          ],
        ),
      );
  }
}
