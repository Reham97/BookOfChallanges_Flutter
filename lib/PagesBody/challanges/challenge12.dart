import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Challenge12 extends StatefulWidget {
  static const String route = '/Challenge12';

  @override
  _Challenge12State createState() => _Challenge12State();
}

class _Challenge12State extends State<Challenge12> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  int factorial(int n) => n == 0 ? 1 : n * factorial(n - 1);

  bool isPrime(int n) {
    int i = 2;
    bool flag = false;
    while (i <= n / 2) {
      if (n % i == 0) {
        flag = true;
        break;
      }
      ++i;
    }
    if (!flag)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
      data: ThemeData(
      brightness: Brightness.dark,
    ),
    child: Scaffold(
//        backgroundColor: Color(0xffEED1D1),
    appBar: AppBar(
//          backgroundColor: Color.fromRGBO(63, 68, 65, 1.0),
    title: Image.asset(
    'assets/images/sign-up-8.png',
    width: 400,
    height: 50,
    ),
    centerTitle: true,
    elevation: 0,
    ),
    body: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              IconButton(
                  iconSize: 200, icon: Image.asset('assets/images/math.png')),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Enter Number To Get the Factors'),
                    controller: myController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                    ]),
              ),
              FloatingActionButton(
                onPressed: () {
                  String mess = "";
                  mess = "Factorial is : " +
                      factorial(int.parse(myController.text)).toString();
                  isPrime(int.parse(myController.text)) == true
                      ? mess = mess + " Is Prime"
                      : mess = mess + " Not Prime";

//                  print(isPrime(int.parse(myController.text)));

                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(mess),
                      );
                    },
                  );
                },
                tooltip: 'Show me the value!',
                child: Text(
                  "GO",
                  style: TextStyle(
//                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Pacifico"),
                ),
              ),
            ]))));
  }
}
