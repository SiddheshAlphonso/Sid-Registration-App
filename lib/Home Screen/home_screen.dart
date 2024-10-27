import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notifications');
              },
              child: Text('Notifications'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              child: Text('Find Location'),
            ),
          ],
        ),
      ),
    );
  }
}
