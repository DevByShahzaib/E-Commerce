import 'package:e_commerce/screens/auth_screen.dart';
import 'package:e_commerce/widgets/buttons.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: Column(
          children: [
            Container(
              color: Color(0xffFFA451),
              width: MediaQuery.of(context).size.width * 1,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                      ),
                      Container(
                        child: Image.asset('assets/images/fruits_piece.png'),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: Image.asset(
                      'assets/images/basket.png',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 30),
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: Image.asset(
                      'assets/images/ellips.png',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.all(20),
              // color: Colors.lightBlue,
              width: 350,
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get The Freshest Fruit Salad Combo',
                    style: TextStyle(color: Color(0xff27214D), fontSize: 21),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      'We deliver the best and freshest fruit salad in town.Order for a combo today!!!',
                      style: TextStyle(
                          color: Color.fromARGB(255, 149, 147, 147),
                          fontSize: 15)),
                  SizedBox(
                    height: 75,
                  ),
                  MyButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AuthScreen()));
                    },
                    text: "Let\'s Continue",
                    color: Color(0xffFFA451),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
