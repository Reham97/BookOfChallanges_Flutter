import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Challenge20 extends StatefulWidget {
  static const String route = '/Challenge20';

  @override
  _Challenge20State createState() => _Challenge20State();
}

class _Challenge20State extends State<Challenge20> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
  int fibonacci(int n) => n==0 ? 0 :n <= 2 ? 1 : fibonacci(n - 2) + fibonacci (n - 1);

  String getFibonacci(int n) {
    if (n >= 0) {
      String output = "";
      for (int i = 0; i <= n; ++i) {
//        output += fibonacci(i).toString() + ", ";
      if(n==i)
        {
          output = fibonacci(i).toString() ;
        }
      }
      return output;
    } else {
      return "Number Should Be Bigger Than Or Equal 0";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        appBar: AppBar(
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
                        labelText: 'Enter Number To Get the Fibonacci'),
                    controller: myController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                    ]),
              ),
              FloatingActionButton(
                onPressed: () {
                  String mess = "";
                  mess = "Fibonacci is : \n" +
                      getFibonacci(int.parse(myController.text));

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
            ]));
  }
}
