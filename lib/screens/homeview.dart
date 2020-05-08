import 'package:flutter/material.dart';
import '../screens/quizpage.dart';

//Landing Page
class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6e41a8),
      body: Container(
        margin: EdgeInsets.only(top: 180),
        //padding: const EdgeInsets.only(top: 200, left: 65),
        child: Column(children: <Widget>[
          Center(
            child: Text(
              'Quizathon',
              style: TextStyle(
                fontSize: 45,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 90),
          RaisedButton(
            color: Color(0xffefd705),
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
                  top: 40, left: 70, right: 70, bottom: 40),
              child: Text(
                'Start Quiz',
                style: TextStyle(
                    color: Color(0xff6e41a8),
                    fontStyle: FontStyle.italic,
                    fontSize: 20),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
