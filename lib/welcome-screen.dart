import 'package:flutter/material.dart';
import 'package:flutter_api_train/list-data-screen.dart';

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
          ],
        ),
      ),
    );
  }
}
