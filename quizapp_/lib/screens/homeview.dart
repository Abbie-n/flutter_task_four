import 'package:flutter/material.dart';
import '../screens/quizpage.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 250),
            //padding: const EdgeInsets.only(top: 200, left: 65),
            child: Center(
              child: Text(
                'Welcome To My Awesome Quiz',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: RaisedButton(
              color: Colors.blue[400],
              splashColor: Colors.white24,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 40, left: 50, right: 50, bottom: 40),
                child: Text(
                  'Start Quiz',
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}