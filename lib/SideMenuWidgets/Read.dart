import 'package:flutter/material.dart';
import 'package:new_project/Pages/BookPage.dart';

class Read extends StatelessWidget {
  const Read({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text('Read'), backgroundColor: Colors.orange),
      body: BookPage(),
    );
  }
}
