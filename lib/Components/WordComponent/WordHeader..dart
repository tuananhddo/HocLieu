import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/fetchData/Unit.dart';

class WordHeader extends StatefulWidget {

  final Unit unit;

  WordHeader({Key key, this.unit})
      : super(key: key);

  @override
  _WordHeaderState createState() => _WordHeaderState();
}

class _WordHeaderState extends State<WordHeader> {

  @override
  Widget build(BuildContext context) {
    double iconSpace = 40;
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
          children: <Widget>[
            (widget.unit.id != -1) ?
            ListTile(
              title: Row(children: <Widget>[
                Text('Unit ' + widget.unit.unit_number.toString() + '\t',style: TextStyle(color: Colors.blue),),
                Text(widget.unit.unit_name),
              ]),
            ):
            Row(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  width: iconSpace,
                  child:Icon(Icons.headset,color: Colors.yellow,),
                ),
                SizedBox(
                  width: iconSpace,
                  child:Icon(Icons.mic,color: Colors.blue,),
                ),
                SizedBox(
                  width: iconSpace,
                  child:Icon(Icons.mode_edit,color: Colors.green,),
                ),
                SizedBox(
                  width: iconSpace,
                  child:Icon(Icons.chrome_reader_mode,color: Colors.red,),
                ),
                SizedBox(
                  width: iconSpace,
                  child:Icon(Icons.done_all,color: Colors.grey,),
                ),

              ],
            ),
            Divider()
          ]
      ),
    );
  }
}