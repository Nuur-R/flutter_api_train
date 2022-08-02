import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  // final String name;
  final int userId;
  final int id;
  final String title;
  final String body;

  const User({
    // required this.name,
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  static User fromJson(Map<String, dynamic> json) => User(
        // name: json['title'],
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}

class UserApi {
  static Future<List<User>> getUserSuggestions(String query) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List users = json.decode(response.body);

      return users.map((json) => User.fromJson(json)).where((user) {
        final nameLower = user.title.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
