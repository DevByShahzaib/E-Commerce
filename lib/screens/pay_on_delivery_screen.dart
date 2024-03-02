import 'package:e_commerce/screens/home_screen.dart';
import 'package:e_commerce/screens/order_list_screen.dart';
import 'package:flutter/material.dart';

class PayOnDelivery extends StatelessWidget {
  const PayOnDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 400,
            height: 230,
            alignment: Alignment.center,
            // color: Colors.amber,
            child: Image.asset('assets/images/congrats.png'),
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: customButton('Continue Shopping'))
        ],
      ),
    );
  }
}
