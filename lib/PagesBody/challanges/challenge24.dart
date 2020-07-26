import 'package:flutter/material.dart';
import 'package:challenges_web/src/Results.dart';

class Challenge24 extends StatelessWidget {
  static const String route = '/Challenge24';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Color,
      appBar: AppBar(
        backgroundColor: Colors.black,
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
  List<Results> listR;

  final HomeTeam = TextEditingController();
  final AwayTeam = TextEditingController();
  final SearchTeam = TextEditingController();

  String SearchR = "";

  String HomeTeamScore = "1";
  String AwayTeamScore = "1";

  bool addVisible = false;
  bool searchVisible = false;
  bool listVisible = false;

  String allData = "";

  @override
  void initState() {
    this.listR = new List<Results>();
    for (int i = 0; i < 10; i++) {
      this.listR.add(new Results(String.fromCharCode("A".codeUnitAt(0) + i), i,
          String.fromCharCode("Z".codeUnitAt(0) - i), 10 - i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, padding: EdgeInsets.all(15.0), children: <
        Widget>[
      Container(
          child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //Center Column contents vertically,
          children: <Widget>[
            RaisedButton(
              color: Color(0xffF7F7F7),
              onPressed: () {
                setState(() {
                  addVisible = true;
                  searchVisible = false;
                  listVisible = false;
                });
              },
              child: Text(
                'Add',
                style: TextStyle(fontSize: 50),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Color(0xffF7F7F7),
              onPressed: () {
                setState(() {
                  addVisible = false;
                  searchVisible = true;
                  listVisible = false;
                });
              },
              child: Text(
                'Search',
                style: TextStyle(fontSize: 50),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Color(0xffF7F7F7),
              onPressed: () {
                setState(() {
                  allData =
                      "HomeTeam / HomeTeamScore / AwayTeam / AwayTeamScore\n";
                });
                for (int i = 0; i < listR.length; i++) {
                  setState(() {
                    allData = allData +
                        listR[i].HomeTeam +
                        " / " +
                        listR[i].HomeTeamScore.toString() +
                        " / " +
                        listR[i].AwayTeam.toString() +
                        " / " +
                        listR[i].AwayTeamScore.toString() +
                        "\n";
                  });
                }
                setState(() {
                  addVisible = false;
                  searchVisible = false;
                  listVisible = true;
                });
              },
              child: Text(
                'List',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ],
        ),
      ]))),
      Visibility(
          visible: addVisible,
          child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  decoration: new InputDecoration(labelText: "HomeTeam"),
                  controller: HomeTeam,
                )),
            DropdownButton<String>(
              value: HomeTeamScore,
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.blue, fontSize: 20),
              underline: Container(
                height: 2,
                color: Colors.blue,
              ),
              onChanged: (String newValue) {
                setState(() {
                  HomeTeamScore = newValue;
                });
              },
              items: <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  decoration: new InputDecoration(labelText: "AwayTeam"),
                  controller: AwayTeam,
                )),
            DropdownButton<String>(
              value: AwayTeamScore,
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.blue, fontSize: 20),
              underline: Container(
                height: 2,
                color: Colors.blue,
              ),
              onChanged: (String newValue) {
                setState(() {
                  AwayTeamScore = newValue;
                });
              },
              items: <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              color: Colors.blue[900],
              onPressed: () {
                if (HomeTeam.text != "" && AwayTeam.text != "") {
                  listR.add(new Results(HomeTeam.text, int.parse(HomeTeamScore),
                      AwayTeam.text, int.parse(AwayTeamScore)));
                  setState(() {
                    listR = listR;
                  });

                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Done"),
                      );
                    },
                  );
                } else {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Please, Enter All Data"),
                      );
                    },
                  );
                }
              },
              child: Text(
                'Done',
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
          ]))),
      Visibility(
          visible: searchVisible,
          child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  decoration: new InputDecoration(labelText: "TeamName"),
                  controller: SearchTeam,
                )),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              color: Colors.blue[900],
              onPressed: () {
                if (SearchTeam.text != "") {
                  for(int i=0;i<listR.length;i++)
                    {
                      if(listR[i].HomeTeam == SearchTeam.text)
                        {
                          setState(() {
                            SearchR = listR[i].HomeTeam +" : "+listR[i].HomeTeamScore.toString();
                          });
                        }
                      else if(listR[i].AwayTeam == SearchTeam.text)
                      {
                        setState(() {
                          SearchR = listR[i].AwayTeam +" : "+listR[i].AwayTeamScore.toString();
                        });
                      }
                    }

                } else {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("Please, Enter KeyWord"),
                        );
                      });
                }
              },
              child: Text(
                'Search',
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        SearchR == "" ? "Waiting Your KeyWords" : SearchR,
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 30,
                        ),
                      ))),
            ),
          ]))),
      Visibility(
          visible: listVisible,
          child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            SizedBox(
              height: 30,
            ),
            SizedBox(
              child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        allData.toString(),
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 30,
                        ),
                      ))),
            ),
          ]))),
    ]);
  }
}
