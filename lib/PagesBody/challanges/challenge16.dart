import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Challenge16 extends StatelessWidget {
  static const String route = '/Challenge16';

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
  int _num = 0;
  int _counter = 0;
  String _message = "";
  bool runGame = true;
  Random _random = new Random();
  final userInput = TextEditingController();

  @override
  void initState() {
    int temp = 1 + _random.nextInt(100 - 1);
    print(temp);
    setState(() {
      _num = temp;
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
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                      decoration: new InputDecoration(labelText: "Enter Value"),
                      controller: userInput,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ]),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FloatingActionButton(
                  backgroundColor: Color(0xff0f4c5c),
                  onPressed: () {
                    if (runGame == true) {
                      if (int.parse(userInput.text) == _num) {
                        setState(() {
                          _counter = _counter + 1;
                          _message = "Done after " + _counter.toString();
                          runGame = false;
                        });
                      } else if (int.parse(userInput.text) < _num) {
                        setState(() {
                          _counter = _counter + 1;
                          _message = "too low";
                        });
                      } else if (int.parse(userInput.text) > _num) {
                        setState(() {
                          _counter = _counter + 1;
                          _message = "too height";
                        });
                      }
                    }
                  },
                  child: Text("Send",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xff2f3e46), width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(
                            20.0) //                 <--- border radius here
                        ),
                  ),
                  child: Center(
                    child: Text(_message,
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                ),
              ],
            ),
          ))
        ]);
  }
}
