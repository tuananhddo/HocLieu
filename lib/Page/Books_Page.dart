import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'NavigationDrawer.dart';
class BooksPage extends StatefulWidget {

  final String title;
  final bool isLogin ;
  final Function(List) handleLogin;
  final sourcePath = "127.0.0.1:1998/model2.jpg";// change to 10.0.2.2
  FirebaseUser user;

  BooksPage({Key key, this.title, this.handleLogin,this.isLogin,this.user}) : super(key: key);

  @override
  _BookPageState createState() => new _BookPageState();
}
class _BookPageState extends State<BooksPage>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text("Book")),
        body: Center(
            child:ListView(
              children: <Widget>[
                ListTile(
//                    height: 50,
                    title: Text("SGK"),
                    leading:Image.network(
                      "http://10.0.2.2:1998/model2.jpg",
                      height: 100,
                      width: 100,
                      scale: 0.6,
                    )
                ),
                Divider(thickness: 1,),
                ListTile(
//                    height: 50,
                    title: Text("SGK"),
                    leading:new ClipRRect(
                        borderRadius: new BorderRadius.circular(8.0),
                        child:Image.network(
                          "http://10.0.2.2:1998/b.jpg",
                          height: 100,
                          width: 100,
                          scale: 0.6,
                        )
                    )
                ),



              ],
            )

        ),
        drawer: navigationDrawer(context)
    );
  }
}

