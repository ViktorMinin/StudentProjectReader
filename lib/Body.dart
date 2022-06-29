import 'package:flutter/material.dart';

import 'Widgets/BookFaceElement.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        isAlwaysShown: true,
        child: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              const SizedBox(height: 10),
            ],
          )
        ]));
  }
}

class SomeState extends State<StatefulWidget> {
  Color _iconColor = Colors.white;

  @override
  Widget build(BuildContext) {
    return ListTile(
        leading: IconButton(
      icon: Icon(Icons.star, color: _iconColor),
      onPressed: () {
        setState(() {
          _iconColor = Colors.yellow;
        });
      },
    ));
  }
}
