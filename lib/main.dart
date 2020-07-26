import 'package:flutter/material.dart';
import 'package:challenges_web/home.dart';
import 'package:challenges_web/PagesBody/challanges/challenge1.dart';
import 'package:challenges_web/PagesBody/challanges/challenge2.dart';
import 'package:challenges_web/PagesBody/challanges/challenge3.dart';
import 'package:challenges_web/PagesBody/challanges/challenge4.dart';
import 'package:challenges_web/PagesBody/challanges/challenge5.dart';
import 'package:challenges_web/PagesBody/challanges/challenge6.dart';
import 'package:challenges_web/PagesBody/challanges/challenge7.dart';
import 'package:challenges_web/PagesBody/challanges/challenge8.dart';
import 'package:challenges_web/PagesBody/challanges/challenge9.dart';
import 'package:challenges_web/PagesBody/challanges/challenge10.dart';
import 'package:challenges_web/PagesBody/challanges/challenge11.dart';
import 'package:challenges_web/PagesBody/challanges/challenge12.dart';
import 'package:challenges_web/PagesBody/challanges/challenge13.dart';
import 'package:challenges_web/PagesBody/challanges/challenge14.dart';
import 'package:challenges_web/PagesBody/challanges/challenge15.dart';
import 'package:challenges_web/PagesBody/challanges/challenge16.dart';
import 'package:challenges_web/PagesBody/challanges/challenge17.dart';
import 'package:challenges_web/PagesBody/challanges/challenge18.dart';
import 'package:challenges_web/PagesBody/challanges/challenge19.dart';
import 'package:challenges_web/PagesBody/challanges/challenge20.dart';
import 'package:challenges_web/PagesBody/challanges/challenge21.dart';
import 'package:challenges_web/PagesBody/challanges/challenge22.dart';
import 'package:challenges_web/PagesBody/challanges/challenge23.dart';
import 'package:challenges_web/PagesBody/challanges/challenge24.dart';
import 'package:challenges_web/PagesBody/challanges/challenge25.dart';
import 'package:challenges_web/PagesBody/challanges/challenge26.dart';
import 'package:challenges_web/PagesBody/challanges/challenge27.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.route,
      routes: {
        Home.route: (context) => Home(),
        Challenge1.route: (context) => Challenge1(),
        Challenge2.route: (context) => Challenge2(),
        Challenge3.route: (context) => Challenge3(),
        Challenge4.route: (context) => Challenge4(),
        Challenge5.route: (context) => Challenge5(),
        Challenge6.route: (context) => Challenge6(),
        Challenge7.route: (context) => Challenge7(),
        Challenge8.route: (context) => Challenge8(),
        Challenge9.route: (context) => Challenge9(),
        Challenge10.route: (context) => Challenge10(),
        Challenge11.route: (context) => Challenge11(),
        Challenge12.route: (context) => Challenge12(),
        Challenge13.route: (context) => Challenge13(),
        Challenge14.route: (context) => Challenge14(),
        Challenge15.route: (context) => Challenge15(),
        Challenge16.route: (context) => Challenge16(),
        Challenge17.route: (context) => Challenge17(),
        Challenge18.route: (context) => Challenge18(),
        Challenge19.route: (context) => Challenge19(),
        Challenge20.route: (context) => Challenge20(),
        Challenge21.route: (context) => Challenge21(),
        Challenge22.route: (context) => Challenge22(),
        Challenge23.route: (context) => Challenge23(),
        Challenge24.route: (context) => Challenge24(),
        Challenge25.route: (context) => Challenge25(),
        Challenge26.route: (context) => Challenge26(),
        Challenge27.route: (context) => Challenge27(),
      },
    );
  }
}