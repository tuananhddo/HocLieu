import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<List<Unit>> fetchUnits(baseURL,bookId) async {
  final response = await http.get('$baseURL/unit/$bookId');
  if (response.statusCode == 200) {
    List l = json.decode(response.body) as List;
    List<Unit> units = l.map((model)=> Unit.fromJson(model)).toList();
    return units;
  } else {
    throw Exception('Failed to load Units');
  }
}
class Unit {
  int id;
  String unit_name;
  int unit_number;

  Unit({this.id, this.unit_name, this.unit_number});

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
        id : json['id'],
        unit_name : json['unit_name'],
        unit_number : json['unit_number']
    );
  }
}