import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color color;
  final void Function()? onTap;
  MyButton(
      {super.key,
      required this.text,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          alignment: Alignment.center,
          child: Text(text),
          height: 50,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
