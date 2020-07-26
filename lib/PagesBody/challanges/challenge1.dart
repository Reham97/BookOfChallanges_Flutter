import 'package:flutter/material.dart';

class Challenge1 extends StatefulWidget {
  static const String route = '/Challenge1';

  @override
  _Challenge1State createState() => _Challenge1State();
}

class _Challenge1State extends State<Challenge1> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(186, 121, 103, 1.0),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(63, 68, 65, 1.0),
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
              SizedBox(
                child: Container(
                    decoration: ShapeDecoration(
                      color: Color.fromRGBO(255, 222, 207, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Why do we tell actors to “break a leg” ?",
                          style: TextStyle(
                            color: Color.fromRGBO(94, 111, 100, 1.0),
                            fontSize: 30,
                          ),
                        ))),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = true;
                    });
                  },
                  tooltip: 'Show me the answer',
                  iconSize: 200,
                  icon:
                      Image.asset('assets/images/gummy-work-from-home-1.png')),
              Visibility(
                visible: _isVisible,
                child: SizedBox(
                  child: Container(
                      decoration: ShapeDecoration(
                        color: Color.fromRGBO(255, 222, 207, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Because every play has a cast",
                            style: TextStyle(
                              color: Color.fromRGBO(94, 111, 100, 1.0),
                              fontSize: 30,
                            ),
                          ))),
                ),
              )
            ]));
  }
}
