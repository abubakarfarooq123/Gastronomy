import 'package:flutter/material.dart';

// import '../../../../Helper/NotificatiokKeys.dart';

class AssetImageInputField extends StatelessWidget {
  final String imageUrl;
  final String hintText;
  final Widget suffix;
  final maxLines;
  final enable;
  final TextInputType textInputType;
  final String Function(String) validator;
  final TextEditingController controller;
  const AssetImageInputField(
      {Key key,
      @required this.hintText,
      this.controller,
      this.validator,
      this.enable,
      this.imageUrl,
      this.textInputType = TextInputType.text,
      this.suffix,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.grey.shade100),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: TextFormField(
          maxLines: maxLines,
          controller: controller,
          enabled: enable,
          onChanged: (value) => {print(value)},
          textInputAction: TextInputAction.next,
          validator: validator,
          keyboardType: textInputType,
          decoration: InputDecoration(
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(color: Color(0xFF8D8D8D), fontSize: 13),
              suffixIcon: suffix,
              prefixIcon: Image.asset(
                imageUrl,
                height: 26,
                color: Color(0xFF7B7E86),
              )),
        ),
      ),
    );
  }
}
