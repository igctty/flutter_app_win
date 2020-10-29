import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'TODO List';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Text("List item 1"),
    );
  }
}

