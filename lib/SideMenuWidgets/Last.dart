import 'package:flutter/material.dart';
import 'package:new_project/Pages/BookPage.dart';

import '../Pages/BookPageByDate.dart';

class Last extends StatelessWidget {
  const Last({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text('Last'), backgroundColor: Colors.orange),
      body: BookPageByDate(),
    );
  }
}
