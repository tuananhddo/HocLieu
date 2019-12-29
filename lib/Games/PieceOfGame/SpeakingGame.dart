import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hoclieu_clone_0_4/Components/WordComponent/WordDetailPage.dart';
import 'package:hoclieu_clone_0_4/Constant/APIConstant.dart';
import 'package:hoclieu_clone_0_4/fetchData/Unit.dart';
import 'package:hoclieu_clone_0_4/fetchData/Word.dart';
import 'package:speech_recognition/speech_recognition.dart';

class SpeakingGame extends StatefulWidget {

  final String title = 'SpeakingGame';
  final List<Word> listWords;
  final Function gameChooser;
  final Unit unit;
  final FirebaseUser user;

  SpeakingGame({Key key,this.listWords,this.gameChooser,this.unit,this.user}) : super(key: key);

  @override
  _SpeakingGameState createState() => new _SpeakingGameState();
}

class _SpeakingGameState extends State<SpeakingGame> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  bool x = false;
  Word chosenWord;
  AudioPlayer audioPlayer = AudioPlayer();

  play(url) async {
    await audioPlayer.play(baseURL+'/audio/'+url);
  }
  String resultText = "";
  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
    var randomGenerator = new Random();
    var index = randomGenerator.nextInt(widget.listWords.length);
    chosenWord = widget.listWords[index];

  }
  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
          (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
          () => setState(() => _isListening = true),
    );
    _speechRecognition.setRecognitionCompleteHandler(
          () => setState(() {
            var randomGenerator = new Random();
            var randomGameIndex = randomGenerator.nextInt(4);

            if(resultText == chosenWord.name){


              if(widget.user != null) {
                var data = {
                  "email": widget.user.email,
                  "updateData": [
                    {
                      "word_id":chosenWord.id,
                      "listening":"",
                      "speaking":true,
                      "reading":"",
                      "writing":""
                    }
                  ]
                };
                updateLearned(baseURL, data);
              }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => widget.gameChooser(randomGameIndex,widget.listWords,widget.unit)),
                );
              }else{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      widget.gameChooser(randomGameIndex, widget.listWords,widget.unit)),
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        WordDetailPage(
                            unit: widget.unit, word: chosenWord, play: play),)
                );
              }
              _isListening = false;
          }),
    );
    _speechRecognition.setRecognitionResultHandler(
          (String speech) {
            setState((){
              resultText = speech;

            }
            );
          },
    );
//    _speechRecognition.setRecognitionCompleteHandler(
//          () => setState(() => _isListening = false),
//    );
    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                chosenWord.name,
                style: TextStyle(color: Colors.green,fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(Icons.mic),
                  heroTag: "x1",
                  onPressed: () {
                    if (_isAvailable && !_isListening)
                      _speechRecognition
                          .listen(locale: "fr_FR");
                  },
                  backgroundColor: Colors.pink,
                ),
                FloatingActionButton(
                  child: Icon(Icons.stop),
                  heroTag: "x2",
                  mini: true,
                  backgroundColor: Colors.deepPurple,
                  onPressed: () {
                    if (_isListening)
                      _speechRecognition.stop().then(
                            (result) => print("MSJHVBJBDJBJKDSBJHBSDJHBDJSHBDSJHBSJHBSJDHBJSHDB"),
                      );
                  },
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.cyanAccent[100],
                borderRadius: BorderRadius.circular(6.0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: Text(
                resultText,
                style: TextStyle(fontSize: 24.0),
              ),
            )
          ],
        ),

      ),
    );
  }
}

