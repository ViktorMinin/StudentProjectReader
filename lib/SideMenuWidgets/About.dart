import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.info),
        title: const Text('About'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(child: Text("This application was made for reading books")),
    );
  }
}
