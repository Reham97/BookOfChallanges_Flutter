import 'dart:math';
import 'package:flutter/material.dart';

class Challenge25 extends StatelessWidget {
  static const String route = '/Challenge25';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
    body: MyHomePage(),
    )));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var randomSuits = 0;
  var randomFaces = 0;
  //               0        1          2          3
  var suits = ["Spades", "Hearts", "Diamonds", "Clubs"];
  var faces = ["1", "2", "3", "4", "5", "6", "7", "8", "9","10", "J", "Q", "K"];

  var printed = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,

    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,

    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,

    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,

  ];

  bool isVisible = false;
  Random random = new Random();
  int counter = 0;

  getData() {
    randomSuits = random.nextInt(4);
    randomFaces = random.nextInt(13);
    while (printed[randomSuits + (randomFaces * 4)] == 1) {
      randomSuits = random.nextInt(4);
      randomFaces = random.nextInt(13);
    }
    setState(() {
      randomSuits = randomSuits;
      randomFaces = randomFaces;
      printed[randomSuits + (randomFaces * 4)] = 1;
      isVisible = true;
    });
    print(printed);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/cards.png"),
                      fit: BoxFit.cover)),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Color(0xffF7F7F7),
                      onPressed: () {
                        print(counter);
                        if (counter < 52) {
                          setState(() {
                            counter = counter + 1;
                          });
                          getData();
                        } else {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("Done"),
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        'Generate 52 Unique',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Visibility(
                      visible: isVisible,
                      child: Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 5),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  20.0) //                 <--- border radius here
                              ),
                        ),
                        child: Center(
                          child: Text(
                              faces[randomFaces] + "\n" + suits[randomSuits],
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ]);
  }
}
