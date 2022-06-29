import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:new_project/DataBase/connections/book_database.dart';

import '../Pages/pdfViewPage.dart';
import '../DataBase/models/book_info.dart';

class View extends StatelessWidget {
  View(
      {Key? key,
      required this.name,
      required this.path,
      @required this.description,
      required this.id,
      required this.isLiked})
      : super(key: key);
  final String name;
  final String path;
  final String? description;
  final int? id;
  final int isLiked;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => (HomePage(
                        path: path,
                      ))),
            );
          },
          child: Container(
              // color: Colors.white,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 194, 194, 194),
                boxShadow: [
                  BoxShadow(color: Colors.orange, spreadRadius: 3),
                ],
              ),
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              padding: const EdgeInsets.all(10.0),
              height: 200,
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    name.substring(0, name.length - 4),
                    style: const TextStyle(fontSize: 28),
                    overflow: TextOverflow.fade,
                  ),
                  Text(
                    description!,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        color: Colors.red,
                        iconSize: 40,
                        onPressed: () {
                          BookInfoDatabase.instance.updateIsLiked(id, isLiked);
                        },
                        icon: const Icon(Icons.favorite_border_rounded),
                      ),
                      IconButton(
                          color: Colors.red,
                          iconSize: 40,
                          onPressed: () => BookInfoDatabase.instance.delete(id),
                          icon: const Icon(Icons.delete_forever_outlined)),
                      //IconToucheble(Icons.favorite_border_outlined).createState(Icons.favorite_border_outlined),
                    ],
                  )
                ],
              )),
        )
      ],
    );
  }
}

Widget ViewBookElement(
  BuildContext context, {
  required String name,
  @required String? author,
  @required String? bookFormat,
  @required String? description,
  required String path,
}) {
  return Scaffold(
      body: Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Flexible(
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => (HomePage(
                          path: path,
                        ))),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(fontSize: 28),
                  overflow: TextOverflow.clip,
                ),
                Text(
                  description!,
                  style: const TextStyle(fontSize: 20),
                ),
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
            ),
          ))
    ],
  ));
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
