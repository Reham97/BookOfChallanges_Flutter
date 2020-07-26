import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';  // Import stop_watch_timer

class Challenge6 extends StatefulWidget {
  static const String route = '/Challenge6';

  @override
  _Challenge6State createState() => _Challenge6State();
}

class _Challenge6State extends State<Challenge6> {
  // 0-start 1-end 3-again
  int _count = 0;
  bool _isVisible = false;
  int _value = 0;
  String _text = "Start ?";
  StopWatchTimer _stopWatchTimer = StopWatchTimer(); // Create instance.

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();  // Need to call dispose function.
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff264653),
        appBar: AppBar(
          backgroundColor: Color(0xffe07a5f),
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
                      color: Color(0xfff2cc8f),
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
                          "Guessing when 10 seconds have elapsed",
                          style: TextStyle(
                            color: Color(0xff264653),
                            fontSize: 30,
                          ),
                        )))),
              ),
              Image.asset(
                'assets/images/rush-20.png',
                width: 500,
                height: 300,
              ),
              IconButton(
                  hoverColor: Colors.black,
                  onPressed: () {
                    if (_count == 0) {
                      setState(() {
                        _text = "End ?";
                        _count = 1;
                        _isVisible =false;
                      });
                      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                    } else if (_count == 1) {
                      setState(() {
                        _text = "Again ?";
                        _count = 2;
                        _isVisible =true;
                      });
                      _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                      _stopWatchTimer.secondTime.listen((value) => setState((){
                        _value=value;
                      }));
                    } else {
                      setState(() {
                        _text = "Start ?";
                        _count = 0;
                        _isVisible =false;
                      });
                      _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                    }
                  },
                  iconSize: 50,
                  icon: Text(_text,
                      style: TextStyle(
                        color: Color(0xfff4f1de),
                        fontSize: 20,
                      ))),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _isVisible,
                child: SizedBox(
                  child: Container(
                      decoration: ShapeDecoration(
                        color: Color(0xfff2cc8f),
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
                                _value.toString(),
                            style: TextStyle(
                              color: Color(0xff264653),
                              fontSize: 30,
                            ),
                          )))),
                ),
              ),
            ]));
  }
}
