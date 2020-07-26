import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Challenge23 extends StatelessWidget {
  static const String route = '/Challenge23';

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
  var data = new List.generate(11, (_) => new List(11));
  var printedData = new List.generate(11, (_) => new List(11));
  Random _random = new Random();
  var message = "";

  String dropdownValueX = "1";
  String dropdownValueY = "1";

  int treasureX = 1;
  int treasureY = 1;

  bool isVisible = false;
  String info = "";
  double arrayFont =0;

  @override
  void initState() {
    setState(() {
      treasureX = 1 + _random.nextInt(10 - 1);
      treasureY = 1 + _random.nextInt(10 - 1);
    });
    print(treasureX.toString() + "  " + treasureY.toString());
    var list = new List.generate(11, (_) => new List(11));
    var tempList = new List.generate(11, (_) => new List(11));
    for (int i = 0; i <= 10; i++) {
      if (i != 10) {
        list[i][0] = "0" + i.toString();
        list[0][i] = "0" + i.toString();

        tempList[i][0] = "0" + i.toString();
        tempList[0][i] = "0" + i.toString();
      } else {
        list[i][0] = i.toString();
        list[0][i] = i.toString();

        tempList[i][0] = i.toString();
        tempList[0][i] = i.toString();
      }
    }
    for (int i = 1; i <= 10; i++) {
      for (int j = 1; j <= 10; j++) {
        if (treasureX == i && treasureY == j) {
          list[i][j] = "01";
        } else {
          list[i][j] = "00";
        }
        tempList[i][j] = "??";
      }
    }
    for (int i = 0; i <= 10; i++) {
      for (int j = 0; j <= 10; j++) {
        setState(() {
          message = message + "   " + tempList[i][j];
        });
      }
      setState(() {
        message = message + "\n";
      });
    }
    setState(() {
      data = list;
      printedData = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (MediaQuery.of(context).size.width < 500) {
      setState(() {
        arrayFont=8;

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
                  width: 500,
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
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "X",
                style: TextStyle(
                    color: Colors.black, fontSize: 30, fontFamily: "Pacifico"),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                "Y",
                style: TextStyle(
                    color: Colors.black, fontSize: 30, fontFamily: "Pacifico"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                value: dropdownValueX,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue, fontSize: 20),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValueX = newValue;
                  });
                },
                items: <String>[
                  '1',
                  '2',
                  '3',
                  '4',
                  '5',
                  '6',
                  '7',
                  '8',
                  '9',
                  '10'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                width: 30,
              ),
              DropdownButton<String>(
                value: dropdownValueY,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue, fontSize: 20),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValueY = newValue;
                  });
                },
                items: <String>[
                  '1',
                  '2',
                  '3',
                  '4',
                  '5',
                  '6',
                  '7',
                  '8',
                  '9',
                  '10'
                ].map<DropdownMenuItem<String>>((String value) {
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
                onPressed: () => {
                  setState(() {
                    message = "";
                  }),
                  printedData[int.parse(dropdownValueX)]
                          [int.parse(dropdownValueY)] =
                      data[int.parse(dropdownValueX)]
                          [int.parse(dropdownValueY)],
                  setState(() {
                    printedData = printedData;
                  }),
                  for (int i = 0; i <= 10; i++)
                    {
                      for (int j = 0; j <= 10; j++)
                        {
                          setState(() {
                            message = message + "   " + printedData[i][j];
                          })
                        },
                      setState(() {
                        message = message + "\n";
                      })
                    },
                  if (int.parse(dropdownValueX) == treasureX  &&
                      (int.parse(dropdownValueY) == treasureY))
                    {
                      setState(() {
                        isVisible = true;
                        info = "Win";
                      })
                    }
                  else if ((int.parse(dropdownValueX) - treasureX).abs() <= 3 &&
                      (int.parse(dropdownValueY) - treasureY).abs() <= 3)
                    {
                      setState(() {
                        isVisible = true;
                        info = "Warm";
                      })
                    }

                  else
                    {
                      setState(() {
                        isVisible = true;
                        info = "Cold";
                      })
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
