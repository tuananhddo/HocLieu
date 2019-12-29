import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Constant/APIConstant.dart';
import 'package:hoclieu_clone_0_4/fetchData/Unit.dart';
import 'package:hoclieu_clone_0_4/fetchData/Word.dart';

class WordDetailPage extends StatelessWidget {

  WordDetailPage({this.word,this.unit,this.play});

  final Word word;
  final Unit unit;
  final Function play;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Học',style: TextStyle(fontSize: 20),)),

      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children:<Widget>[
            Center(
                child:Image.network(
                  '$baseURL/image/${word.image}',
                  height: 160,
                  width: 160,
                  scale: 0.6,
                )
            ),
            GestureDetector(
              onTap: (){
                play(word.sound);

              },
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(word.name + " ",style: TextStyle(color: Colors.red,fontSize: 20),),
                    Icon(
                      Icons.volume_up,
                      color: Colors.green,
                      size: 28.0,
                    ),
                  ]
              ),

            ),
            Padding(
              padding: EdgeInsets.all(2.5),
              child: Text(word.translated_name,style: TextStyle(fontSize: 18,color: Colors.blue),),
            ),
            Padding(
              padding: EdgeInsets.all(2.5),
              child: Text(word.description,style: TextStyle(fontSize: 20,),),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: OutlineButton(
                      onPressed:  (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_forward),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),

                    ),
                  )

                ]
            ),

          ]
      ),
    );
  }
}