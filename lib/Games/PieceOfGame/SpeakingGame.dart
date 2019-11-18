import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/fetchData/Word.dart';

class SpeakingGame extends StatefulWidget {

  final String title = 'SpeakingGame';
  final List<Word> listWords;

  SpeakingGame({Key key,this.listWords}) : super(key: key);

  @override
  _SpeakingGameState createState() => new _SpeakingGameState();
}

class _SpeakingGameState extends State<SpeakingGame> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(),
    );
  }
}

