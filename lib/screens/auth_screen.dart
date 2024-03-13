import 'package:e_commerce/constants/basket_items.dart';
import 'package:e_commerce/screens/home_screen.dart';
import 'package:e_commerce/widgets/buttons.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String userName = '';
  TextEditingController nameController = TextEditingController();
  nameSaver() {
    userName = nameController.text;
    UserName.userName = userName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
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
                        'assets/images/basket_2.png',
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
                      'What is your first name?',
                      style: TextStyle(color: Color(0xff27214D), fontSize: 21),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextField(controller: nameController),
                    SizedBox(
                      height: 75,
                    ),
                    MyButton(
                      onTap: () {
                        nameSaver();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                      name: userName,
                                    )));
                        nameController.clear();
                      },
                      text: "Start Ordering",
                      color: Color(0xffFFA451),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
