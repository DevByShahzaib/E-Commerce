import 'package:e_commerce/constants/basket_items.dart';
import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/constants/dish_list.dart';
import 'package:flutter/material.dart';

class TopMenu extends StatelessWidget {
  TopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var all = [];
    for (var categories in Dishes.highlightedItems.values) {
      all.addAll(categories);
      // print(all);
    }
    return Container(
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: all.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: TopMenuTitles(
                name: all[index]['name']!,
                imgUrl: all[index]['imgUrl']!,
                price: all[index]['price']!,
                id: all[index]["id"]!,
              ),
            );
          }),
    );
  }
}

class TopMenuTitles extends StatefulWidget {
  TopMenuTitles(
      {required this.name,
      required this.imgUrl,
      required this.price,
      required this.id});

  final String name;
  final String imgUrl;
  final String price;
  final int? id;
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
                  InkWell(
                      onTap: () {
                        // var productIndex = BasketItems.itemList.indexWhere(
                        //     (element) => element["id"] == widget.id);
                        int foundIndex = -1;
                        for (var i = 0; i < BasketItems.itemList.length; i++) {
                          var item = BasketItems.itemList[i];
                          if (item["id"] == widget.id) {
                            foundIndex = i;
                            break;
                          }
                        }
                        if (foundIndex == -1) {
                          BasketItems.itemList.add({
                            "id": widget.id,
                            "name": widget.name,
                            "price": widget.price,
                            "imageUrl": widget.imgUrl,
                            "quantity": 1
                          });
                          
                        } else {
                          BasketItems.itemList[foundIndex]["quantity"] += 1;
                        }
                      },
                      child: Icon(Icons.add_circle))
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
