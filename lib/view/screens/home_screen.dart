import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'HOME',
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
