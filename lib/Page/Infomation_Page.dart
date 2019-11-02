import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'NavigationDrawer.dart';
import '../title_and_description/AppDescription.dart';
class InfomationScreen extends StatelessWidget {
  final appTitle = 'Giới thiệu';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(appTitle)),
        body: Center(
          child: ListView(
            children: <Widget>[

              Card(
                child: ListTile(
                  title: Text('Giới thiệu',style: TextStyle(fontSize: 20),),
                  subtitle: Text(Introdutions),
                ),
              ),
              Card(

                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      ListTile(
                        title: Text('Liên hệ',style: TextStyle(fontSize: 20),),
                      ),
                      ListTile(
                        leading: const Icon(Icons.book),
                        title: Text('https://sachmem.vn',style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline),),
                        onTap: () => launch('https://gioithieu.sachmem.vn')
                        ,
                      ),
                      ListTile(
                        leading: const Icon(Icons.book),
                        title: Text('lienhe@sachmem.vn',style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline),),
                        onTap: () => launch('mailto:lienhe@sachmem.vn')

                      ),
                      ListTile(
                        leading: const Icon(Icons.book),
                        title: Text('+84 243512222',style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline),),
                          onTap: () => launch('tel:+84 243512222')

                      ),
                      ListTile(
                        leading: const Icon(Icons.book),
                        title: Text('Facebook',style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline),),
                        onTap: () => launch('https://fb.com/sachmem.vn')

                      )
                    ],
                  )
              ),
              Card(
                child: ListTile(
                  title: Text('Phiên bản',style: TextStyle(fontSize: 20),),
                  subtitle: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      Text(versionDescription),
                      Divider(),
                      Text(versionPatch)
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
        drawer: navigationDrawer(context));

  }
}