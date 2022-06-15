import 'package:flutter/material.dart';
import 'package:gifs_week8/screens/home_screen.dart';
import 'dart:async';
import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Giphy';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Colors.green,
        ),
        body: HomeScreen(),
      ),
    );
  }
}
