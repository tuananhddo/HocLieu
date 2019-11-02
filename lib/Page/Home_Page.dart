import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Components/LoginCard.dart';
import '../Components/learningSkillLine.dart';
import 'NavigationDrawer.dart';
class MyHomePage extends StatefulWidget {

  final String title;
  final bool isLogin ;
  final Function(List) handleLogin;
  FirebaseUser user;

  MyHomePage({Key key, this.title, this.handleLogin,this.isLogin,this.user}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}
class _HomePageState extends State<MyHomePage>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
          child:ListView(
            children: <Widget>[
              (!widget.isLogin ? notLoginCard(context,widget.handleLogin) : hasLoginCard(widget.handleLogin,widget.user)),
              Divider(thickness: 1,),
              Column(
                  children:<Widget>[
                    Text('Chọn kỹ năng bạn muốn luyện'),
                    LearningSkillLine(title :'Nghe'),
                    LearningSkillLine(title :'Nói'),

                    LearningSkillLine(title :'Đọc'),
                    LearningSkillLine(title :'Viết'),

                  ]
              )


            ],
          )

      ),
      drawer: navigationDrawer(context)
    );
  }
}

