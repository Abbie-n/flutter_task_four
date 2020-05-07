import 'package:flutter/material.dart';
import './quizover.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map> questions = [
    {
      'question': 'What is the name of the most awesome Human?',
      'options': ['Abbie', 'Bert', 'Both', 'None'],
      'answer': 'Abbie'
    },
    {
      'question': 'How is the name of the most awesome Human?',
      'options': ['Abbie', 'Bert', 'Both', 'None'],
      'answer': 'Bert'
    },
    {
      'question': 'Why is the name of the most awesome Human?',
      'options': ['Abbie', 'Bert', 'Both', 'None'],
      'answer': 'Both'
    },
    {
      'question': 'When is the name of the most awesome Human?',
      'options': ['Abbie', 'Bert', 'Both', 'None'],
      'answer': 'None'
    },
    {
      'question': 'Could be the name of the most awesome Human?',
      'options': ['Abbie', 'Bert', 'Both', 'None'],
      'answer': 'Abbie'
    },
  ];

  @override
  Widget build(BuildContext context) {
    List option = questions[questionsCounter]['options'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quiz Page'),
      ),
      backgroundColor: Colors.blue[900],
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Score: ' + scoreCounter.toString(),
                style: TextStyle(fontSize: 25, color: Colors.red),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: Text(
                      questions[questionsCounter]['question'],
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                firstOption(
                    text: option[0],
                    answer: questions[questionsCounter]['answer']),
                SizedBox(width: 30),
                secondOption(
                    text: option[1],
                    answer: questions[questionsCounter]['answer']),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                thirdOption(
                    text: option[2],
                    answer: questions[questionsCounter]['answer']),
                SizedBox(width: 30),
                fourthOption(
                    text: option[3],
                    answer: questions[questionsCounter]['answer']),
              ],
            ),
            SizedBox(height: 50),
            RaisedButton(
              color: Colors.blue[400],
              splashColor: Colors.white24,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                
          if (answerSelected = true) {
                next();
              }},
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 30, right: 30, bottom: 20),
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int scoreCounter = 0;
  int questionsCounter = 0;

  void next() {
    setState(
      () {
        
        if (questionsCounter < questions.length - 1) {
          questionsCounter++;
          answerSelected = false;
        } else if (questionsCounter == questions.length - 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizOver(scoreCounter),
            ),
          );
        } 
        else {
          questionsCounter += 0;
        }
      },
    );
  }

  answer(String value) {
    if (value == questions[questionsCounter]['answer']) {
      scoreCounter += 1;
    } else {
      scoreCounter += 0;
    }
  }

  bool answerSelected = false;
  Color firstColor = Colors.blue[200];
  Color secondColor = Colors.blue[200];
  Color thirdColor = Colors.blue[200];
  Color fourthColor = Colors.blue[200];

  setColor(String answer) {
    List options = questions[questionsCounter]['options'];

    setState(() {
      firstColor = Colors.blue[200];
      secondColor = Colors.blue[200];
      thirdColor = Colors.blue[200];
      fourthColor = Colors.blue[200];
    });

    for (var i = 0; i < options.length; i++) {
      if (options[i] == answer) {
        if (i == 0) {
          setState(() {
            firstColor = Colors.green;
          });
        } else if (i == 1) {
          setState(() {
            secondColor = Colors.green;
          });
        } else if (i == 2) {
          setState(() {
            thirdColor = Colors.green;
          });
        } else if (i == 3) {
          setState(() {
            fourthColor = Colors.green;
          });
        }
      }
    }
  }

  Widget firstOption({String text, String answer}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: FlatButton(
          onPressed: () {
            if (answerSelected == false) {
              setColor(answer);
              setState(() {
                answerSelected = true;
                firstColor = text == answer ? Colors.green : Colors.red;
                if (text == questions[questionsCounter]['answer']) {
                  scoreCounter += 1;
                }
              });
            }
          },
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
            child: Text(text),
          ),
          color: answerSelected == true ? firstColor : Colors.blue[200],
          splashColor: Colors.white24,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget secondOption({String text, String answer}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: FlatButton(
          onPressed: () {
            if (answerSelected == false) {
              setColor(answer);
              setState(() {
                answerSelected = true;
                secondColor = text == answer ? Colors.green : Colors.red;
                if (text == questions[questionsCounter]['answer']) {
                  scoreCounter += 1;
                }
              });
            }
          },
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
            child: Text(text),
          ),
          color: answerSelected == true ? secondColor : Colors.blue[200],
          splashColor: Colors.white24,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget thirdOption({String text, String answer}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: FlatButton(
          onPressed: () {
            if (answerSelected == false) {
              setColor(answer);
              setState(() {
                answerSelected = true;
                thirdColor = text == answer ? Colors.green : Colors.red;
                if (text == questions[questionsCounter]['answer']) {
                  scoreCounter += 1;
                }
              });
            }
          },
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
            child: Text(text),
          ),
          color: answerSelected == true ? thirdColor : Colors.blue[200],
          splashColor: Colors.white24,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget fourthOption({String text, String answer}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: FlatButton(
          onPressed: () {
            if (answerSelected == false) {
              setColor(answer);
              setState(() {
                answerSelected = true;
                fourthColor = text == answer ? Colors.green : Colors.red;
                if (text == questions[questionsCounter]['answer']) {
                  scoreCounter += 1;
                }
              });
            }
          },
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
            child: Text(text),
          ),
          color: answerSelected == true ? fourthColor : Colors.blue[200],
          splashColor: Colors.white24,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

//   Color initialColor = Colors.blue[400];
//   Color correct = Colors.green;
//   Color wrong = Colors.red;

//   void answer(String value) {
//     List options = questions[questionsCounter]['options'];

//     // if (value == questions[questionsCounter]['answer']) {
//     //   scoreCounter += 1;
//     //   initialColor = correct;
//     // } else {
//     //   initialColor = wrong;
//     // }
//     // setState(() {
//     //   initialColor = Colors.blue[400];
//     // });

//     for (var i = 0; i < options.length; i++) {
//       if (options[i] == answer) {
//         setState(() {
//             initialColor = Colors.green;
//           });
//       } else {
//         setState(() {
//             initialColor = Colors.red;
//           });
//       }
//     }
//   }
// bool answerSelected = false;

// setColor(String answer) {
//     List options = questions[questionsCounter]['options'];

//     setState(() {
//       initialColor = Colors.blue[400];
//     });

//     for (var i = 0; i < options.length; i++) {
//       if (options[i] == answer) {
//         setState(() {
//             initialColor = Colors.green;
//           });
//       } else {
//         setState(() {
//             initialColor = Colors.red;
//           });
//       }
//     }
//   }

  // void optionsLoop() {
  //   List option = questions[questionsCounter]['options'];
  //   option[0] = 'a';
  //   option[1] = 'b';
  //   option[2] = 'c';
  //   option[3] = 'd';
  // }

  // Map<String, Color> haba = {
  //   'a': Colors.blue[400],
  //   'b': Colors.blue[400],
  //   'c': Colors.blue[400],
  //   'd': Colors.blue[400],
  // };

  // Widget options({String text, String value}) {
  //   return Center(
  //     child: Padding(
  //       padding: EdgeInsets.only(top: 40),
  //       child: FlatButton(
  //         onPressed: () {
  //           if (answerSelected == false) {
  //             answer(value);
  //             setState(() {
  //               answerSelected = true;
  //               initialColor = text == value ? Colors.green : Colors.red;
  //             });
  //             print('tapped');
  //           }
  //         },
  //         child: Padding(
  //           padding: EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
  //           child: Text(
  //             text,
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //         color: answerSelected == true ? initialColor : Colors.blue[200],
  //         splashColor: Colors.white24,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

// bool answerSelected = false;
// Color firstColor = Colors.blue[200];
//   Color secondColor = Colors.blue[200];
//   Color thirdColor = Colors.blue[200];
//   Color fourthColor = Colors.blue[200];
// ========================================
// ========================================
// setColor(String answer) {
//     List options = questions[questionsCounter]['options'];

//     setState(() {
//       firstColor = Colors.blue[200];
//       secondColor = Colors.blue[200];
//       thirdColor = Colors.blue[200];
//       fourthColor = Colors.blue[200];
//     });

//     for (var i = 0; i < options.length; i++) {
//       if (options[i] == answer) {
//         if (i == 0) {
//           setState(() {
//             firstColor = Colors.green;
//           });
//         } else if (i == 1) {
//           setState(() {
//             secondColor = Colors.green;
//           });
//         } else if (i == 2) {
//           setState(() {
//             thirdColor = Colors.green;
//           });
//         } else if (i == 3) {
//           setState(() {
//             fourthColor = Colors.green;
//           });
//         }
//       }
//     }
//   }
// From Albert Oboh to Everyone:  08:51 PM
// ========================================
// ========================================
// Widget firstOption({String text, String answer}) {
//     return Center(
//       child: Padding(
//         padding: EdgeInsets.only(top: 40),
//         child: FlatButton(
//           onPressed: () {
//             if (answerSelected == false) {
//               setColor(answer);
//               setState(() {
//                 currentSelection = text;
//                 answerSelected = true;
//                 firstColor = text == answer ? Colors.green : Colors.red;
//               });
//               print('tapped');
//             }
//           },
//           child: Padding(
//             padding: EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
//             child: Text(text),
//           ),
//           color: answerSelected == true ? firstColor : Colors.blue[200],
//           splashColor: Colors.white24,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//       ),
//     );
//   }
