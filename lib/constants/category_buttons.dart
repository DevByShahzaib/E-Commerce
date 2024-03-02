import 'package:e_commerce/widgets/buttons.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  static String category = 'hottest';
  CategoryButton({super.key});

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  bool isBold1 = false;
  bool isBold2 = false;
  bool isBold3 = false;
  selectCategory1() {
    setState(() {
      isBold1 = !isBold1;
      isBold2 = false;
      isBold3 = false;
      CategoryButton.category = 'hottest';
    });
  }

  selectCategory2() {
    setState(() {
      isBold2 = !isBold2;
      isBold1 = false;
      isBold3 = false;
      CategoryButton.category = 'popular';
    });
  }

  selectCategory3() {
    setState(() {
      isBold3 = !isBold3;
      isBold2 = false;
      isBold1 = false;
      CategoryButton.category = 'top';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          MyButton(
            text: "Hottest",
            color: Color(0xffE5E5E5),
            onTap: selectCategory1,
            width: 50,
            height: 30,
            fontSize: isBold1 ? 14 : 11,
            fontWeight: isBold1 ? FontWeight.bold : FontWeight.normal,
          ),
          MyButton(
            text: "Popular",
            color: Color(0xffE5E5E5),
            onTap: selectCategory2,
            width: 50,
            height: 30,
            fontSize: isBold2 ? 14 : 11,
            fontWeight: isBold2 ? FontWeight.bold : FontWeight.normal,
          ),
          MyButton(
            text: "Top",
            color: Color(0xffE5E5E5),
            onTap: selectCategory3,
            width: 50,
            height: 30,
            fontSize: isBold3 ? 14 : 11,
            fontWeight: isBold3 ? FontWeight.bold : FontWeight.normal,
          ),
        ],
      ),
    );
  }
}
