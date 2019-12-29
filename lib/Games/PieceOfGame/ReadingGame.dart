import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Components/WordComponent/WordDetailPage.dart';
import 'package:hoclieu_clone_0_4/Constant/APIConstant.dart';
import 'package:hoclieu_clone_0_4/fetchData/Unit.dart';
import 'package:hoclieu_clone_0_4/fetchData/Word.dart';

class ReadingGame extends StatefulWidget {

  final String title = 'ReadingGame';
  final Unit unit;
  final List<Word> listWords;
  final Function gameChooser;
  final currentTrue;
  final currentFalse;
  final Map learnedMap;
  final FirebaseUser user;

  ReadingGame({Key key,this.listWords,this.gameChooser,this.currentFalse,this.currentTrue,this.unit,this.learnedMap,this.user}) : super(key: key);

  @override
  _ReadingGameState createState() => new _ReadingGameState();
}

class _ReadingGameState extends State<ReadingGame> {

  Word chosenWord;
  int currentChosen ;
  bool rightAns;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    var randomGenerator = new Random();
    var index = randomGenerator.nextInt(widget.listWords.length);
    rightAns = false;
    currentChosen = -1;
    chosenWord = widget.listWords[index];
  }
  play(url) async {
    await audioPlayer.play(baseURL+'/audio/'+url);
  }
  onPress(int index){
    var randomGenerator = new Random();
    var randomGameIndex = randomGenerator.nextInt(4);
      setState(() {
        currentChosen = index;
        if(widget.listWords[index].id == chosenWord.id){
          rightAns = true;

          if(widget.user != null) {
            var data = {
              "email": widget.user.email,
              "updateData": [
                {
                  "word_id":chosenWord.id,
                  "listening":"",
                  "speaking":"",
                  "reading":true,
                  "writing":""
                }
              ]
            };
            updateLearned(baseURL, data);
          }
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.gameChooser(randomGameIndex,widget.listWords,widget.unit)),//Todo:Change 1 to random
          );
        }else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                widget.gameChooser(randomGameIndex, widget.listWords,widget.unit)), //Todo:Change 1 to random
          );
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  WordDetailPage(
                      unit: widget.unit, word: chosenWord, play: play),)
          );
        }

      });

//    play(widget.listWords[index].sound);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                  chosenWord.description,
                style: TextStyle(fontSize: 22),
              )
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.listWords.length,
                itemBuilder: (BuildContext context,int index){
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      onPressed: ()=> onPress(index),
                      child: Text(widget.listWords[index].name),
                      color: (currentChosen == index) ? (rightAns == true ? Colors.blue : Colors.red) : Colors.white,
                    ),
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

