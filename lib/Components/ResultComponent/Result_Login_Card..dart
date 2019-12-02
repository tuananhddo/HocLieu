import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Components/WordComponent/WordRow.dart';
import 'package:hoclieu_clone_0_4/Constant/APIConstant.dart';
import 'package:hoclieu_clone_0_4/fetchData/LearnedWord.dart';
import 'package:hoclieu_clone_0_4/fetchData/Unit.dart';
import 'package:hoclieu_clone_0_4/fetchData/Word.dart';

class ResultLoginCard extends StatefulWidget {

  final FirebaseUser user;
  ResultLoginCard({Key key,this.user})
      : super(key: key);

  @override
  ResultLoginCardState createState() => ResultLoginCardState();
}

class ResultLoginCardState extends State<ResultLoginCard> {
  Future<List<LearnedWord>> learnedWords;
  Future<Word> words;
  AudioPlayer audioPlayer = AudioPlayer();
  play(url) async {
    int result = await audioPlayer.play(baseURL+'/audio/'+url);
    if (result == 1) {
      // success
    }
  }
  void initState() {
    super.initState();
    learnedWords = fetchLearnedWords(baseURL, widget.user.email);
    words = fetchWordById(baseURL,1);

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('KQHT'),
        FutureBuilder<List<LearnedWord>>(
          future: learnedWords,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context,int index) {
                  return FutureBuilder<Word>(
                          future: fetchWordById(baseURL,snapshot.data[index].wordId),
                          builder: (context, snapshot) {
                            if(snapshot.hasData){
                              return WordRow(word : snapshot.data,play: play,id:snapshot.data.id,unit: new Unit.emptyUnit(),readOnly: true,);
                            }
                            else{return Text('Loading./.');}
                          },

                    );
                }
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}