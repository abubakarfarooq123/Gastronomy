import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class InputFieldWithoutIcon extends StatelessWidget {
  final String hintText;
  final Widget suffix;
  final maxLines;
  final TextInputType textInputType;
  final String Function(String) validator;
  final TextEditingController controller;
  const InputFieldWithoutIcon({Key key, @required this.hintText, this.controller, this.validator, this.textInputType = TextInputType.text, this.suffix, this.maxLines=1}) : super(key: key,);

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
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              hintText: hintText,
              suffixIcon: suffix
          ),
        ),
      ),
    );
  }
}

