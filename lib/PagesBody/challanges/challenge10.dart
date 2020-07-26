import 'dart:math';
import 'package:flutter/material.dart';

class Challenge10 extends StatefulWidget {
  static const String route = '/Challenge10';

  @override
  _Challenge10State createState() => _Challenge10State();
}

class _Challenge10State extends State<Challenge10> {
  bool _isVisibleResult = false;
  bool _isVisibleButton = true;
  int _computerWin = -1;
  String _userChoose = "";
  String _computerChoose = "";
  String _PrintedState = "";

  // 0 rock,  1 paper, 2 scissor
  void randomGame(int user) {
    Random random = new Random();
    int computerCh = random.nextInt(3);
    print(computerCh.toString());

    if (user == 0) {
      if (computerCh == 1) {
        setState(() {
          _computerWin = 1;
          _userChoose = "Rock";
          _computerChoose = "Paper";
        });
      } else if (computerCh == 2) {
        setState(() {
          _computerWin = 0;
          _userChoose = "Rock";
          _computerChoose = "Scissor";
        });
      } else {
        _computerWin = 2;
        _userChoose = "Rock";
        _computerChoose = "Rock";
      }
    }
    else if (user == 1) {
      if (computerCh == 0) {
        setState(() {
          _computerWin = 0;
          _userChoose = "Paper";
          _computerChoose = "Rock";
        });
      }
      else if (computerCh == 2) {
        setState(() {
          _computerWin = 1;
          _userChoose = "Paper";
          _computerChoose = "Scissor";
        });
      } else {
        _computerWin = 2;
        _userChoose = "Paper";
        _computerChoose = "Paper";
      }
    }
    else if (user == 2) {
      if (computerCh == 0) {
        setState(() {
          _computerWin = 1;
          _userChoose = "Scissor";
          _computerChoose = "Rock";
        });
      } else if (computerCh == 1) {
        setState(() {
          _computerWin = 0;
          _userChoose = "Scissor";
          _computerChoose = "Paper";
        });
      } else {
        _computerWin = 2;
        _userChoose = "Scissor";
        _computerChoose = "Scissor";
      }
    }

    if (_computerWin == 1) {
      setState(() {
        _PrintedState = "Computer Win !!! \nYou : " +
            _userChoose +
            " \nComputer: " +
            _computerChoose;
      });
    } else if (_computerWin == 0) {
      setState(() {
        _PrintedState = "You Win !!! \nYou : " +
            _userChoose +
            " \nComputer: " +
            _computerChoose;
      });
    } else {
      setState(() {
        _PrintedState = "No Winner !!! \nYou : " +
            _userChoose +
            " \nComputer: " +
            _computerChoose;
      });
    }
    setState(() {
      _isVisibleButton = false;
      _isVisibleResult = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff354f52),
        appBar: AppBar(
          backgroundColor: Color(0xffcbdfbd),
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
              Visibility(
                visible: _isVisibleButton,
                child: IconButton(
                    onPressed: () async {
                      await randomGame(0);
                    },
                    iconSize: 100,
                    icon: Image.asset(
                      'assets/images/rsz_3game10.png',
                    )),
              ),
              SizedBox(height: 30),
              Visibility(
                visible: _isVisibleButton,
                child: IconButton(
                    onPressed: () {
                      randomGame(1);
                    },
                    iconSize: 100,
                    icon: Image.asset(
                      'assets/images/rsz_4game10.png',
                    )),
              ),
              SizedBox(height: 30),
              Visibility(
                visible: _isVisibleButton,
                child: IconButton(
                    onPressed: () {
                      randomGame(2);
                    },
                    iconSize: 100,
                    icon: Image.asset(
                      'assets/images/rsz_5game10.png',
                    )),
              ),
              Visibility(
                visible: _isVisibleResult,
                child: SizedBox(
                  child: Container(
                      decoration: ShapeDecoration(
                        color: Color(0xff5e3023),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            _PrintedState,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ))),
                ),
              )
            ]));
  }
}
