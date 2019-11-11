import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/fetchData/Unit.dart';
import 'package:hoclieu_clone_0_4/fetchData/Word.dart';

import 'BottomButton.dart';

class AllWordPopUp extends StatefulWidget {

  final Unit unit;
  final List<Word> words;

  AllWordPopUp({this.unit, this.words});
  @override
  _AllWordPopUpState createState() => new _AllWordPopUpState();

}
class _AllWordPopUpState extends State<AllWordPopUp>{

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Word")),
        body: PageView.builder(
          controller: _pageController,
          itemCount: widget.words.length,
          itemBuilder: (context,index){
            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:<Widget>[
//                  Center(
//                      child:Image.network(
//                        user.photoUrl,
//                        height: 160,
//                        width: 160,
//                        scale: 0.6,
//                      )
//                  ),
                  OutlineButton(
                    onPressed: (){
                    },
                    child: Text('Index  $index'),
                  )
                ]
            );          }
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: <Widget>[
              BottomButton(title: 'HỌC',height: 60,width: 140,color: Colors.green,icon: Icons.chrome_reader_mode),
            ],
          ),
        ),


    );
  }
}