import 'package:flutter/material.dart';
import 'Infomation_Screen.dart';
import 'home_page.dart';
Widget navigationDrawer(context) => Drawer(
  // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the drawer if there isn't enough vertical
  // space to fit everything.
  child: ListView(
    // Important: Remove any padding from the ListView.
    children: <Widget>[
      Container(
        height: 65.0,
        child: DrawerHeader(
          child: Text('Từ vựng - Sách mềm', style: TextStyle(color: Colors.white,fontSize: 20)),
          decoration: new BoxDecoration(
            color: Colors.blue,
          ),

        ),
      ),
      ListTile(
        leading: const Icon(Icons.book),
        title: Text('Sách'),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
//                Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.book),
        title: Text('Kết quả học'),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.book),
        title: Text('Người dùng'),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
//          Navigator.pop(context);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return MyHomePage(title:'Người dùng');
              },
            ),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.book),
        title: Text('Giới thiệu'),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
//                Navigator.pop(context);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return InfomationScreen();
              },
            ),
          );
        },
      ),
    ],
  ),
);