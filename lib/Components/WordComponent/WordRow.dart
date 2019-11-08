import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Components/WordComponent/CustomCheckBox..dart';
import 'package:hoclieu_clone_0_4/Constant/APIConstant.dart';
import 'package:hoclieu_clone_0_4/fetchData/Word.dart';

class WordRow extends StatefulWidget{

  final int id;
  final Word word ;
  final Function(String) play;
  WordRow({Key key, this.word,this.play,this.id})
      : super(key: key);

  @override
  WordRowState createState() => WordRowState();
}
class WordRowState extends State<WordRow> {

  var isChecked = [false,false,false,false,false];
  List<Widget> cusomtCheckboxs ;
  void setCheckBoxChecked(checkBoxId){
    setState(() {
      this.isChecked[checkBoxId] = !isChecked[checkBoxId];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          ListTile(
            leading: Image.network(
              '$baseURL/image/${widget.word.image}',
              height: 50,
              width: 50,
              scale: 0.6,
              fit: BoxFit.fill,
            ),
            title: Row(children: <Widget>[
              Text(widget.word.name + " ",style: TextStyle(color: Colors.red),),
              Icon(
                Icons.volume_up,
                color: Colors.green,
                size: 24.0,
              ),
              Text(widget.word.translated_name,style: TextStyle(fontSize: 12,),)
            ]),
            subtitle: Text(widget.word.description),
            onTap: (){widget.play(widget.word.sound);},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              CustomCheckBox(0,Colors.black,Colors.yellow ,isChecked[0],setCheckBoxChecked),
              CustomCheckBox(1,Colors.white,Colors.blue ,isChecked[1],setCheckBoxChecked),
              CustomCheckBox(2,Colors.white,Colors.green ,isChecked[2],setCheckBoxChecked),
              CustomCheckBox(3,Colors.white,Colors.red ,isChecked[3],setCheckBoxChecked),
              CustomCheckBox(4,Colors.white,Colors.grey ,isChecked[4],setCheckBoxChecked),




//              CustomCheckBox(tickedColor: Colors.white,checkBoxColor: Colors.blue ,changeCheckboxState: setCheckBoxChecked,id: 2),
//              CustomCheckBox(tickedColor: Colors.white,checkBoxColor: Colors.green ,changeCheckboxState: setCheckBoxChecked,id:3),
//              CustomCheckBox(tickedColor: Colors.white,checkBoxColor: Colors.red ,changeCheckboxState: setCheckBoxChecked,id: 4),
//              CustomCheckBox(tickedColor: Colors.white,checkBoxColor: Colors.grey ,changeCheckboxState: setCheckBoxChecked,id: 5),

            ],
          ),
          Divider()
        ]
    );

  }
}