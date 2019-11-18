import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/fetchData/Unit.dart';
import 'package:hoclieu_clone_0_4/fetchData/Word.dart';

class ListeningGame extends StatefulWidget {

  final String title = 'ListeningGame';
  final Unit unit;
  final List<Word> listWords;
  final Function gameChooser;
  final currentTrue;
  final currentFalse;
  final Map learnedMap;
  ListeningGame({Key key,this.listWords,this.gameChooser,this.currentFalse,this.currentTrue,this.unit,this.learnedMap}) : super(key: key);

  @override
  _ListeningGameState createState() => new _ListeningGameState();
}

class _ListeningGameState extends State<ListeningGame> {
  
  Word chosenWord;
  bool buttonPress;
  @override
  void initState() {
    super.initState();
    var randomGenerator = new Random();
    var index = randomGenerator.nextInt(widget.listWords.length);
    chosenWord = widget.listWords[index];
    buttonPress = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(chosenWord.name),
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.listWords.length + 1,
              itemBuilder: (BuildContext context,int index){
                return (index == widget.listWords.length) ?
                RaisedButton(
                  onPressed: (){
                    setState(() {
                      buttonPress = !buttonPress;
                    });
                  },
                  child: Text('Chốt'),
                  color: (buttonPress == false) ? Colors.red  : Colors.white,
                ):
                RaisedButton(
                  onPressed: (){
                    setState(() {
                      buttonPress = !buttonPress;
                    });
                  },
                  child: Icon(Icons.volume_up),
                  color: Colors.blue,
                );
              }
            ),

          ],
        ),
//        child: widget.gameChooser(2,widget.listWords),
      ),
    );
  }
}

