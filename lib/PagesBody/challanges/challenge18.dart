import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Challenge18 extends StatefulWidget {
  static const String route = '/Challenge18';

  @override
  _Challenge18State createState() => _Challenge18State();
}

class _Challenge18State extends State<Challenge18> {
  final inputValue = TextEditingController();
  var message = "";

  String drowRec(int x) {
    String rec = "";
    //i (' ')  j('*')
    for (int i = ((x - 1) / 2).round() , j = 1;
        i >= 0 && j <= x;
        i--, j = j + 2) {
      for (int temp1 = i; temp1 > 0; temp1--) {
        rec = rec + " ";
      }
      for (int temp1 = j; temp1 > 0; temp1--) {
        rec = rec + "*";
      }
      rec = rec + "\n";
    }
    print(x);
    return rec;
  }

  @override
  void dispose() {
    inputValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  iconSize: 200, icon: Image.asset('assets/images/art.png')),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                    decoration: new InputDecoration(labelText: "Enter Number"),
                    controller: inputValue,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ]),
              ),
              FlatButton(
                onPressed: () {
                  if (inputValue.text != "") {
                    if (int.parse(inputValue.text) % 2 == 0) {
                      setState(() {
                        message = "Please, Enter Odd Number";
                      });
                    } else {
                      var mess = drowRec(int.parse(inputValue.text));
                      setState(() {
                        message = mess;
                      });
                    }
                  } else {
                    setState(() {
                      message = "Please, Enter Odd Number";
                    });
                  }
                },
                child: Text(
                  "Draw",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: "Pacifico"),
                ),
                color: Color(0xff2196F3),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  child: Container(
                      decoration: ShapeDecoration(
//                      color: Color.fromRGBO(255, 222, 207, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        message,
                        style: TextStyle(
                          color: Color.fromRGBO(94, 111, 100, 1.0),
                          fontSize: 30,
                        ),
                      ))),
            ]));
  }
}
