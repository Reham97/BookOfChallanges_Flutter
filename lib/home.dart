import 'package:flutter/material.dart';
import 'Navbar/HomeNavbar.dart';
import 'PagesBody/HomeBody.dart';

class Home extends StatelessWidget {
  static const String route = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(20, 30, 48, 1.0),
                Color.fromRGBO(36, 59, 85, 1.0),
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Navbar(),
              HomeBody(),
            ],
          ),
        ),
      ),
    );
  }
}
