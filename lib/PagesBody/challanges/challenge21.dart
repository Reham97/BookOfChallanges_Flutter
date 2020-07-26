import 'package:flutter/material.dart';

class Challenge21 extends StatefulWidget {
  static const String route = '/Challenge21';

  @override
  _Challenge21State createState() => _Challenge21State();
}

class _Challenge21State extends State<Challenge21> {
  final myController = TextEditingController();
  var data = new Map();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
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
                          iconSize: 200,
                          icon: Image.asset(
                              'assets/images/gummy-work-from-home-1.png')),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Enter Names, "exit to break"'),
                          controller: myController,
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          if (myController.text != "") {
                            if (myController.text != "exit") {
                              var temp = data;
                              if (data.containsKey(myController.text)) {
                                temp[myController.text] =
                                    temp[myController.text] + 1;
                              } else {
                                temp[myController.text] = 0;
                              }
                              setState(() {
                                data = temp;
                              });
                              return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text("Added"),
                                  );
                                },
                              );
                            } else {
                              var repeated = "";
                              data.forEach((key, value) {
                                if (value != 0) {
                                  repeated = repeated +
                                      "  " +
                                      key +
                                      ":" +
                                      (value + 1).toString() +
                                      "\n";
                                }
                              });
                              return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content:
                                        Text("Repeated Names :\n" + repeated),
                                  );
                                },
                              );
                            }
                          }
                        },
                        tooltip: 'Show me the value!',
                        child: Icon(Icons.text_fields),
                      ),
                    ]))));
  }
}
