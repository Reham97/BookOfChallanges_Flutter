import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Challenge4 extends StatefulWidget {
  static const String route = '/Challenge4';

  @override
  _Challenge4State createState() => _Challenge4State();
}

class _Challenge4State extends State<Challenge4> {
  final timeController = TextEditingController();
  final speedController = TextEditingController();
  @override
  void dispose() {
    timeController.dispose();
    speedController.dispose();
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
                          icon: Image.asset('assets/images/car.png')),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                            decoration:
                                new InputDecoration(labelText: "Time (H)"),
                            controller: timeController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                            decoration:
                                new InputDecoration(labelText: "Speed (Km/H)"),
                            controller: speedController,
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
                              var area;
                              try {
                                area = "Distance = " +
                                    (int.parse(speedController.text) *
                                            int.parse(timeController.text))
                                        .toString()+'Km';
                              } on Exception catch (_) {
                                area = "Please, Enter value for speed and time";
                              }
                              return AlertDialog(
                                content: Text(area),
                              );
                            },
                          );
                        },
                        child: Text(
                          "Calculate",
                          style: TextStyle(
//                      color: Colors.white,
                              fontSize: 30,
                              fontFamily: "Pacifico"),
                        ),
                        color: Color(0xff9D91C3),
                      ),
                    ]))));
  }
}
