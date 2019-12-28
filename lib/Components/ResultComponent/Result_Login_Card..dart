import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Components/WordComponent/WordHeader..dart';
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
  void initState() {
    super.initState();
    learnedWords = fetchLearnedWords(baseURL, widget.user.email);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WordHeader(unit: Unit.blankUnit(),),
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
                          builder: (context, word) {
                            if(word.hasData){
                              var listening = snapshot.data[index].listening;
                              var speaking = snapshot.data[index].speaking;
                              var reading = snapshot.data[index].reading;
                              var writing = snapshot.data[index].writing;

                              return WordRow(
                                word : word.data,play: (nothing){},id:word.data.id,
                                unit: new Unit.emptyUnit(),readOnly: true,
                                learnedSkill: [listening,speaking,reading,writing],);
                            }
                            else{return CircularProgressIndicator();}
                          },

                    );
                }
              );
            } else {
              return Center(
                child: Text(
                  "",
                ),
              );
            }
            // By default, show a loading spinner.
//            return CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}