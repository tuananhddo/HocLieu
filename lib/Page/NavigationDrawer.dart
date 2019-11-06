import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';

Widget navigationDrawer(context) {
  String page = context.widget.toString();
  return
  Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      children: <Widget>[
        Container(
          height: 65.0,
          child: DrawerHeader(
            child: Text('Từ vựng - Sách mềm',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            decoration: new BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.book),
          title: Text('Sách'),
          onTap: () {
            if (page != 'BooksPage') {
              Navigator.pushNamed(context, '/books');
            } else {
              Navigator.pop(context);
            }          },
        ),
        ListTile(
          leading: const Icon(Icons.book),
          title: Text('Kết quả học'),
          onTap: () {
            if (page != 'ResultPage') {
              Navigator.pushNamed(context, '/result');
            } else {
              Navigator.pop(context);
            }
          },
        ),
        ListTile(
          leading: const Icon(Icons.book),
          title: Text('Người dùng'),
          onTap: () {
//          debugPrint(context.widget.toString());
            if (page != 'MyHomePage') {
              Navigator.of(context).pushNamed('/');
            } else {
              Navigator.pop(context);
            }
          },
        ),
        ListTile(
          leading: const Icon(Icons.book),
          title: Text('Giới thiệu'),
          onTap: () {
            if (page != 'InfomationScreen') {
              Navigator.of(context).pushNamed('/info');
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ],
    ),
  );
}