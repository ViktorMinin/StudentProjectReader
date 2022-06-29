import 'package:flutter/material.dart';
import '../Pages/BookPageFavorite.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          leading: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.refresh, // add custom icons also
              )),
          title: const Text('Favorite'),
          backgroundColor: Colors.orange),
      body: BookPageFavorite(),
    );
  }
}
