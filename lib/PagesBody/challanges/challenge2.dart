import 'package:flutter/material.dart';

class Challenge2 extends StatefulWidget {
  static const String route = '/Challenge2';

  @override
  _Challenge2State createState() => _Challenge2State();
}

class _Challenge2State extends State<Challenge2> {
  final myController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                      Image.asset('assets/images/gummy-work-from-home-1.png')),
               Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'What is your name'),
                  controller: myController,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Hello, "+myController.text+"!"),
                      );
                    },
                  );
                },
                tooltip: 'Show me the value!',
                child: Icon(Icons.text_fields),
              ),
            ]));
  }
}
