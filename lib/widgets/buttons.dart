import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final void Function() onTap;
  final double? width;
  final double? height;
  final FontWeight? fontWeight;
  final double? fontSize;
  const MyButton({
    super.key,
    required this.text,
    this.color,
    required this.onTap,
    this.width,
    this.height,
    this.fontWeight,
    this.fontSize,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
                fontWeight: fontWeight, fontSize: fontSize, color: textColor),
          ),
          width: width,
          height: height ?? 50,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(13)),
        ),
      ),
    );
  }
}
