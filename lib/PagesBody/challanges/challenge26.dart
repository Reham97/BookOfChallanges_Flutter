import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Challenge26 extends StatelessWidget {
  static const String route = '/Challenge26';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeae2b7),
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
  var data = [0, 0, 0, 0];
  Random _random = new Random();
  var message = "";
  String dropdownValueD1 = "1";
  String dropdownValueD2 = "1";

  String dropdownValueD3 = "1";
  String dropdownValueD4 = "1";
  bool isVisible = false;
  String info = "";

  int temp1 = 0;
  int temp2 = 0;
  double sizeBoxSpace =0;


  @override
  void initState() {
    var myList = [
      _random.nextInt(10),
      _random.nextInt(10),
      _random.nextInt(10),
      _random.nextInt(10),
    ];
    setState(() {
      data = myList;
      message = "?? ?? ?? ??";
    });
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 500) {
      setState(() {
        sizeBoxSpace=20;

      });
    } else {
      setState(() {
        sizeBoxSpace=60;

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
                  width: 200,
                  height: 100,
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
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "D1",
                style: TextStyle(
                    color: Colors.black, fontSize: 30, fontFamily: "Pacifico"),
              ),
              SizedBox(
                width: sizeBoxSpace,
              ),
              Text(
                "D2",
                style: TextStyle(
                    color: Colors.black, fontSize: 30, fontFamily: "Pacifico"),
              ),
              SizedBox(
                width: sizeBoxSpace,
              ),
              Text(
                "D3",
                style: TextStyle(
                    color: Colors.black, fontSize: 30, fontFamily: "Pacifico"),
              ),
              SizedBox(
                width: sizeBoxSpace,
              ),
              Text(
                "D4",
                style: TextStyle(
                    color: Colors.black, fontSize: 30, fontFamily: "Pacifico"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                value: dropdownValueD1,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue, fontSize: 20),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValueD1 = newValue;
                  });
                },
                items: <String>['1', '2', '3', '4', '5', '6', '7', '8', '9']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                width: sizeBoxSpace,
              ),
              DropdownButton<String>(
                value: dropdownValueD2,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue, fontSize: 20),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValueD2 = newValue;
                  });
                },
                items: <String>['1', '2', '3', '4', '5', '6', '7', '8', '9']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                width: sizeBoxSpace,
              ),
              DropdownButton<String>(
                value: dropdownValueD3,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue, fontSize: 20),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValueD3 = newValue;
                  });
                },
                items: <String>['1', '2', '3', '4', '5', '6', '7', '8', '9']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                width: sizeBoxSpace,
              ),
              DropdownButton<String>(
                value: dropdownValueD4,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue, fontSize: 20),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValueD4 = newValue;
                  });
                },
                items: <String>['1', '2', '3', '4', '5', '6', '7', '8', '9']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Column contents vertically,
            children: <Widget>[
              RaisedButton(
                color: Color(0xffF7F7F7),
                onPressed: () {
                  print(data);
                  print(temp2);
                  if(temp2<12)
                    {
                  setState(() {
                    temp1 = 0;
                    temp2 = temp2+1;
                  });

                  if (int.parse(dropdownValueD1) == data[0]) {
                    setState(() {
                      temp1 = temp1 + 1;
                    });
                  }
                  if (int.parse(dropdownValueD2) == data[1]) {
                    setState(() {
                      temp1 = temp1 + 1;
                    });
                  }
                  if (int.parse(dropdownValueD3) == data[2]) {
                    setState(() {
                      temp1 = temp1 + 1;
                    });
                  }
                  if (int.parse(dropdownValueD4) == data[3]) {
                    setState(() {
                      temp1 = temp1 + 1;
                    });
                  }

                  setState(() {
                    isVisible = true;
                    info = "In the Right Place\nCorrect: " +
                        temp1.toString() +
                        " Wrong: " +
                        (4 - temp1).toString();
                  });}
                  else if(temp2==12)
                    {
                      setState(() {
                        temp2=temp2+1;
                        message=message+"\n"+"You Lose ";
                      });
                    }
                },
                child: Text(
                  'Send',
                  style: TextStyle(fontFamily: "Pacifico", fontSize: 40),
                ),
              ),
            ],
          ),
          Visibility(
            visible: isVisible,
            child: SizedBox(
              child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        info,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ))),
            ),
          )
        ]);
  }
}
