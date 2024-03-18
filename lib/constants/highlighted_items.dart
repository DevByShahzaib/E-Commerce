import 'package:e_commerce/constants/basket_items.dart';
import 'package:e_commerce/constants/constant.dart';
import 'package:e_commerce/constants/dish_list.dart';
import 'package:e_commerce/screens/add_to_basket.dart';
import 'package:e_commerce/widgets/buttons.dart';
import 'package:flutter/material.dart';

class HighlightedItems extends StatefulWidget {
  HighlightedItems({super.key});

  @override
  State<HighlightedItems> createState() => _HighlightedItemsState();
}

class _HighlightedItemsState extends State<HighlightedItems> {
  String selectedCategory = "hottest";
  selectCategory1() {
    setState(() {
      selectedCategory = 'hottest';
    });
  }

  selectCategory2() {
    setState(() {
      selectedCategory = 'popular';
    });
  }

  selectCategory3() {
    setState(() {
      selectedCategory = 'top';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            MyButton(
              text: "Hottest",
              color: Color(0xffE5E5E5),
              onTap: selectCategory1,
              width: 50,
              height: 30,
              fontSize: selectedCategory == "hottest" ? 14 : 11,
              fontWeight: selectedCategory == "hottest"
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
            MyButton(
              text: "Popular",
              color: Color(0xffE5E5E5),
              onTap: selectCategory2,
              width: 50,
              height: 30,
              fontSize: selectedCategory == "popular" ? 13 : 11,
              fontWeight: selectedCategory == "popular"
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
            MyButton(
              text: "Top",
              color: Color(0xffE5E5E5),
              onTap: selectCategory3,
              width: 50,
              height: 30,
              fontSize: selectedCategory == "top" ? 14 : 11,
              fontWeight: selectedCategory == "top"
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ],
        ),
        Container(
          // color: Colors.amber,
          height: 160,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Dishes.highlightedItems[selectedCategory]!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: TopMenuTitles(
                    id: Dishes.highlightedItems[selectedCategory]![index]["id"],
                    name: Dishes.highlightedItems[selectedCategory]![index]
                        ['name']!,
                    imgUrl: Dishes.highlightedItems[selectedCategory]![index]
                        ['imgUrl']!,
                    price: Dishes.highlightedItems[selectedCategory]![index]
                        ['price']!,
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class TopMenuTitles extends StatefulWidget {
  TopMenuTitles({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.price,
  });
  final int id;
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
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddToBasket(
                        id: widget.id,
                        name: widget.name,
                        imgUrl: widget.imgUrl,
                        price: widget.price)));
          },
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: iconDecoration.copyWith(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(147, 206, 244, 54).withOpacity(0.3),
                    blurRadius: 7,
                    spreadRadius: 2,
                    offset: Offset(0, 4))
              ],
            ),
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
                    InkWell(
                        onTap: () {
                          // var productIndex = BasketItems.itemList.indexWhere(
                          //     (element) => element["id"] == widget.id);
                          int foundIndex = -1;
                          for (var i = 0;
                              i < BasketItems.itemList.length;
                              i++) {
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
        ),
      ],
    );
  }
}
