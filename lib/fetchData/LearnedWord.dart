import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<List<LearnedWord>> fetchLearnedWords(baseURL,email) async {
  final response = await http.get('$baseURL/user/learned/$email');
  if (response.statusCode == 200) {
    List l = json.decode(response.body) as List;
    List<LearnedWord> learnedWords = l.map((model)=> LearnedWord.fromJson(model)).toList();
    return learnedWords;
  } else {
    throw Exception('Failed to load LearnedWords');
  }
}
class LearnedWord {
  int userId;
  int wordId;
  bool listening;
  bool speaking;
  bool reading;
  bool writing;

  LearnedWord({ this.listening, this.reading,this.speaking,this.writing,this.userId,this.wordId});

  factory LearnedWord.fromJson(Map<String, dynamic> json) {
    return LearnedWord(
        userId : json['user_id'],
        wordId : json['word_id'],
        listening : json['listening'],
        speaking : json['speaking'],
        reading : json['reading'],
        writing : json['writing'],

    );
  }
  Map<String, dynamic> toJson() =>
      {
        'id':userId,
      };
}