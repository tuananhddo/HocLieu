import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/fetchData/Word.dart';

class ReadingGame extends StatefulWidget {

  final String title = 'ReadingGame';
  final List<Word> listWords;

  ReadingGame({Key key,this.listWords}) : super(key: key);

  @override
  _ReadingGameState createState() => new _ReadingGameState();
}

class _ReadingGameState extends State<ReadingGame> {

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

