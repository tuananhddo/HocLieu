import 'package:flutter/material.dart';
import 'NavigationDrawer.dart';
import 'title_and_description/AppDescription.dart';
class InfomationScreen extends StatelessWidget {
  final appTitle = 'Introdution';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: InfomationPage(title: appTitle),
    );
  }
}
class InfomationPage extends StatelessWidget {
  final String title;

  InfomationPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: ListView(
          children: <Widget>[

            Card(
              child: ListTile(
                title: Text('Giới thiệu'),
                subtitle: Text(Introdutions),
              ),
            ),
            Card(
              child: ListView(
                shrinkWrap: true,

                children: <Widget>[

                ],
              )
            ),
            Card(
              child: ListTile(
                title: Text('Phiên bản'),
                subtitle: ListView(
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
