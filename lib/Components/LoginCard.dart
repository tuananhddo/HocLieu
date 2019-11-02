import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Components/notSignInButton.dart';

import 'signIn_button.dart';

Widget hasLoginCard (hasLoginCallback,user) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:<Widget>[
        Text('Người dùng đang đăng nhập'),
        Center(
            child:Image.network(
              user.photoUrl,
              height: 160,
              width: 160,
              scale: 0.6,
            )
        ),
        Text(user.displayName,style: TextStyle(fontSize: 20),),
        OutlineButton(
          onPressed: (){
          signOutGoogle();
          hasLoginCallback([false,null]);
//              Navigator.pushNamed(context, '/');
          },
          child: Text('Đăng xuất'),


        )
      ]
    );
}

Widget notLoginCard(context,callback) {

  return
    Column(
      children:<Widget>[
        Text('Để lưu kết quả học tập bạn cần đăng nhập'),

        signInButton('Google    ',context,callback),
//                   signInButton('Facebook'),
        notSignInButton(context),
      ]
  );
}