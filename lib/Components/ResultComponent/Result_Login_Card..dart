import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Constant/APIConstant.dart';
import 'package:hoclieu_clone_0_4/fetchData/LearnedWord.dart';
import 'package:hoclieu_clone_0_4/fetchData/Word.dart';

class Result_Login_Card extends StatefulWidget {

  final FirebaseUser user;
  Result_Login_Card({Key key,this.user})
      : super(key: key);

  @override
  Result_Login_CardState createState() => Result_Login_CardState();
}

class Result_Login_CardState extends State<Result_Login_Card> {
  Future<List<LearnedWord>> learnedWords;
  Future<List<Word>> words;

  void initState() {
    super.initState();
    learnedWords = fetchLearnedWords(baseURL, widget.user.email);
    words = fetchWords(baseURL,1);

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('This time'),
        FutureBuilder<List<Word>>(
          future: words,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context,int index) {
                  return Column(
                      children: <Widget>[
                        Text('ABC'),
                        FutureBuilder<List<LearnedWord>>(
                          future: learnedWords,
                          builder: (context, snapshot) {
                            if(snapshot.hasData){
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context,int index) {
                                    return Text(snapshot.data[index].listening.toString());
                                  }
                              );
                            }
                            else{return Text('Loading./.');}
                          },
                        )
                      ]
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