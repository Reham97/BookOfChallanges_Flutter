import 'package:flutter/material.dart';
import 'package:challenges_web/PagesBody/challanges/challenge1.dart';
import 'package:challenges_web/home.dart';

class HomeBody extends StatelessWidget {
  List<Widget> pageChildren(
      BuildContext context, String title, int challangeID) {
    return <Widget>[
      Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: SizedBox(
                width: 120,
                height: 90,
                child: RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  onPressed: () =>
                      {Navigator.of(context).pushNamed('/Challenge'+challangeID.toString())},
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Color.fromRGBO(20, 30, 48, 1.0),
                        fontSize: 20,
                        fontFamily: "Pacifico"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return Row(
            children: [
              Column(children: [
                ...pageChildren(context, "Challenge 1", 1),
                ...pageChildren(context, "Challenge 2", 2),
                ...pageChildren(context, "Challenge 3", 3),
                ...pageChildren(context, "Challenge 4", 4),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 5", 5),
                ...pageChildren(context, "Challenge 6", 6),
                ...pageChildren(context, "Challenge 7", 7),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 8", 8),
                ...pageChildren(context, "Challenge 9", 9),
                ...pageChildren(context, "Challenge 10", 10),
                ...pageChildren(context, "Challenge 11", 11),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 12", 12),
                ...pageChildren(context, "Challenge 13", 13),
                ...pageChildren(context, "Challenge 14", 14),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 15", 15),
                ...pageChildren(context, "Challenge 16", 16),
                ...pageChildren(context, "Challenge 17", 17),
                ...pageChildren(context, "Challenge 18", 18),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 19", 19),
                ...pageChildren(context, "Challenge 20", 20),
                ...pageChildren(context, "Challenge 21", 21),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 22", 22),
                ...pageChildren(context, "Challenge 23", 23),
                ...pageChildren(context, "Challenge 24", 24),
                ...pageChildren(context, "Challenge 25", 25),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 26", 26),
                ...pageChildren(context, "Challenge 27", 27),
              ]),
            ],
          );
        }
        else if (constraints.maxWidth <= 1200 && constraints.maxWidth > 900) {
          return Row(
            children: [
              Column(children: [
                ...pageChildren(context, "Challenge 1", 1),
                ...pageChildren(context, "Challenge 2", 2),
                ...pageChildren(context, "Challenge 3", 3),
                ...pageChildren(context, "Challenge 4", 4),
                ...pageChildren(context, "Challenge 5", 5),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 6", 6),
                ...pageChildren(context, "Challenge 7", 7),
                ...pageChildren(context, "Challenge 8", 8),
                ...pageChildren(context, "Challenge 9", 9),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 10", 10),
                ...pageChildren(context, "Challenge 11", 11),
                ...pageChildren(context, "Challenge 12", 12),
                ...pageChildren(context, "Challenge 13", 13),
                ...pageChildren(context, "Challenge 14", 14),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 15", 15),
                ...pageChildren(context, "Challenge 16", 16),
                ...pageChildren(context, "Challenge 17", 17),
                ...pageChildren(context, "Challenge 18", 18),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 19", 19),
                ...pageChildren(context, "Challenge 20", 20),
                ...pageChildren(context, "Challenge 21", 21),
                ...pageChildren(context, "Challenge 22", 22),
                ...pageChildren(context, "Challenge 23", 23),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 24", 24),
                ...pageChildren(context, "Challenge 25", 25),
                ...pageChildren(context, "Challenge 26", 26),
                ...pageChildren(context, "Challenge 27", 27),
              ]),
            ],
          );
        }
        else if (constraints.maxWidth <= 900 && constraints.maxWidth > 750) {
          return Row(
            children: [
              Column(children: [
                ...pageChildren(context, "Challenge 1", 1),
                ...pageChildren(context, "Challenge 2", 2),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 3", 3),
                ...pageChildren(context, "Challenge 4", 4),
                ...pageChildren(context, "Challenge 5", 5),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 6", 6),
                ...pageChildren(context, "Challenge 7", 7),
                ...pageChildren(context, "Challenge 8", 8),
                ...pageChildren(context, "Challenge 9", 9),
                ...pageChildren(context, "Challenge 10", 10),
                ...pageChildren(context, "Challenge 11", 11),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 12", 12),
                ...pageChildren(context, "Challenge 13", 13),
                ...pageChildren(context, "Challenge 14", 14),
                ...pageChildren(context, "Challenge 15", 15),
                ...pageChildren(context, "Challenge 16", 16),
                ...pageChildren(context, "Challenge 17", 17),
                ...pageChildren(context, "Challenge 18", 18),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 19", 19),
                ...pageChildren(context, "Challenge 20", 20),
                ...pageChildren(context, "Challenge 21", 21),
                ...pageChildren(context, "Challenge 22", 22),
                ...pageChildren(context, "Challenge 23", 23),
                ...pageChildren(context, "Challenge 24", 24),
                ...pageChildren(context, "Challenge 25", 25),
                ...pageChildren(context, "Challenge 26", 26),
                ...pageChildren(context, "Challenge 27", 27),
              ]),
            ],
          );
        }
        else if (constraints.maxWidth <= 750 && constraints.maxWidth > 550) {
          return Row(
            children: [
              Column(children: [
                ...pageChildren(context, "Challenge 1", 1),
                ...pageChildren(context, "Challenge 2", 2),
                ...pageChildren(context, "Challenge 3", 3),
                ...pageChildren(context, "Challenge 4", 4),
                ...pageChildren(context, "Challenge 5", 5),
                ...pageChildren(context, "Challenge 6", 6),
                ...pageChildren(context, "Challenge 7", 7),
                ...pageChildren(context, "Challenge 8", 8),
                ...pageChildren(context, "Challenge 9", 9),
                ...pageChildren(context, "Challenge 10", 10),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 11", 11),
                ...pageChildren(context, "Challenge 12", 12),
                ...pageChildren(context, "Challenge 13", 13),
                ...pageChildren(context, "Challenge 14", 14),
                ...pageChildren(context, "Challenge 15", 15),
                ...pageChildren(context, "Challenge 16", 16),
                ...pageChildren(context, "Challenge 17", 17),
              ]),
              Column(children: [
                ...pageChildren(context, "Challenge 18", 18),
                ...pageChildren(context, "Challenge 19", 19),
                ...pageChildren(context, "Challenge 20", 20),
                ...pageChildren(context, "Challenge 21", 21),
                ...pageChildren(context, "Challenge 22", 22),
                ...pageChildren(context, "Challenge 23", 23),
                ...pageChildren(context, "Challenge 24", 24),
                ...pageChildren(context, "Challenge 25", 25),
                ...pageChildren(context, "Challenge 26", 26),
                ...pageChildren(context, "Challenge 27", 27),
              ]),
            ],
          );
        }
        else {
          return Column(
            children: [
              ...pageChildren(context, "Challenge 1", 1),
              ...pageChildren(context, "Challenge 2", 2),
              ...pageChildren(context, "Challenge 3", 3),
              ...pageChildren(context, "Challenge 4", 4),
              ...pageChildren(context, "Challenge 5", 5),
              ...pageChildren(context, "Challenge 6", 6),
              ...pageChildren(context, "Challenge 7", 7),
              ...pageChildren(context, "Challenge 8", 8),
              ...pageChildren(context, "Challenge 9", 9),
              ...pageChildren(context, "Challenge 10", 10),
              ...pageChildren(context, "Challenge 11", 11),
              ...pageChildren(context, "Challenge 12", 12),
              ...pageChildren(context, "Challenge 13", 13),
              ...pageChildren(context, "Challenge 14", 14),
              ...pageChildren(context, "Challenge 15", 15),
              ...pageChildren(context, "Challenge 16", 16),
              ...pageChildren(context, "Challenge 17", 17),
              ...pageChildren(context, "Challenge 18", 18),
              ...pageChildren(context, "Challenge 19", 19),
              ...pageChildren(context, "Challenge 20", 20),
              ...pageChildren(context, "Challenge 21", 21),
              ...pageChildren(context, "Challenge 22", 22),
              ...pageChildren(context, "Challenge 23", 23),
              ...pageChildren(context, "Challenge 24", 24),
              ...pageChildren(context, "Challenge 25", 25),
              ...pageChildren(context, "Challenge 26", 26),
              ...pageChildren(context, "Challenge 27", 27),

            ],
          );
        }
      },
    );
  }
}
