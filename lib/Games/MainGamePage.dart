import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Games/PieceOfGame/ListeningGame.dart';
import 'package:hoclieu_clone_0_4/Games/PieceOfGame/ReadingGame.dart';
import 'package:hoclieu_clone_0_4/Games/PieceOfGame/SpeakingGame.dart';
import 'package:hoclieu_clone_0_4/Games/PieceOfGame/WritingGame.dart';
import 'package:hoclieu_clone_0_4/fetchData/Unit.dart';
import 'package:hoclieu_clone_0_4/fetchData/Word.dart';

class MainGamePage extends StatefulWidget {

  final String title = 'MainGamePage';
  final Future<List<Word>> words;
  final numberOfPieceGame = 4;
  final Unit unit;
  final Function play;
  final FirebaseUser user;

  MainGamePage({Key key,this.words,this.unit,this.play,this.user}) : super(key: key);

  @override
  _MainGamePageState createState() => new _MainGamePageState();
}

class _MainGamePageState extends State<MainGamePage> {
  bool allWordLearned = false;
  @override
  void initState() {
    super.initState();
  }
  Widget gameChooser(int randomGameIndex,wordData,unit){
    switch(randomGameIndex){
      case 1:
        return ListeningGame(listWords: wordData,gameChooser: gameChooser,unit: unit,user:widget.user);
      case 2:
        return ReadingGame(listWords: wordData,gameChooser: gameChooser,unit: unit,user: widget.user,);
      case 3:
        return SpeakingGame(listWords: wordData,gameChooser: gameChooser,unit:unit,user: widget.user);
      case 4:
        return ListeningGame(listWords: wordData,gameChooser: gameChooser,unit: unit,user:widget.user);
      default:
        return ListeningGame(listWords: wordData,gameChooser: gameChooser,unit: unit,user:widget.user);
    }
  }

  @override
  Widget build(BuildContext context) {

    var randomGenerator = new Random();
    var learnedMap = new Map();
    return FutureBuilder<List<Word>>(
          future: widget.words,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              int randomGameIndex = randomGenerator.nextInt(widget.numberOfPieceGame);
              switch(randomGameIndex){//TODO change 1 to random
                case 1:
                  return ListeningGame(listWords: snapshot.data,gameChooser: gameChooser,currentFalse: 0,currentTrue: 0,unit: widget.unit,learnedMap: learnedMap,user: widget.user,);
                case 2:
                  return ReadingGame(listWords: snapshot.data,gameChooser: gameChooser,currentFalse: 0,currentTrue: 0,unit: widget.unit,learnedMap: learnedMap,user: widget.user,);
                case 3:
                  return SpeakingGame(listWords: snapshot.data,user: widget.user,);
                case 4:
//                  return WritingGame(listWords: snapshot.data,user: widget.user);
                  return SpeakingGame(listWords: snapshot.data,user: widget.user,);

              }
            }
            // By default, show a loading spinner.
            return CircularProgressIndicator();
//          return Text('Loading..');
          },
        );
  }
}

