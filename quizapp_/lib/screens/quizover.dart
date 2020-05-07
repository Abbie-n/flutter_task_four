import 'package:flutter/material.dart';

class QuizOver extends StatelessWidget {
  final scoreCounter;
  QuizOver(this.scoreCounter);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text('Quiz Over'),
        // ),
        backgroundColor: Colors.blue[900],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Quiz Over!!!!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Padding(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
                child: Text(
                  'Your total score is: ' + scoreCounter.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.blue[400],
              splashColor: Colors.white24,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ));
  }
}
