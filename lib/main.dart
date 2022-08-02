import 'package:flutter/material.dart';
import 'package:flutter_api_train/list-data-screen.dart';
import 'package:flutter_api_train/model/public_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Makerindo Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PublicApiScreen(),
    );
  }
}
