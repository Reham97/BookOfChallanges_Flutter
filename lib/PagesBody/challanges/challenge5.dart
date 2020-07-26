import 'dart:async';
import 'package:flutter/material.dart';

class Challenge5 extends StatelessWidget {
  static const String route = '/Challenge5';

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
        body: MyHomePage(),
      ),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int days = 0;
  bool isVisible = false;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1920, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        isVisible = true;
        days = ((((picked.toLocal().year - DateTime.now().toLocal().year).abs())*12)*30) +
        (((picked.toLocal().month - DateTime.now().toLocal().month).abs())*30) +
            (picked.toLocal().day - DateTime.now().toLocal().day).abs();
      });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Visibility(
                    visible: isVisible,
                    child: Text("you have leaved for " + "${days} days")),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select date'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Image.asset('assets/images/timer.png'),
              ],
            ),
          )
        ]);
  }
}
