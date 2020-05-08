

import 'package:flutter/material.dart';

import 'homeview.dart';

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
                  width: 250,
                  decoration: BoxDecoration(
                      color: Color(0xffefd705),
                      borderRadius: BorderRadius.circular(15)),
                  child: feedback())
              ],
            ),
          )),
    );
  }

  Widget feedback() {
      if (widget.scoreCounter <= 2) {
         return Center(
            child: Text('Nice effort! \n\n' + 'You Got ' + widget.scoreCounter.toString() + '!',
            style: TextStyle(color: Color(0xff6e41a8), fontSize: 30)));
      } else if (widget.scoreCounter <= 4) {
         return Center(
            child: Text(
                'You are doing well! \n\n' + 'You Got ' + widget.scoreCounter.toString() + '!',
                style: TextStyle(color: Color(0xff6e41a8), fontSize: 30)));
      } else if (widget.scoreCounter == 5) {
         return Center(
            child: Text(
                'Boss! \n\n' + 'You Got ' + widget.scoreCounter.toString() + '!',
                style: TextStyle(color: Color(0xff6e41a8), fontSize: 30)));
      } else {
         return Text("Didn't work");
      }
   
  }
}


// class FeedbackPage extends StatelessWidget {
//   final scoreCounter;
//   FeedbackPage(this.scoreCounter);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget> [
//           feedback()
//         ]
//       ),
//     );
//   }
//   Widget feedback() {
//       if (scoreCounter <= 2) {
//          return Center(
//             child: Text('Nice effort! \n' + 'You Got ' + scoreCounter.toString(),
//             style: TextStyle(color: Color(0xffefd705), fontSize: 20)));
//       } else if (scoreCounter <= 4) {
//          return Center(
//             child: Text(
//                 'You are doing well! \n' + 'You Got ' + scoreCounter.toString(),
//                 style: TextStyle(color: Color(0xffefd705), fontSize: 20)));
//       } else if (scoreCounter == 5) {
//          return Center(
//             child: Text(
//                 'Boss! \n' + 'You Got ' + scoreCounter.toString(),
//                 style: TextStyle(color: Color(0xffefd705), fontSize: 20)));
//       } else {
//          return Text("Didn't work");
//       }
   
//   }
// }

// Widget feedback() {
//     return Center(
//             child: widget.scoreCounter <= 2 ? Text('Nice effort! \n' + 'You Got ' + widget.scoreCounter.toString(), style: TextStyle(color: Color(0xff6e41a8), fontSize: 20)) : (widget.scoreCounter <= 4) ? Text(
//                 'You are doing well! \n' + 'You Got ' + widget.scoreCounter.toString(),
//                 style: TextStyle(color: Color(0xff6e41a8), fontSize: 20)) : (widget.scoreCounter == 5) ? Text(
//                 'Boss! \n' + 'You Got ' + widget.scoreCounter.toString(),
//                 style: TextStyle(color: Color(0xff6e41a8), fontSize: 20))
//             : Text('No Score'));
     
// }

// FlatButton(
//                   onPressed: () {

//                     // Navigator.push(context,
//                     //       MaterialPageRoute(builder: (context) => FeedbackPage(widget.scoreCounter)));
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                         top: 10, bottom: 10, left: 40, right: 40),
//                     child: Text(
//                       'Reveal Score',
//                       style: TextStyle(color: Color(0xff6e41a8), fontSize: 20),
//                     ),
//                   ),
//                   color: Color(0xffefd705),
//                   splashColor: Colors.white24,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),