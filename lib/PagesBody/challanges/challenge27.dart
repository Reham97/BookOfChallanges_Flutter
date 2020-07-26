import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Challenge27 extends StatelessWidget {
  static const String route = '/Challenge27';

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
  var data;
  var getData;
  Random _random = new Random();
  var message ;
  String dropdownValueD1 = "a";

  bool isVisible = false;
  String info = "";

  int temp1 = 0;
  int temp2 = 0;

  int checkEx=0;

  @override
  void initState() {
    var word = ["h", "e", "l", "l", "o"];
    var printedWord = ["??", "??", "??", "??", "??"];
    var getWord = [false, false, false, false, false];
    setState(() {
      data = word;
      getData = getWord;
      message=printedWord;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Text(message.toString(),
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                ),
              ],
            ),
          )),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(
              "Select",
              style: TextStyle(
                  color: Colors.black, fontSize: 30, fontFamily: "Pacifico"),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 60.0,
              ),
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
                items: <String>[
                  'a',
                  'b',
                  'c',
                  'd',
                  'e',
                  'f',
                  'g',
                  'h',
                  'i',
                  'j',
                  'k',
                  'l',
                  'm',
                  'n',
                  'o',
                  'p',
                  'q',
                  'r',
                  's',
                  't',
                  'u',
                  'v',
                  'w',
                  'x',
                  'y',
                  'z',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                width: 65,
              ),
            ],
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
                  if (temp2 < 5) {
                    setState(() {
                      temp2 = temp2 + 1;
                    });

                    if (dropdownValueD1 == data[0] && getData[0] == false) {
                      message[0]=data[0];
                      setState(() {
                        getData[0] = true;
                        temp1 = temp1 + 1;
                        checkEx=1;
                        message=message;

                      });
                    }
                    if (dropdownValueD1 == data[1] && getData[1] == false) {
                      message[1]=data[1];

                      setState(() {
                        getData[1] = true;
                        temp1 = temp1 + 1;
                        checkEx=1;
                        message=message;

                      });
                    }
                    if (dropdownValueD1 == data[2] && getData[2] == false) {

                      message[2]=data[2];
                      setState(() {
                        getData[2] = true;
                        temp1 = temp1 + 1;
                        checkEx=1;
                        message=message;


                      });
                    }
                    if (dropdownValueD1 == data[3] && getData[3] == false) {

                      message[3]=data[3];
                      setState(() {
                        getData[3] = true;
                        temp1 = temp1 + 1;
                        checkEx=1;
                        message=message;

                      });
                    }
                    if (dropdownValueD1 == data[4] && getData[4] == false) {

                      message[4]=data[4];
                      setState(() {
                        getData[4] = true;
                        temp1 = temp1 + 1;
                        checkEx=1;
                        message=message;

                      });
                    }
                    if(checkEx==1)
                      {
                        if(temp2!=0)
                          {
                            setState(() {
                              checkEx=0;
                              temp2=temp2-1;
                            });
                          }
                        else
                          {
                            setState(() {
                              checkEx=0;
                            });
                          }

                      }

                    setState(() {
                      isVisible = true;
                      info = "Correct: " +
                          temp1.toString() +
                          " counter" +
                          temp2.toString();
                    });
                  } else if (temp2 == 5) {
                    int allFind = 0;
                    for(int i=0;i<5;i++)
                      {
                        if(message[i]!="??")
                          {
                            allFind++;
                          }

                      }
                    if(allFind==5)
                      {
                        setState(() {
                          temp2 = temp2 + 1;
                          message = message.toString() ;
                          info = "You Win";
                        });
                      }
                    else
                      {
                        setState(() {
                          temp2 = temp2 + 1;
                          message = message.toString() ;
                          info = info+"\nYou Lose";
                        });
                      }

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
