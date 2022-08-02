import 'package:flutter/material.dart';
import 'package:flutter_api_train/list-data-screen.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_api_train/model/public_api.dart';
import 'package:flutter_api_train/model/modeltest.dart';
import 'package:flutter_api_train/detail-screen.dart';

Future<List<Post>> fetchPost() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Post>((json) => Post.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to App')),
      body: Center(
        child: Column(
          children: [
            Text("Welcome"),
            ElevatedButton(
              child: const Text('Open route'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PublicApiScreen()),
                );
              },
            ),
            TypeAheadField<User?>(
              hideSuggestionsOnKeyboardHide: false,
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: 'Search Username',
                ),
              ),
              suggestionsCallback: UserApi.getUserSuggestions,
              itemBuilder: (context, User? suggestion) {
                final user = suggestion!;

                return ListTile(
                  title: Text(user.title),
                );
              },
              noItemsFoundBuilder: (context) => Container(
                height: 100,
                child: Center(
                  child: Text(
                    'No Users Found.',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              onSuggestionSelected: (User? suggestion) {
                final user = suggestion!;

                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    content: Text('Selected user: ${user.title}'),
                  ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
