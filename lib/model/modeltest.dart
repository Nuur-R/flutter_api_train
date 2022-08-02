import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<AlbumABC> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/12'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return AlbumABC.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class AlbumABC {
  final int userId;
  final int id;
  final String title;

  const AlbumABC({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumABC.fromJson(Map<String, dynamic> json) {
    return AlbumABC(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
