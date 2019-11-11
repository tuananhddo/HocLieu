import 'package:flutter/cupertino.dart';
import 'package:hoclieu_clone_0_4/fetchData/Unit.dart';
import 'package:hoclieu_clone_0_4/fetchData/Word.dart';

class WordDetailPage extends StatelessWidget {

  WordDetailPage({this.word,this.unit});

  final Word word;
  final Unit unit;
  @override
  Widget build(BuildContext context) {
    return Text('UnitDetailPage  ${word.name}  ${unit.unit_name}');
  }
}