import 'package:flutter/material.dart';

Widget notSignInButton(context)  =>
    FlatButton(
      child: Text('Đăng nhập sau',style: TextStyle(color: Colors.blue),),
      onPressed: (){
        Navigator.pushNamed(context, '/books');
      },
    );

