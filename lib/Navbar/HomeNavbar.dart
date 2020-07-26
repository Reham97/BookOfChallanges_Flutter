import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavbar();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: Row(
          children: <Widget>[
            Image.asset(
              'assets/images/cherry-searching-1.png',
              width: 200,
              height: 150,
            ),
            Text(
              "Reham Task",
              style: TextStyle(fontFamily: "Pacifico", color: Colors.white, fontSize: 50),
            ),
            SizedBox(
              width: 30,
            ),
         ],
        ),
      ),
    );
  }
}

class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: Column(children: <Widget>[
          Image.asset(
            'assets/images/cherry-searching-1.png',
            width: 200,
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Reham Task",
              style: TextStyle(fontFamily: "Pacifico", color: Colors.white, fontSize: 40),
                ),
                SizedBox(
                  width: 30,
                ),
              
              ],
            ),
          )
        ]),
      ),
    );
  }
}
