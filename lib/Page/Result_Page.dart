import 'package:flutter/material.dart';
import 'NavigationDrawer.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final bool isLogin;
  ResultPage({Key key, this.title,this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child:
            isLogin
              ?
            Card(
              child: ListTile(
                title: Text('Kết quả học tập của bạn'),
                subtitle: Text(""),
              ),
            )
                :
            Card(
              child: ListTile(
                title: Text('Chưa đăng nhập'),
                subtitle: Text("Bạn cần đăng nhập vào hệ thống để xem kết quả học tập"),

              )
            )
        ),
        drawer: navigationDrawer(context));

  }
}

