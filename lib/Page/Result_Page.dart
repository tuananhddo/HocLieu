import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Components/ResultComponent/Result_Login_Card..dart';
import 'NavigationDrawer.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final bool isLogin;
  final FirebaseUser user;
  ResultPage({Key key, this.title,this.isLogin,this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child:
            isLogin
              ?
            ResultLoginCard(user:user)
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

