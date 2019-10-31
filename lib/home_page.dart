import 'package:flutter/material.dart';
import 'signIn_button.dart';
import 'learningSkillLine.dart';
import 'NavigationDrawer.dart';
class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
          child:ListView(
            children: <Widget>[
              Column(
                  children:<Widget>[
                    Text('Để lưu kết quả học tập bạn cần đăng nhập'),
                    //             Expanded(
                    //               child: FittedBox(
                    //                 fit: BoxFit.contain, // otherwise the logo will be tiny
                    //                 child: const FlutterLogo(),
                    //               ),
                    //             ),
                    signInButton('Google    ',context),
//                   signInButton('Facebook'),
                  ]
              ),
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
