
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final double height;
  final double width;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final TextEditingController controller;
  const AppInput({
    Key key,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.controller,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 51.24,
      width: width ?? double.infinity,
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          labelText: hintText ?? '',
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          filled: true,
          fillColor: const Color(0xfff9f9fb),
          hintStyle: const TextStyle(
            color: Color(0xff8d8d8d),
            fontSize: 15,
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(14))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(14))),
        ),
      ),
    );
  }
}
