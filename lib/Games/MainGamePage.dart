import 'dart:math';
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
  MainGamePage({Key key,this.words,this.unit}) : super(key: key);

  @override
  _MainGamePageState createState() => new _MainGamePageState();
}

class _MainGamePageState extends State<MainGamePage> {
  bool allWordLearned = false;
  @override
  void initState() {
    super.initState();
  }
  Widget gameChooser(int randomGameIndex,wordData){
    switch(randomGameIndex){
      case 1:
        return ListeningGame(listWords: wordData,gameChooser: gameChooser,);
      case 2:
        return ReadingGame(listWords: wordData,);
      case 3:
        return SpeakingGame(listWords: wordData,);
      case 4:
        return WritingGame(listWords: wordData,);
      default:
        return Text('Chooser Error');
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
              switch(1){
                case 1:
                  return ListeningGame(listWords: snapshot.data,gameChooser: gameChooser,currentFalse: 0,currentTrue: 0,unit: widget.unit,learnedMap: learnedMap,);
                case 2:
                  return ReadingGame(listWords: snapshot.data,);
                case 3:
                  return SpeakingGame(listWords: snapshot.data,);
                case 4:
                  return WritingGame(listWords: snapshot.data,);
              }
            }
            // By default, show a loading spinner.
//            return CircularProgressIndicator();
          return Text('Loading..');
          },
        );
  }
}

