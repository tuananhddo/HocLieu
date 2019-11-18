import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Page/Books_Page.dart';
import 'package:hoclieu_clone_0_4/Page/Result_Page.dart';
import 'Page/Infomation_Page.dart';
import 'Page/Home_Page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
//  final appTitle = 'Drawer Demos';
  bool isLogin = false;
  FirebaseUser user;
  void _handleLogin(list) {
    setState(() {
      isLogin = list[0];
      this.user = list[1];
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      title: appTitle,
//      home: MyHomePage(title: appTitle),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title:'Người dùng',handleLogin: _handleLogin,isLogin: isLogin,user: user,),
        '/info': (context) => InfomationScreen(),
        '/result': (context) => ResultPage(title: 'Kết quả học tập',isLogin: isLogin),
        '/books': (context) => BooksPage(),

      },
    );
  }

}

