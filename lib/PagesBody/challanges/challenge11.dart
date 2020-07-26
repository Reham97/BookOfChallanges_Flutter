import 'package:flutter/material.dart';

class Challenge11 extends StatefulWidget {
  static const String route = '/Challenge11';

  @override
  _Challenge11State createState() => _Challenge11State();
}

class _Challenge11State extends State<Challenge11> {
  bool _isVisible = false;
  String dropdownValue1 = "0";
  String dropdownValue2 = "0";
  String dropdownValueOp = "OR";
  String Result = "";

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
                "Input 1",
                style: TextStyle(
                  color: Color.fromRGBO(94, 111, 100, 1.0),
                  fontSize: 30,
                ),
              ),
              DropdownButton<String>(
                value: dropdownValue1,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue1 = newValue;
                  });
                },
                items: <String>['0', '1']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Input 2",
                style: TextStyle(
                  color: Color.fromRGBO(94, 111, 100, 1.0),
                  fontSize: 30,
                ),
              ),
              DropdownButton<String>(
                value: dropdownValue2,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue2 = newValue;
                  });
                },
                items: <String>['0', '1']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(
                "Operation",
                style: TextStyle(
                  color: Color.fromRGBO(94, 111, 100, 1.0),
                  fontSize: 30,
                ),
              ),
              DropdownButton<String>(
                value: dropdownValueOp,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValueOp = newValue;
                  });
                },
                items: <String>["OR", "AND", "XOR", "NAND", "NOR"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              IconButton(
                  onPressed: () {
                    var input1 = dropdownValue1 == "1"?true:false;
                    var input2 = dropdownValue1 == "1"?true:false;
                    switch (dropdownValueOp) {
//                    "OR", "AND" , "XOR" , "NAND" , "NOR"
                      case "OR":
                        setState(() {
                          Result = "Result : "+ ( input1 || input2).toString();
                          _isVisible = true;
                        });
                        break;
                      case "AND":
                        setState(() {
                          Result = "Result : "+ ( input1 && input2).toString();
                          _isVisible = true;
                        });
                        break;
                      case "XOR":
                        setState(() {
                          Result = "Result : "+ ( input1 ^ input2).toString();
                          _isVisible = true;
                        });
                        break;
                      case "NAND":
                        setState(() {
                          Result = "Result : "+ ( !(input1 && input2)).toString();
                          _isVisible = true;
                        });
                        break;
                      case "NOR":
                        setState(() {
                          Result = "Result : "+ ( !(input1 || input2)).toString();
                          _isVisible = true;
                        });
                        break;
                    }
                  },
                  tooltip: 'Show me the answer',
                  iconSize: 200,
                  icon: Image.asset(
                    'assets/images/gates.png',
                    width: 250,
                    height: 600,
                  )),
              SizedBox(
                height: 50,
              ),
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
                            Result,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          ))),
                ),
              )
            ]));
  }
}
