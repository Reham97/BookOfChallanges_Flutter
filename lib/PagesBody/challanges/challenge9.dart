import 'dart:math';
import 'package:flutter/material.dart';

class Challenge9 extends StatelessWidget {
  static const String route = '/Challenge9';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff457b9d),
      appBar: AppBar(
        backgroundColor: Color(0xff1d3557),
        title: Image.asset(
          'assets/images/sign-up-8.png',
          width: 400,
          height: 50,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var randomSuits = 0;
  var randomFaces = 0;
  var suits = ["Spades", "Hearts", "Diamonds", "Clubs"];
  var faces = ["1", "2", "3", "4", "5", "6", "7", "8", "9","10", "J", "Q", "K"];
  bool isVisible = false;
  Random random = new Random();

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
                      onPressed: () => {
                        setState(() {
                          randomSuits = random.nextInt(4);
                          randomFaces = random.nextInt(13);
                          isVisible = true;
                        })
                      },
                      child: Text(
                        'Generate',
                        style: TextStyle(fontFamily: "Pacifico"),
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
                          color:Colors.white,
                            border: Border.all(color: Colors.white,width: 5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(20.0) //                 <--- border radius here
                          ),

                        ),
                        child:Center(child:
                        Text(faces[randomFaces] +"\n"+ suits[randomSuits],
                            style:
                                TextStyle(fontSize: 20, color: Colors.red)),
                      ),
                    ),)
                  ],
                ),
              ))
        ]);
  }
}
