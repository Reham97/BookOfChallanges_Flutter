import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Challenge3 extends StatefulWidget {
  static const String route = '/Challenge3';

  @override
  _Challenge3State createState() => _Challenge3State();
}

class _Challenge3State extends State<Challenge3> {
  final heightController = TextEditingController();
  final widthController = TextEditingController();
  @override
  void dispose() {
    heightController.dispose();
    widthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEED1D1),
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
                  icon:
                      Image.asset('assets/images/box.png')),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                    decoration: new InputDecoration(labelText: "The Height"),
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                    decoration: new InputDecoration(labelText: "The Width"),
                    controller: widthController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ]),
              ),
              FlatButton(
                onPressed: () {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      var area ;
                      try {
                        area = "Area = "+(int.parse(heightController.text) * int.parse(widthController.text)).toString() ;
                      } on Exception catch (_) {
                        area = "Please, Enter value for width and height" ;
                      }
                      return AlertDialog(
                        content:
                            Text(area ),
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
                color: Color(0xff2196F3),
              ),

            ]));
  }
}
