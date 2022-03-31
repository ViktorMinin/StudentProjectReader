import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  const Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Report'), backgroundColor: Colors.orange),
      body: const Center(
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Describe the main problem',
              labelText: "Report"),
        ),
      ),
    );
  }
}
