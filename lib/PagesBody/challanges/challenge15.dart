import 'package:flutter/material.dart';

class Challenge15 extends StatefulWidget {
  static const String route = '/Challenge15';

  @override
  _Challenge15State createState() => _Challenge15State();
}

class _Challenge15State extends State<Challenge15> {
  final myController = TextEditingController();
  String wordsNumber = "";
  int aLetter = "a".codeUnitAt(0);
  int zLetter = "z".codeUnitAt(0);

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
                  decoration: InputDecoration(labelText: 'Enter Sentence '),
                  controller: myController,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  var words = myController.text.split(' ');
                  var counter = 0;
                  var statement = "";

                  for (int i = 0; i < words.length; i++) {
                    try {
                      if (words[i].length > 1) {
                        counter++;
                        statement = words[i] + " "+ statement;
                      }
                      else {
                        if (words[i].toLowerCase().codeUnitAt(0) >= aLetter &&
                            words[i].toLowerCase().codeUnitAt(0) <= zLetter) {
                          counter++;
                          statement = words[i] + " "+ statement;
                        }
                      }
                    }
                     catch(e) {

                    }
                  }
                  setState(() {
                    wordsNumber = counter.toString() +"!!!\n" +statement;
                  });
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Number of Words = " +
                            wordsNumber ),
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
