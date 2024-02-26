import 'package:e_commerce/constants/category_buttons.dart';
import 'package:e_commerce/constants/highlighted_items.dart';
import 'package:e_commerce/constants/top_menu.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  HomeScreen({super.key, required this.name});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 10, left: 23),
                child: Icon(Icons.menu, size: 30)),
            Container(
                width: 60,
                height: 60,
                child: Image.asset('assets/images/basket_icon.png'))
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.88,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 10,
                runSpacing: 8,
                children: [
                  Text(
                    'Hello ${widget.name},',
                    style: TextStyle(fontSize: 19),
                  ),
                  Text(
                    'What fruit salad',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  Text(
                    'combo do you want today?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyTextField(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search for fruit salad combos',
                    customWidth: 330,
                  ),
                  Icon(Icons.filter_alt)
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                textAlign: TextAlign.start,
                "Recommended Combo",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TopMenu(),
        SizedBox(
          height: 15,
        ),
        CategoryButton(),
        HighlightedItems()
      ],
    ));
  }
}
