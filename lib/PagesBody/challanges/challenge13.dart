import 'dart:math';
import 'package:flutter/material.dart';

class Challenge13 extends StatefulWidget {
  static const String route = '/Challenge13';

  @override
  _Challenge13State createState() => _Challenge13State();
}

class _Challenge13State extends State<Challenge13> {
  int _user = 0;
  int _computer = 0;
  Random _random = new Random();
  int _number;
  String dropdownValue = "1";
  bool _runGame = true;
  String message = "";

  @override
  void initState() {
    setState(() {
      _number = 20 + _random.nextInt(30 - 20);
      message = "You : " +
          _user.toString() +
          " vs Computer : " +
          _computer.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff2f3e46),
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
        body: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              SizedBox(
                child: Container(
                    decoration: ShapeDecoration(
                      color: Color(0xffcad2c5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "You Will Start .. Number is " + _number.toString(),
                          style: TextStyle(
                            color: Color(0xff2f3e46),
                            fontSize: 30,
                          ),
                        ))),
              ),
              SizedBox(
                height: 30,
              ),
              DropdownButton<String>(
                value: dropdownValue,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Color(0xffcad2c5), fontSize: 20),
                underline: Container(
                  height: 2,
                  color: Color(0xffcad2c5),
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>["1", "2", "3"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.pink),
                    ),
                  );
                }).toList(),
              ),
              IconButton(
                  onPressed: () {
                    if (_runGame == true) {
                      int c = 0;
                      if (_number - int.parse(dropdownValue) == 2) {
                        c = 1;
                      } else if (_number - int.parse(dropdownValue) == 3) {
                        c = 2;
                      } else if (_number - int.parse(dropdownValue) == 4) {
                        c = 3;
                      } else {
                        c = 1 + _random.nextInt(3 - 1);
                      }

                      if (_number - int.parse(dropdownValue) <= 0) {
                        setState(() {
                          message = "You : " +
                              dropdownValue +
                              " vs Computer : " +
                              _computer.toString() +
                              "\nSorry, You Lose!";
                          _number = _number - int.parse(dropdownValue);
                          _user = int.parse(dropdownValue);
//                            _computer = c;
                        });
                      } else if (_number - int.parse(dropdownValue) - c <= 0) {
                        setState(() {
                          message = "You : " +
                              dropdownValue +
                              " vs Computer : " +
                              c.toString() +
                              "\nYou Win!";
                          _number = _number - int.parse(dropdownValue) - c;
                          _user = int.parse(dropdownValue);
                          _computer = c;
                        });
                      } else {
                        setState(() {
                          message = "You : " +
                              dropdownValue +
                              " vs Computer : " +
                              c.toString();
                          _number = _number - int.parse(dropdownValue) - c;
                          _user = int.parse(dropdownValue);
                          _computer = c;
                        });
                      }
                    }
                  },
                  tooltip: 'Send',
                  iconSize: 100,
                  icon: Image.asset(
                    'assets/images/gummy-work-from-home-1.png',
                    width: 200,
                    height: 200,
                  )),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                child: Container(
                    decoration: ShapeDecoration(
                      color: Color(0xffcad2c5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          message,
                          style: TextStyle(
                            color: Color(0xff2f3e46),
                            fontSize: 30,
                          ),
                        ))),
              ),
            ]));
  }
}
