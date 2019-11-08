import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LearningSkillLine extends StatefulWidget{

  final String title;
  final IconData icon;
  final Color iconColor;
  LearningSkillLine({Key key, this.title: "",this.icon,this.iconColor})
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
              widget.icon,
              color: widget.iconColor,
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