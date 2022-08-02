import 'dart:html';
import 'package:flutter_api_train/model/public_api.dart';
import 'package:flutter/material.dart';

class detailScreen extends StatelessWidget {
  // const detailScreen({Key? key}) : super(key: key);
  final Post data;
  const detailScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${data.id}')),
        body: Column(
          children: [
            Center(
              child: Text('${data.title}'),
            ),
            Center(
              child: Text('${data.body}'),
            ),
          ],
        ));
  }
}
