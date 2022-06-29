import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/SideMenuWidgets/About.dart';
import 'package:new_project/SideMenuWidgets/Collections.dart';
import 'package:new_project/SideMenuWidgets/Favorite.dart';
import 'package:new_project/SideMenuWidgets/Help.dart';
import 'package:new_project/SideMenuWidgets/Last.dart';
import 'package:new_project/SideMenuWidgets/Read.dart';
import 'package:new_project/SideMenuWidgets/Report.dart';
import 'package:new_project/SideMenuWidgets/Search.dart';
import 'package:new_project/SideMenuWidgets/Settings.dart';
import 'package:new_project/Widgets/BookFaceElement.dart';

import 'Pages/pdfViewPage.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Material(
      color: Color.fromARGB(255, 187, 187, 187),
      child: ListView(
        children: <Widget>[
          SideBarItem(
              text: "Read",
              icon: Icons.book,
              func: () => SelectedItem(context, const Read())),
          SideBarItem(
              text: "Last",
              icon: Icons.timer,
              func: () => SelectedItem(context, const Last())),
          SideBarItem(
              text: "Favorite",
              icon: Icons.favorite,
              func: () => SelectedItem(context, const Favorite())),
          SideBarItem(
              text: "Search",
              icon: Icons.search,
              func: () => SelectedItem(context, Search())),
          /*  SideBarItem(
              text: "Collections",
              icon: Icons.collections_bookmark,
              func: () => SelectedItem(context, const Collections())),
          SideBarItem(
              text: "Settings",
              icon: Icons.settings,
              func: () => SelectedItem(context, const Settings())),*/
          Divider(
            color: Colors.white,
          ),
          SideBarItem(
              text: "About",
              icon: Icons.info,
              func: () => SelectedItem(context, const About())),
          SideBarItem(
              text: "Report",
              icon: Icons.report,
              func: () => SelectedItem(context, const Report())),
        ],
      ),
    ));
  }
}

Widget SideBarItem({
  required String text,
  required IconData icon,
  required VoidCallback func,
}) {
  var color = Colors.white;
  const hoverColor = Colors.blue;

  /*return InkWell(
    child: Container(
      child: Icon(icon, color: color, size: 150),
    ),
    onTap: func,
  );*/
  return ListTile(
    leading: Icon(icon, color: color, size: 34),
    title:
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 30)),
    hoverColor: hoverColor,
    onTap: func,
  );
}

void SelectedItem(BuildContext context, StatelessWidget screen) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => screen))
      .then((value) => null);
}
