import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'User Screen',
        style: TextStyle(fontSize: 30),
      ),),
    );
  }
}
