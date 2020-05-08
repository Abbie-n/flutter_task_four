import 'package:flutter/material.dart';
import 'homeview.dart';

//Page after quiz is over
class QuizOver extends StatefulWidget {
  final scoreCounter;
  QuizOver(this.scoreCounter);

  @override
  _QuizOverState createState() => _QuizOverState();
}

class _QuizOverState extends State<QuizOver> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return null;
      },
      child: Scaffold(
          backgroundColor: Color(0xff6e41a8),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 270, bottom: 10),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeView()));
                    },
                    child: Text(
                      'Home',
                      style: TextStyle(color: Color(0xff6e41a8)),
                    ),
                    color: Color(0xffefd705),
                    splashColor: Colors.white24,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
                  child: Center(
                    child: Text(
                      'Quiz Over!!!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Color(0xffefd705),
                        borderRadius: BorderRadius.circular(15)),
                    child: feedback())
              ],
            ),
          )),
    );
  }

//widget to give feedback at the end of quiz
  Widget feedback() {
    if (widget.scoreCounter <= 2) {
      return Center(
          child: Text(
              'Nice effort! \n\n' +
                  'You Got ' +
                  widget.scoreCounter.toString() +
                  ' / 5',
              style: TextStyle(color: Color(0xff6e41a8), fontSize: 30)));
    } else if (widget.scoreCounter <= 4) {
      return Center(
          child: Text(
              'You are doing well! \n\n' +
                  'You Got ' +
                  widget.scoreCounter.toString() +
                  ' / 5',
              style: TextStyle(color: Color(0xff6e41a8), fontSize: 30)));
    } else if (widget.scoreCounter == 5) {
      return Center(
          child: Text(
              'Boss! \n\n' +
                  'You Got ' +
                  widget.scoreCounter.toString() +
                  ' / 5',
              style: TextStyle(color: Color(0xff6e41a8), fontSize: 30)));
    } else {
      return Text("Didn't work");
    }
  }
}
