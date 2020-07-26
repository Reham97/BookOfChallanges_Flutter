import 'dart:math';
import 'package:flutter/material.dart';

class Challenge14 extends StatelessWidget {
  static const String route = '/Challenge14';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcad2c5),
      appBar: AppBar(
        backgroundColor: Color(0xff52796f),
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
  int index = 1;
  int counter = 0;
  String _num = "";
  String message = "";
  Random random = new Random();
  List<int> list;

  bool isContains(List<int> myList, int len, int num) {
    bool flag = false;
    for (int i = 0; i < len; i++) {
      if (myList[i] == num) {
        flag = true;
      }
    }
    return flag;
  }

  @override
  void initState() {
    List<int> tempList = new List<int>(11);

    int len = 1;
    int num = 1 + random.nextInt(13 - 1);
    tempList[0] = num;

    for (int i = 1; i < 11; i++) {
      num = 1 + random.nextInt(13 - 1);
      while (isContains(tempList, len, num) == true) {
        num = 1 + random.nextInt(13 - 1);
      }
      tempList[i] = num;
      len++;
    }
    print(tempList);

    setState(() {
      list = tempList;
      _num = list[0].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, padding: EdgeInsets.all(15.0), children: <
        Widget>[
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
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Column contents vertically,
                  children: <Widget>[
                    RaisedButton(
                      color: Color(0xffF7F7F7),
                      onPressed: () => {
                        if (index < 11)
                          {
                            if (list[index] > list[index - 1])
                              {
                                setState(() {
                                  counter = counter + 1;
                                  _num = list[index].toString();
                                  index = index + 1;
                                  message =
                                      "Well Done " + counter.toString() + "/10";
                                })
                              }
                            else
                              {
                                setState(() {
                                  counter = counter + 1;
                                  _num = list[index].toString();
                                  index = 12;
                                  message = "Lose " + counter.toString() + "/10";
                                })
                              }
                          }
                      },
                      child: Text(
                        'Height',
                        style: TextStyle(fontFamily: "Pacifico"),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    RaisedButton(
                      color: Color(0xffF7F7F7),
                      onPressed: () => {
                        if (index < 11)
                          {
                            if (list[index] < list[index - 1])
                              {
                                setState(() {
                                  counter = counter + 1;
                                  _num = list[index].toString();
                                  index = index + 1;
                                  message =
                                      "Well Done " + counter.toString() + "/10";
                                })
                              }
                            else
                              {
                                setState(() {
                                  counter = counter + 1;
                                  _num = list[index].toString();
                                  index = 12;
                                  message = "Lose " + counter.toString() + "/10";
                                })
                              }
                          }
                      },
                      child: Text(
                        'Low',
                        style: TextStyle(fontFamily: "Pacifico"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xff2f3e46), width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(
                            20.0) //                 <--- border radius here
                        ),
                  ),
                  child: Center(
                    child: Text(_num,
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 180,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xff2f3e46), width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(
                            20.0) //                 <--- border radius here
                        ),
                  ),
                  child: Center(
                    child: Text(message,
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                ),
              ],
            ),
          ))
    ]);
  }
}
