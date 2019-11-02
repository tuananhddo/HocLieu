import 'package:flutter/material.dart';

import 'signIn_button.dart';

Widget hasLoginCard (hasLogin) {
    return
      Column(
          children:<Widget>[
            Text('Login Success'),
            OutlineButton(
              onPressed: (){
              signOutGoogle();
              hasLogin(false);
//              Navigator.pushNamed(context, '/');
              },
              child: Text('SignOut'),


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
      ]
  );
}