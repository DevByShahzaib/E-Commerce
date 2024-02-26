import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final double? customWidth;
  final String? hintText;
  final Widget? prefixIcon;
  const MyTextField(
      {super.key,
      this.controller,
      this.customWidth,
      this.hintText,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: customWidth,
      decoration: BoxDecoration(
          color: Color(0xffE5E5E5), borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
