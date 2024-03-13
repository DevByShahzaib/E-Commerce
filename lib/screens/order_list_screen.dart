import 'package:e_commerce/constants/basket_items.dart';
import 'package:e_commerce/screens/home_screen.dart';
import 'package:e_commerce/screens/pay_on_delivery_screen.dart';
import 'package:e_commerce/widgets/buttons.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  bool bottonSheetHeight = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            width: double.infinity,
            height: 180,
            color: Color(0xffFFA451),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0, left: 12.0),
              child: Container(
                // color: Colors.amber,
                width: 270,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              color: Color.fromARGB(255, 61, 32, 6),
                              blurRadius: 20)
                        ],
                      ),
                    ),
                    Text(
                      'My Basket',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              color: Color.fromARGB(255, 61, 32, 6),
                              blurRadius: 20)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: ListView.builder(
                itemCount: BasketItems.itemList.length,
                itemBuilder: (context, index) {
                  return Container(
                    // color: Colors.amber,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          // color: Colors.amber,
                          child: ListTile(
                            leading: Image.asset('assets/images/' +
                                BasketItems.itemList[index]['imageUrl']),
                            title: Text(BasketItems.itemList[index]["name"]),
                            subtitle: Text(
                                '${BasketItems.itemList[index]["quantity"]} pack'),
                            trailing: Container(
                              width: 50,
                              height: 45,
                              // color: Colors.amber,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          BasketItems.itemList.remove(
                                              BasketItems.itemList[index]);
                                        });
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        size: 20,
                                      )),
                                  Text(
                                      "\$${BasketItems.itemList[index]['price']}"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        )
                      ],
                    ),
                  );
                },
              )),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Total \$${calculateTotalPrice()}',
                    style: TextStyle(fontSize: 25),
                  ),
                  MyButton(
                    text: 'Checkout',
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                // color: Colors.lightBlue,
                                height: 500,
                                child: Container(
                                  // color: Colors.brown,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.white,
                                            ),
                                            width: 45,
                                            height: 45,
                                            child: Image.asset(
                                                'assets/images/Cancel.png')),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(40),
                                                topRight: Radius.circular(40))),
                                        width: double.infinity,
                                        height: 440,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 150, right: 20),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 90,
                                                // color: Colors.amberAccent,
                                                margin: EdgeInsets.only(
                                                    bottom: 13, left: 30),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 183.0),
                                                      child: Text(
                                                        'Number we can call',
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          bottonSheetHeight =
                                                              !bottonSheetHeight;
                                                        });
                                                      },
                                                      child: MyTextField(
                                                        hintText:
                                                            '  03252674265',
                                                        customWidth: 400,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        PayOnDelivery()));
                                                      },
                                                      child: customButton(
                                                          'Pay on delivery')),
                                                  InkWell(
                                                      //secondBottomSheet
                                                      onTap: () {
                                                        showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  // color: Colors.lightBlue,
                                                                  height: 500,
                                                                  child:
                                                                      Container(
                                                                    // color: Colors.brown,
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child: Container(
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(50),
                                                                                color: Colors.white,
                                                                              ),
                                                                              width: 45,
                                                                              height: 45,
                                                                              child: Image.asset('assets/images/Cancel.png')),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              5,
                                                                        ),
                                                                        Container(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              450,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            // color: Colors.amber,
                                                                            margin:
                                                                                EdgeInsets.only(right: 0),
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Container(
                                                                                  height: 200,
                                                                                  // color: Colors.amberAccent,
                                                                                  margin: EdgeInsets.only(bottom: 13, left: 30),
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(right: 183.0),
                                                                                        child: Text(
                                                                                          'Card Holder Name',
                                                                                          style: TextStyle(fontSize: 20),
                                                                                        ),
                                                                                      ),
                                                                                      MyTextField(
                                                                                        hintText: '  Shahzaib Khan',
                                                                                        customWidth: 350,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(right: 230.0),
                                                                                        child: Text(
                                                                                          'Card Number',
                                                                                          style: TextStyle(fontSize: 20),
                                                                                        ),
                                                                                      ),
                                                                                      MyTextField(
                                                                                        hintText: '  03252674265',
                                                                                        customWidth: 350,
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                  children: [
                                                                                    Container(
                                                                                      child: Column(
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsets.only(right: 65, bottom: 10),
                                                                                            child: Text(
                                                                                              'Date',
                                                                                              style: TextStyle(fontSize: 20),
                                                                                            ),
                                                                                          ),
                                                                                          MyTextField(
                                                                                            hintText: '  10/30',
                                                                                            customWidth: 110,
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      child: Column(
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsets.only(right: 65, bottom: 10),
                                                                                            child: Text(
                                                                                              'CCV',
                                                                                              style: TextStyle(fontSize: 20),
                                                                                            ),
                                                                                          ),
                                                                                          MyTextField(
                                                                                            hintText: '  123',
                                                                                            customWidth: 110,
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                                Container(
                                                                                  margin: EdgeInsets.only(top: 24),
                                                                                  width: double.infinity,
                                                                                  height: 118,
                                                                                  decoration: BoxDecoration(color: Color(0xffFFA451), borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                                                                                    child: InkWell(
                                                                                      onTap: () {
                                                                                        Navigator.push(
                                                                                            context,
                                                                                            MaterialPageRoute(
                                                                                                builder: (context) => HomeScreen(
                                                                                                      name: UserName.userName,
                                                                                                    )));
                                                                                      },
                                                                                      child: Container(
                                                                                        alignment: Alignment.center,
                                                                                        width: 60,
                                                                                        height: 30,
                                                                                        decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 255, 136, 81), width: 2.0), color: Colors.white, borderRadius: BorderRadius.circular(30)),
                                                                                        child: Text(
                                                                                          'Complete Order',
                                                                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xffFFA451)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                      },
                                                      child: customButton(
                                                          'Pay on card')),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    color: Color(0xffFFA451),
                    width: 200,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  calculateTotalPrice() {
    num totalPrice = 0;
    for (var product in BasketItems.itemList) {
      totalPrice += num.parse(product["price"]) * product["quantity"];
    }
    return totalPrice;
  }
}

Widget customButton(String text) {
  return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(10)),
      width: 140,
      height: 55);
}
