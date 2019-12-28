import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Components/notSignInButton.dart';

import 'signIn_button.dart';

Widget hasLoginCard (hasLoginCallback,user) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:<Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Người dùng đang đăng nhập'),
        ),
        Center(
            child:Image.network(
              user.photoUrl,
              height: 120,
              width: 120,
              scale: 0.8,
            )
        ),
        Text(user.displayName,style: TextStyle(fontSize: 20),),
        Padding(
          padding: EdgeInsets.all(5.0),
          child: OutlineButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),

            onPressed: (){
              signOutGoogle();
              hasLoginCallback([false,null]);
//              Navigator.pushNamed(context, '/');
            },
            child: Text('Đăng xuất'),

          )
        )

      ]
    );
}

Widget notLoginCard(context,callback) {

  return
    Column(
      children:<Widget>[
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Text('Để lưu kết quả học tập bạn cần đăng nhập'),
        ),
        signInButton('Google    ',context,callback),
//                   signInButton('Facebook'),
        notSignInButton(context),
      ]
  );
}