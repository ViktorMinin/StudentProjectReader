import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.info),
        title: const Text('About'),
        backgroundColor: Colors.orange,
      ),
      body: Center( 
      ),
    );
  }
}
