import 'dart:async';
import 'package:flutter/material.dart';

class Challenge8 extends StatelessWidget {
  static const String route = '/Challenge8';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff457b9d),
      appBar: AppBar(
        backgroundColor: Color(0xff1d3557),
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
  String ability = "";
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
        ability = (picked.toLocal().year - DateTime.now().toLocal().year)
                        .abs() >= 18 ? "Yes, You Can Vote" : "Sorry, You can't Vote This year";
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
                Image.asset(
                  'assets/images/vote.png',
                  height: 250,
                ),

                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: Color(0xffF7F7F7),
                  onPressed: () => _selectDate(context),
                  child: Text(
                    'Enter Your Birthdate',
                    style: TextStyle(fontFamily: "Pacifico"),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                Visibility(
                    visible: isVisible,
                    child: Text(ability,
                        style: TextStyle(fontSize: 20,color: Colors.white)),)
              ],
            ),
          )
        ]);
  }
}
