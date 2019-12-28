import 'package:flutter/material.dart';

Widget notSignInButton(context)  =>
    Padding(
        padding: EdgeInsets.all(10.0),
        child: FlatButton(
          child: Text('Đăng nhập sau',style: TextStyle(color: Colors.blue),),
          onPressed: (){
            Navigator.pushNamed(context, '/books');
          },
    )
);

