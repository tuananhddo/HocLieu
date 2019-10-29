import 'package:flutter/material.dart';
import 'signIn_button.dart';
import 'learningSkillLine.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

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


//                   learning_skill_line('Nghe'),
//                   learning_skill_line('Nói'),
//                   learning_skill_line('Viết'),
//                   learning_skill_line('Đọc'),


                 ]
             )


           ],
         )

      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          children: <Widget>[
            Container(
              height: 65.0,
              child: DrawerHeader(
                  child: Text('Từ vựng - Sách mềm', style: TextStyle(color: Colors.black)),
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
                Navigator.pop(context);
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: Text('Giới thiệu'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
