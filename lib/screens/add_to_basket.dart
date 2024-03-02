import 'package:e_commerce/constants/basket_items.dart';
import 'package:e_commerce/widgets/buttons.dart';
import 'package:flutter/material.dart';

class AddToBasket extends StatefulWidget {
  final int id;
  final String name;
  final String imgUrl;
  final String price;
  const AddToBasket(
      {super.key,
      required this.id,
      required this.name,
      required this.imgUrl,
      required this.price});

  @override
  State<AddToBasket> createState() => _AddToBasketState();
}

class _AddToBasketState extends State<AddToBasket> {
  bool check = false;
  bool checkfav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.amber,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    color: Color(0xffFFA451),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 1,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 10,
                          top: 30,
                          child: Container(
                            width: 40,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 95,
                            left: 95,
                            child: Container(
                              // color: Colors.amber,
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child:
                                  Image.asset('assets/images/' + widget.imgUrl),
                            ))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 300,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Colors.white,
                    ),
                    width: 411,
                    height: 600,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Text(
                                textAlign: TextAlign.left,
                                '${widget.name}',
                                style: TextStyle(fontSize: 30),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, left: 16.0),
                                    child: Container(
                                        width: 100,
                                        height: 30,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.add_circle,
                                              size: 30,
                                            ),
                                            Text('1'),
                                            Icon(
                                              Icons.remove_circle,
                                              size: 30,
                                            ),
                                          ],
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, left: 16.0),
                                    child: Container(
                                      // color: Colors.amber,
                                      child: Text(
                                        '\$ ${widget.price}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, left: 16.0),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'One Pack Contains',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, left: 16.0),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Red Quinao, Lime, Honey, BlueBerris, Strawberries, Mango, Fresh Mint',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                                height: 70,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, left: 16.0),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'If you are looking for a new fruit salad for eat today, quinoa is the best option for you',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        checkfav = !checkfav;
                                      });
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      size: 50,
                                      color:
                                          checkfav ? Colors.red : Colors.white,
                                      shadows: [
                                        Shadow(
                                          color:
                                              Color.fromARGB(255, 252, 147, 50),
                                          blurRadius: 30,
                                        )
                                      ],
                                    ),
                                  ),
                                  MyButton(
                                    textColor:
                                        check ? Colors.green : Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    text: check ? 'Added' : 'Add to Cart',
                                    onTap: () {
                                      check = true;
                                      setState(() {});
                                      var productIndex = BasketItems.itemList
                                          .indexWhere((element) =>
                                              element["id"] == widget.id);
                                      if (productIndex == -1) {
                                        BasketItems.itemList.add({
                                          "id": widget.id,
                                          "name": widget.name,
                                          "price": widget.price,
                                          "imageUrl": widget.imgUrl,
                                          "quantity": 1
                                        });
                                      } else {
                                        BasketItems.itemList[productIndex]
                                            ["quantity"] += 1;
                                      }
                                    },
                                    color: Color(0xffFFA451),
                                    width: 200,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
