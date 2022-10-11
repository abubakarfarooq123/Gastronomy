import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AddressInput extends StatelessWidget {
  final String hintText;
  final maxLines;
  final TextInputType textInputType;
  final String Function(String) validator;
  final TextEditingController controller;
  const AddressInput({Key key, @required this.hintText, this.controller, this.validator,  this.textInputType = TextInputType.text, this.maxLines=1}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: appLightGrey
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: TextFormField(
          maxLines: maxLines,
          controller: controller,
          validator: validator,
          keyboardType: textInputType,
          maxLength: 250,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              hintText: hintText,
          ),
        ),
      ),
    );
  }
}
