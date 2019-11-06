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
  String book_name;
  String thumbnail_image;

  Book({this.id, this.book_name, this.thumbnail_image});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id : json['id'],
        book_name : json['book_name'],
        thumbnail_image : json['thumbnail_image']
    );
  }
  Map<String, dynamic> toJson() =>
      {
        'id':id,
        'book_name': book_name,
        'thumbnail_image': thumbnail_image,
      };
}