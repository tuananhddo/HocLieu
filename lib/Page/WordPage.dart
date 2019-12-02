import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Components/WordComponent/WordHeader..dart';
import 'package:hoclieu_clone_0_4/Games/MainGamePage.dart';
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
  Widget mainGame;
  @override
  void initState() {
    super.initState();
    words = fetchWords(baseURL,widget.unit.id);
    mainGame = new MainGamePage(words: words,unit: widget.unit,play: play);
    summaryLearn = new AllWordPopUp(words: words,unit: widget.unit,play: play,playScreen: mainGame,);
  }
  play(url) async {
    int result = await audioPlayer.play(baseURL+'/audio/'+url);
    if (result == 1) {
      // success
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Word")),
        body: Center(
          child: FutureBuilder<List<Word>>(
            future: words,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length + 2,
                  itemBuilder: (BuildContext context,int index){
                    if(index == 0){
                      return WordHeader(unit: widget.unit,);
                    }
                    if(index == snapshot.data.length + 1){
                      return ListTile(
                        title: Text('Đánh dấu vào ô của từ để không luyện kỹ năng của cột tương ứng',style: TextStyle(wordSpacing: 8),),
                      );
                    }
                    return WordRow(word : snapshot.data[index - 1],play: play,id:index,unit: widget.unit,learnedSkill: [],readOnly: false,);
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
              BottomButton(title: 'HỌC',height: 60,width: 140,color: Colors.green,icon: Icons.chrome_reader_mode,renderringWidget: summaryLearn,),
              BottomButton(title: 'Play',height: 60,width: 140,color: Colors.blue,icon: Icons.videogame_asset,renderringWidget: mainGame,),
              BottomButton(height: 60,width: 80,color: Colors.yellow,icon: Icons.games,renderringWidget: summaryLearn,)


            ],
          ),
        ),

        drawer: navigationDrawer(context)

    );
  }
}

