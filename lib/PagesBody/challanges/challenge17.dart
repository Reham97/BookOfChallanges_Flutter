import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Challenge17 extends StatefulWidget {
  static const String route = '/Challenge17';

  @override
  _Challenge17State createState() => _Challenge17State();
}

class _Challenge17State extends State<Challenge17> {
  final model1 = TextEditingController();
  final model2 = TextEditingController();

  @override
  void dispose() {
    model1.dispose();
    model2.dispose();
    super.dispose();
  }

  String convertGrade(int grade) {
    if (grade >= 80) {
      return ("A");
    } else if (grade >= 70 && grade < 80) {
      return ("B");
    } else if (grade >= 60 && grade < 70) {
      return ("C");
    } else if (grade >= 50 && grade < 60) {
      return ("D");
    } else {
      return ("F");
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                      icon: Image.asset('assets/images/grade.png')),
                  Text(
                    "Module 1",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Pacifico"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: new InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                          ),
                        ),
                        controller: model1,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ]),
                  ),
                  Text(
                    "Module 2",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Pacifico"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: new InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                          ),
                        ),
                        controller: model2,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ]),
                  ),
                  FlatButton(
                    onPressed: () {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          var result;
                          try {
                            result = "Module 1: " +
                                convertGrade(int.parse(model1.text)) +
                                "\nModule2: " +
                                convertGrade(int.parse(model2.text))+"\nAS Level: "
                                +convertGrade(((int.parse(model1.text)+int.parse(model2.text))/2).round());
                          } on Exception catch (_) {
                            result =
                                "Please, Enter value for Model1 and Model2";
                          }
                          return AlertDialog(
                            content: Text(result),
                          );
                        },
                      );
                    },
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                      color: Colors.white,
                          fontSize: 30,
                          fontFamily: "Pacifico"),
                    ),
                    color: Colors.black,
                  ),
                ]));
  }
}
