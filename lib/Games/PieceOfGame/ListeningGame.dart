import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Components/WordComponent/WordDetailPage.dart';
import 'package:hoclieu_clone_0_4/Constant/APIConstant.dart';
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
  final FirebaseUser user;

  ListeningGame({Key key,this.listWords,this.gameChooser,this.currentFalse,this.currentTrue,this.unit,this.learnedMap,this.user}) : super(key: key);

  @override
  _ListeningGameState createState() => new _ListeningGameState();
}

class _ListeningGameState extends State<ListeningGame> {
  
  Word chosenWord;
  List<bool> buttonPress;
  int currentChosen ;
  bool isSure;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    var randomGenerator = new Random();
    var index = randomGenerator.nextInt(widget.listWords.length);
    isSure = false;
    currentChosen = -1;
    chosenWord = widget.listWords[index];
    buttonPress = new List<bool>.generate(widget.listWords.length, (int index) =>  false);
  }
  play(url) async {
    await audioPlayer.play(baseURL+'/audio/'+url);
  }
  onPress(int index){
    if(buttonPress[index] == false){
      setState(() {
        buttonPress[index] = true;
        if(currentChosen != -1) {
          buttonPress[currentChosen] = false;
        }
        currentChosen = index;
      });
    }
    play(widget.listWords[index].sound);
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
                  chosenWord.name,
                  style: TextStyle(fontSize: 22),
                )
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.listWords.length + 1,
              itemBuilder: (BuildContext context,int index){
                return (index == widget.listWords.length) ?
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),

                  onPressed: (){
                    setState(() {
                      isSure = !isSure;
                    });
                    var randomGenerator = new Random();
                    var randomGameIndex = randomGenerator.nextInt(4);

                    if(widget.listWords[currentChosen].id == chosenWord.id){

                      if(widget.user != null) {
                        var data = {
                          "email": widget.user.email,
                          "updateData": [
                            {
                              "word_id":chosenWord.id,
                              "listening":true,
                              "speaking":"",
                              "reading":"",
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
                    }else{
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => widget.gameChooser(randomGameIndex,widget.listWords,widget.unit)),//Todo:Change 1 to random
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WordDetailPage(unit: widget.unit,word: chosenWord,play: play),)
                      );
                    }
                  },
                  child: Text('Chốt'),
                  color: (isSure == false) ? Colors.green  : Colors.white,
                ):
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  onPressed: ()=> onPress(index),
                  child: Icon(Icons.volume_up),
//                  child: Text(widget.listWords[index].name),
                  color: (currentChosen == index) ? Colors.blue : Colors.white,
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

