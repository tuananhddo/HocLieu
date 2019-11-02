import 'package:flutter/material.dart';
import 'Page/Infomation_Page.dart';
import 'Page/Home_Page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final appTitle = 'Drawer Demos';
  bool isLogin = false;

  void _handleLogin(bool newValue) {
    setState(() {
      isLogin = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
//      home: MyHomePage(title: appTitle),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: appTitle,handleLogin: _handleLogin,isLogin: isLogin,),
        '/info': (context) => InfomationScreen(),
        '/result': (context) => InfomationScreen(),
        '/books': (context) => InfomationScreen(),

      },
    );
  }

}

