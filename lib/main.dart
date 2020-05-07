import 'package:flutter/material.dart';
import 'package:quiz_app/screens/homeview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: HomeView(),
    );
  }
}
