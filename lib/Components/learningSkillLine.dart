import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LearningSkillLine extends StatefulWidget{

  final String title;
  LearningSkillLine({Key key, this.title: ""})
      : super(key: key);

  @override
  LearningSkillLineState createState() => LearningSkillLineState();
}
class LearningSkillLineState extends State<LearningSkillLine> {
  bool _isChosen = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.0,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(widget.title),
            leading: Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
            trailing: CupertinoSwitch(
              value: _isChosen,
              onChanged: (bool value) {
                setState(() {
                  _isChosen = value;
                });
              },
            ),
          ),
          Divider(),

        ],
      ),
    );
  }
}