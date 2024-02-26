import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/constants/dish_list.dart';
import 'package:flutter/material.dart';

class HighlightedItems extends StatelessWidget {
  final Map<String, List<dynamic>> menu = Dishes.highlightedItems;
  HighlightedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: 155,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: menu['hottest']!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: TopMenuTitles(
                name: menu['popular']![index]['name']!,
                imgUrl: menu['popular']![index]['imgUrl']!,
                price: menu['popular']![index]['price']!,
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
                color: Color.fromARGB(147, 206, 244, 54).withOpacity(0.3),
                blurRadius: 7,
                spreadRadius: 2,
                offset: Offset(0, 4))
          ]),
          child: Column(
            children: [
              Image.asset(
                'assets/images/' + widget.imgUrl,
                width: 90,
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: Text(
                  widget.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 8,
                  ),
                ),
              ),
              Row(
                children: [
                  Text("\$" + widget.price),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.add_circle)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
