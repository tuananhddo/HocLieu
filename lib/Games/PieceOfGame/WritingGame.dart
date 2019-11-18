import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/fetchData/Word.dart';

class WritingGame extends StatefulWidget {

  final String title = 'WritingGame';
  final List<Word> listWords;

  WritingGame({Key key,this.listWords}) : super(key: key);

  @override
  _WritingGameState createState() => new _WritingGameState();
}

class _WritingGameState extends State<WritingGame> {

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

