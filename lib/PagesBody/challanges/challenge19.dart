import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Challenge19 extends StatefulWidget {
  static const String route = '/Challenge19';

  @override
  _Challenge19State createState() => _Challenge19State();
}

class _Challenge19State extends State<Challenge19> {
  bool _isVisible = false;
  String dropdownValueOp = "Encryption";
  String Result = "";
  final getText = TextEditingController();
  final getOffset = TextEditingController();
  int aLetter = "a".codeUnitAt(0);
  int zLetter = "z".codeUnitAt(0);
  int ALetter = "A".codeUnitAt(0);
  int ZLetter = "Z".codeUnitAt(0);

  @override
  void dispose() {
    getText.dispose();
    getOffset.dispose();
    super.dispose();
  }

  String CeaserEnc(String state, int num) {
    var result = "";
    var text = state.split('');
    for (int i = 0; i < text.length; i++) {
      if (text[i].codeUnitAt(0) >= aLetter &&
          text[i].codeUnitAt(0) <= zLetter) {
        if (text[i].codeUnitAt(0) + num <= zLetter) {
          result = result + String.fromCharCode(text[i].codeUnitAt(0) + num);
        } else {
          result = result +
              String.fromCharCode("a".codeUnitAt(0) +
                  (text[i].codeUnitAt(0) + num - 1 - "z".codeUnitAt(0)));
        }
      } else if (text[i].codeUnitAt(0) >= ALetter &&
          text[i].codeUnitAt(0) <= ZLetter) {
        if (text[i].codeUnitAt(0) + num <= ZLetter) {
          result = result + String.fromCharCode(text[i].codeUnitAt(0) + num);
        } else {
          result = result +
              String.fromCharCode("A".codeUnitAt(0) +
                  (text[i].codeUnitAt(0) + num - 1 - "Z".codeUnitAt(0)));
        }
      } else {
        result = result + text[i];
      }
    }
    return result;
  }

  String CeaserDec(String text, int num) {
    var result = "";
    for (int i = 0; i < text.length; i++) {
      if (text[i].codeUnitAt(0) >= aLetter &&
          text[i].codeUnitAt(0) <= zLetter) {
        if (text[i].codeUnitAt(0) - num >= aLetter) {
          result = result + String.fromCharCode(text[i].codeUnitAt(0) - num);
        } else {
          result = result +
              String.fromCharCode("z".codeUnitAt(0) +
                  1 +
                  (text[i].codeUnitAt(0) - num - "a".codeUnitAt(0)));
        }
      } else if (text[i].codeUnitAt(0) >= ALetter &&
          text[i].codeUnitAt(0) <= ZLetter) {
        if (text[i].codeUnitAt(0) - num >= ALetter) {
          result = result + String.fromCharCode(text[i].codeUnitAt(0) - num);
        } else {
          result = result +
              String.fromCharCode("Z".codeUnitAt(0) +
                  1 +
                  (text[i].codeUnitAt(0) - num - "A".codeUnitAt(0)));
        }
      } else {
        result = result + text[i];
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(63, 68, 65, 1.0),
          title: Image.asset(
            'assets/images/sign-up-8.png',
            width: 50,
            height: 50,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              Text(
                "Enter Words :",
                style: TextStyle(
                  color: Color.fromRGBO(94, 111, 100, 1.0),
                  fontSize: 30,
                ),
              ),
              TextField(
                controller: getText,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Enter Offset :",
                style: TextStyle(
                  color: Color.fromRGBO(94, 111, 100, 1.0),
                  fontSize: 30,
                ),
              ),
              TextField(
                  controller: getOffset,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ]),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Operation",
                style: TextStyle(
                  color: Color.fromRGBO(94, 111, 100, 1.0),
                  fontSize: 20,
                ),
              ),
              DropdownButton<String>(
                value: dropdownValueOp,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValueOp = newValue;
                  });
                },
                items: <String>['Encryption', 'Decryption']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              IconButton(
                  onPressed: () {
                    if (getText.text.length != 0 ||
                        getOffset.text.length != 0) {
                      if (int.parse(getOffset.text) >= 1 &&
                          int.parse(getOffset.text) <= 25) {
                        if (dropdownValueOp == "Encryption") {
                          String enc = CeaserEnc(
                              getText.text, int.parse(getOffset.text));
                          setState(() {
                            Result = enc;
                          });
                        } else {
                          String dec = CeaserDec(
                              getText.text, int.parse(getOffset.text));
                          setState(() {
                            Result = dec;
                          });
                        }
                      } else {
                        setState(() {
                          _isVisible = true;
                          Result = "Offset Range between 1:25";
                        });
                      }

                      setState(() {
                        _isVisible = true;
                      });
                    } else {
                      setState(() {
                        _isVisible = true;
                        Result = "Set Text Input & Offset";
                      });
                    }
                  },
                  tooltip: 'Show me the answer',
                  iconSize: 200,
                  icon: Image.asset(
                    'assets/images/security.png',
                    width: 250,
                    height: 600,
                  )),
              SizedBox(
                height: 25,
              ),
              Visibility(
                visible: _isVisible,
                child: SizedBox(
                  child: Container(
                      decoration: ShapeDecoration(
                        color: Color.fromRGBO(63, 68, 65, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            Result,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                            ),
                          ))),
                ),
              )
            ]));
  }
}
