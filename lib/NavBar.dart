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

class NavBar extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromARGB(255, 131, 131, 131),
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 40),
            SideBarItem(
                text: "About",
                icon: Icons.info,
                func: () => SelectedItem(context, const About())),
            const Divider(color: Colors.white),
            SideBarItem(
                text: "Read",
                icon: Icons.book,
                func: () => SelectedItem(context, const Read())),
            const SizedBox(height: 10),
            SideBarItem(
                text: "Last",
                icon: Icons.timer,
                func: () => SelectedItem(context, const Last())),
            const SizedBox(height: 10),
            SideBarItem(
                text: "Favorite",
                icon: Icons.favorite,
                func: () => SelectedItem(context, const Favorite())),
            const SizedBox(height: 10),
            SideBarItem(
                text: "Search",
                icon: Icons.search,
                func: () => SelectedItem(context, const Search())),
            const SizedBox(height: 10),
            SideBarItem(
                text: "Collections",
                icon: Icons.collections_bookmark,
                func: () => SelectedItem(context, const Collections())),
            const Divider(
              color: Colors.white,
            ),
            SideBarItem(
                text: "Settings",
                icon: Icons.settings,
                func: () => SelectedItem(context, const Settings())),
            const SizedBox(height: 10),
            SideBarItem(
                text: "Help",
                icon: Icons.help,
                func: () => SelectedItem(context, const Help())),
            const SizedBox(height: 10),
            SideBarItem(
                text: "Report",
                icon: Icons.report,
                func: () => SelectedItem(context, const Report())),
          ],
        ),
      ),
    );
  }
}

Widget SideBarItem({
  required String text,
  required IconData icon,
  required VoidCallback func,
}) {
  const color = Colors.white;
  const hoverColor = Colors.blue;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: const TextStyle(color: color, fontSize: 18)),
    hoverColor: hoverColor,
    onTap: func,
  );
}

void SelectedItem(BuildContext context, StatelessWidget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
}
