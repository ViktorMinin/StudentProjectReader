import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help'), backgroundColor: Colors.orange),
      body: Material(
          child: ListView(children: <Widget>[
        Text(
            "1) Click to loop, after that click the butto, provider will be open. You need to choose books",
            style: TextStyle(fontSize: 20, color: Colors.yellow)),
        Text(
            "2) In main menu you can click the book icon, there are your books",
            style: TextStyle(fontSize: 20, color: Colors.yellow)),
      ])),
    );
  }
}
