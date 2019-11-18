import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Constant/APIConstant.dart';
import 'package:hoclieu_clone_0_4/fetchData/Unit.dart';
import 'package:hoclieu_clone_0_4/fetchData/Word.dart';

import 'BottomButton.dart';

class AllWordPopUp extends StatefulWidget {

  final Unit unit;
  final Future<List<Word>> words;
  final Function(String) play;
  final Widget playScreen;
  AllWordPopUp({this.unit, this.words,this.play,this.playScreen});
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
        body: Center(
          child: FutureBuilder<List<Word>>(
            future: widget.words,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PageView.builder(
                    controller: _pageController,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context,index){
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children:<Widget>[
                            Center(
                                child:Image.network(
                                  '$baseURL/image/${snapshot.data[index].image}',
                                  height: 160,
                                  width: 160,
                                  scale: 0.6,
                                )
                            ),
                            GestureDetector(
                              onTap: (){
                                widget.play(snapshot.data[index].sound);

                              },
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(snapshot.data[index].name + " ",style: TextStyle(color: Colors.red,fontSize: 20),),
                                    Icon(
                                      Icons.volume_up,
                                      color: Colors.green,
                                      size: 28.0,
                                    ),
                                  ]
                              ),

                            ),
                            Text(snapshot.data[index].translated_name,style: TextStyle(fontSize: 18),),
                            Text(snapshot.data[index].description,style: TextStyle(fontSize: 20,),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: <Widget>[
                                OutlineButton(
                                  onPressed: index == 0 ? null : (){
                                    _pageController.animateToPage(index-1, duration:  const Duration(milliseconds: 400), curve: Curves.easeInOut,);

                                  } ,
                                  child: Icon(Icons.arrow_back),
                                ),
                                index == snapshot.data.length - 1 ?
                                BottomButton(title: 'Play',height: 60,width: 140,color: Colors.blue,icon: Icons.videogame_asset,renderringWidget: widget.playScreen,):
                                OutlineButton(
                                  onPressed: (){
                                    _pageController.animateToPage(index+1, duration:  const Duration(milliseconds: 400), curve: Curves.easeInOut,);
                                  },
                                  child: Icon(Icons.arrow_forward),
                                ),

                      ],
                            ),

                          ]
                      );          }
                );

              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: <Widget>[
//              BottomButton(title: 'HỌC',height: 60,width: 140,color: Colors.green,icon: Icons.chrome_reader_mode),
            ],
          ),
        ),


    );
  }
}