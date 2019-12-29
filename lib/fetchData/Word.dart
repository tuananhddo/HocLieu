import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<List<Word>> fetchWords(baseURL,unitId) async {
  final response = await http.get('$baseURL/word/$unitId');
  if (response.statusCode == 200) {
    List l = json.decode(response.body) as List;
    List<Word> words = l.map((model)=> Word.fromJson(model)).toList();
    return words;
  } else {
    throw Exception('Failed to load Words');
  }
}
Future<Word> fetchWordById(baseURL,id) async {
  final response = await http.get('$baseURL/word/id/$id');
  if (response.statusCode == 200) {
    Map wordMap = json.decode(response.body);
    var word = Word.fromJson(wordMap);
    return word;
  } else {
    throw Exception('Failed to load word by ID');
  }
}
Future<void> updateLearned(baseURL,data) async {
  var bodyEncoded = json.encode(data);
  final response = await http.post('$baseURL/user/learned/update',body: bodyEncoded);
  if (response.statusCode != 200) {
    throw Exception('Failed to load data');
  }
}
class Word {
  int id;
  String name;
  String translated_name;
  String description;
  String image;
  String sound;


  Word({this.id, this.name, this.translated_name,this.description,this.image,this.sound});

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
        id : json['id'],
      name : json['name'],
      translated_name : json['translated_name'],
      description : json['description'],
      image : json['image'],
      sound : json['sound'],
    );
  }
}