import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/constants/dish_list.dart';
import 'package:flutter/material.dart';

class TopMenu extends StatelessWidget {
  final List<Map<String, String>> menu = Dishes.dish;
  TopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: menu.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: TopMenuTitles(
                name: menu[index]['name']!,
                imgUrl: menu[index]['imgUrl']!,
                price: menu[index]['price']!,
              ),
            );
          }),
    );
  }
}

class TopMenuTitles extends StatefulWidget {
  TopMenuTitles(
      {required this.name, required this.imgUrl, required this.price});

  final String name;
  final String imgUrl;
  final String price;
  @override
  State<TopMenuTitles> createState() => _TopMenuTitlesState();
}

class _TopMenuTitlesState extends State<TopMenuTitles> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: iconDecoration
              .copyWith(borderRadius: BorderRadius.circular(10), boxShadow: [
            BoxShadow(
                color: Color.fromARGB(148, 244, 171, 54).withOpacity(0.3),
                blurRadius: 7,
                spreadRadius: 2,
                offset: Offset(0, 4))
          ]),
          child: Column(
            children: [
              Image.asset(
                'assets/images/' + widget.imgUrl,
                width: 120,
                height: 120,
              ),
              Text(
                widget.name,
                style: TextStyle(
                  color: Color(0xFF6E6E71),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Row(
                children: [
                  Text("\$" + widget.price),
                  SizedBox(
                    width: 36,
                  ),
                  Icon(Icons.add_circle)
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
