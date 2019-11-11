import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Components/WordComponent/BottomButton.dart';
import 'package:hoclieu_clone_0_4/Components/WordComponent/AllWordPopUp.dart';
import 'package:hoclieu_clone_0_4/Components/WordComponent/WordRow.dart';
import 'package:hoclieu_clone_0_4/Constant/APIConstant.dart';
import 'package:hoclieu_clone_0_4/fetchData/Unit.dart';
import 'NavigationDrawer.dart';
import '../fetchData/Word.dart';
class WordsPage extends StatefulWidget {

  final String title = 'Word Page';
  final Unit unit;
  WordsPage({Key key,this.unit}) : super(key: key);

  @override
  _WordPageState createState() => new _WordPageState();
}
class _WordPageState extends State<WordsPage>{
  Future<List<Word>> words;

  AudioPlayer audioPlayer = AudioPlayer();

  Widget summaryLearn ;
  @override
  void initState() {
    super.initState();
    words = fetchWords(baseURL,widget.unit.id);
    words.then((data){
      summaryLearn = new AllWordPopUp(words: data,unit: widget.unit,);
    });
  }
  play(url) async {
    int result = await audioPlayer.play(baseURL+'/audio/'+url);
    if (result == 1) {
      // success
    }
  }
  @override
  Widget build(BuildContext context) {
//    List<Widget> checkboxes = [];
//    _colors.map((color)=> debugPrint(color.toString()));
    return Scaffold(
        appBar: AppBar(title: Text("Word")),
        body: Center(
          child: FutureBuilder<List<Word>>(
            future: words,
            builder: (context, snapshot) {
              double iconSpace = 40;
              if (snapshot.hasData) {


                return ListView.builder(
                  itemCount: snapshot.data.length + 2,
                  itemBuilder: (BuildContext context,int index){
                    if(index == 0){
                      return Column(
                          children: <Widget>[
                            ListTile(
                              title: Row(children: <Widget>[
                                Text('Unit ' + widget.unit.unit_number.toString() + '\t',style: TextStyle(color: Colors.blue),),
                                Text(widget.unit.unit_name),
                              ]),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                SizedBox(
                                  width: iconSpace,
                                  child:Icon(Icons.headset,color: Colors.yellow,),
                                ),
                                SizedBox(
                                  width: iconSpace,
                                  child:Icon(Icons.mic,color: Colors.blue,),
                                ),
                                SizedBox(
                                  width: iconSpace,
                                  child:Icon(Icons.mode_edit,color: Colors.green,),
                                ),
                                SizedBox(
                                  width: iconSpace,
                                  child:Icon(Icons.chrome_reader_mode,color: Colors.red,),
                                ),
                                SizedBox(
                                  width: iconSpace,
                                  child:Icon(Icons.done_all,color: Colors.grey,),
                                ),

                              ],
                            ),
                            Divider()
                          ]
                      );

                    }
                    if(index == snapshot.data.length + 1){
                      return ListTile(
                        title: Text('Đánh dấu vào ô của từ để không luyện kỹ năng của cột tương ứng',style: TextStyle(wordSpacing: 8),),
                      );
                    }
                    return WordRow(word : snapshot.data[index - 1],play: play,id:index,unit: widget.unit,);
                  },

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
              BottomButton(title: 'HỌC',height: 60,width: 140,color: Colors.green,icon: Icons.chrome_reader_mode),
              BottomButton(title: 'Play',height: 60,width: 140,color: Colors.blue,icon: Icons.videogame_asset),
              BottomButton(height: 60,width: 80,color: Colors.yellow,icon: Icons.games)


            ],
          ),
        ),

        drawer: navigationDrawer(context)

    );
  }
}

