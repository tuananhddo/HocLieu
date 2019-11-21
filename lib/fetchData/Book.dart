import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<List<Book>> fetchBooks(baseURL) async {
  final response = await http.get('$baseURL/book');
  if (response.statusCode == 200) {
    List l = json.decode(response.body) as List;
    List<Book> books = l.map((model)=> Book.fromJson(model)).toList();
    return books;
  } else {
    throw Exception('Failed to load books');
  }
}

class Book {
  int id;
  String bookName;
  String thumbnailImage;

  Book({this.id, this.bookName, this.thumbnailImage});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id : json['id'],
        bookName : json['book_name'],
        thumbnailImage : json['thumbnail_image']
    );
  }
  Map<String, dynamic> toJson() =>
      {
        'id':id,
        'book_name': bookName,
        'thumbnail_image': thumbnailImage,
      };
}