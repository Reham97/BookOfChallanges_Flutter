import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Challenge22 extends StatelessWidget {
  static const String route = '/Challenge22';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8edeb),
      appBar: AppBar(
        backgroundColor: Color(0xff0f4c5c),
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
  var data = new List.generate(10, (_) => new List(10));
  Random _random = new Random();
  var message = "";
  double arrayFont =0;

  @override
  void initState() {
    var list = new List.generate(10, (_) => new List(10));
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        list[i][j] = 1 + _random.nextInt(16 - 1);
        if (list[i][j] < 10) {
          setState(() {
            message = message + "   0" + list[i][j].toString();
          });
        } else {
          setState(() {
            message = message + "   " + list[i][j].toString();
          });
        }
      }
      setState(() {
        message = message + "\n";
      });
    }
    setState(() {
      data = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 500) {
      setState(() {
        arrayFont=11;

      });
    } else {
      setState(() {
        arrayFont=20;

      });
    }
    return ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          Container(
              child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 450,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xff2f3e46), width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(
                            20.0) //                 <--- border radius here
                        ),
                  ),
                  child: Center(
                    child: Text(message,
                        style: TextStyle(fontSize: arrayFont, color: Colors.black)),
                  ),
                ),
              ],
            ),
          ))
        ]);
  }
}
