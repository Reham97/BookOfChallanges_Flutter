import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Challenge7 extends StatefulWidget {
  static const String route = '/Challenge7';

  @override
  _Challenge7State createState() => _Challenge7State();
}

class _Challenge7State extends State<Challenge7> {
  final letterController = TextEditingController();
  String listValue = "Your List\n";
  int alphabet = "a".codeUnitAt(0);
  bool done = false;
  bool write = true;
  @override
  void dispose() {
    letterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        backgroundColor: Color(0xffEED1D1),
        appBar: AppBar(
          backgroundColor: Color(0xffE75284),
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
              Image.asset(
                'assets/images/alpha.png',
                width: 500,
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                    decoration: new InputDecoration(labelText: "Enter Letter"),
                    controller: letterController,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(1),
                    ]),
              ),
              FlatButton(
                onPressed: () {
                  if (letterController.text.toLowerCase() ==
                          String.fromCharCode(alphabet) &&
                      done == false &&
                      write == true) {
                    setState(() {
                      listValue =
                          listValue + " " + new String.fromCharCode(alphabet);
                      alphabet = alphabet + 1;
                    });

                    if (letterController.text.toLowerCase() == 'z' &&
                        write == true) {
                      setState(() {
                        listValue = listValue + " Well Done!!! ";
                        done = true;
                        write = false;
                      });
                    }
                  } else if (letterController.text.toLowerCase() !=
                          String.fromCharCode(alphabet) &&
                      done == false &&
                      write == true) {
                    setState(() {
                      listValue = listValue + " Lose!!! ";
                      write = false;
                    });
                  }
                },
                child: Text(
                  "Done",
                  style: TextStyle(
                      color: Color(0xffF1BB45),
                      fontSize: 30,
                      fontFamily: "Pacifico"),
                ),
                color: Color(0xff539B6D),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Container(
                    decoration: ShapeDecoration(
                      color: Color(0xff264653),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Center(
                            child: Text(
                          listValue,
                          style: TextStyle(
                              color: Color(0xfff1faee),
                              fontSize: 30,
                              fontFamily: "Pacifico"),
                        )))),
              ),
            ]));
  }
}
