import 'package:flutter/material.dart';

Widget ViewBookElement({
  required String name,
  @required String? author,
  @required String? bookFormat,
  @required String description = "Test description ",
}) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Image.network(
        "https://images-na.ssl-images-amazon.com/images/I/91oy4zw56KL.jpg",
        height: 200,
      ),
      const SizedBox(width: 10),
      Container(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                name,
                style: const TextStyle(fontSize: 28),
              ),
              Text(description),
              Row(
                children: <Widget>[
                  IconButton(
                    color: Colors.red,
                    onPressed: () => null,
                    icon: const Icon(Icons.favorite_border_rounded),
                  ),
                  IconButton(
                      color: Colors.red,
                      onPressed: () => null,
                      icon: const Icon(Icons.collections_bookmark_outlined)),
                  IconButton(
                      color: Colors.red,
                      onPressed: () => null,
                      icon: const Icon(Icons.watch_later_outlined)),
                  //IconToucheble(Icons.favorite_border_outlined).createState(Icons.favorite_border_outlined),
                ],
              )
            ],
          )),
    ],
  );
}

class IconToucheble extends State<StatefulWidget> {
  @override
  IconToucheble createState(IconData icon) => IconToucheble(icon);
  Color _favIconColor = Colors.grey;
  final IconData icon;
  IconToucheble(this.icon);
  @override
  Widget build(BuildContext) {
    return IconButton(
      icon: Icon(icon),
      color: _favIconColor,
      tooltip: 'Add to favorite',
      onPressed: () {
        setState(() {
          if (_favIconColor == Colors.grey) {
            _favIconColor = Colors.red;
          } else {
            _favIconColor = Colors.grey;
          }
        });
      },
    );
  }
}
