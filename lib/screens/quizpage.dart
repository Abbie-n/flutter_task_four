import 'package:flutter/material.dart';
import './quizover.dart';
import 'homeview.dart';

//Page for the quiz content
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //list of questions to be displayed
  List<Map> questions = [
    {
      'question': 'How many bones does an adult human have?',
      'options': ['198', '209', '260', '206'],
      'answer': '206'
    },
    {
      'question': 'In what year did The Beatles split up?',
      'options': ['1970', '2010', '2000', '1992'],
      'answer': '1970'
    },
    {
      'question': 'Where is the smallest bone in the human body located',
      'options': ['Nose', 'Eyes', 'Ears', 'Legs'],
      'answer': 'Ears'
    },
    {
      'question': 'Who went to school with a lamb?',
      'options': ['Wolf', 'Mary', 'Wolf', 'Phil'],
      'answer': 'Mary'
    },
    {
      'question':
          'How many sides, in total, would three triangles and three rectangles have?',
      'options': ['12', '21', '44', '8'],
      'answer': '21'
    },
  ];

  @override
  Widget build(BuildContext context) {
    List option = questions[questionCounter]['options'];

    return Scaffold(
      backgroundColor: Color(0xff6e41a8),
      //added WillPopScope to prevent the back button from working. Can only go back wen the home button is pressed
      body: WillPopScope(
        onWillPop: () {
          return null;
        },
        child: SingleChildScrollView(
          child: Container(
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
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  //displays question index
                  child: Text(
                    'Question ' +
                        (questionCounter + 1).toString() +
                        ' of ' +
                        questions.length.toString(),
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Divider(thickness: 2, color: Colors.black),
                //displays question
                Text(
                  questions[questionCounter]['question'],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 20),
                  height: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: <Widget>[
                      //row for first and second options
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            firstOption(
                                text: option[0],
                                answer: questions[questionCounter]['answer']),
                            SizedBox(width: 30),
                            secondOption(
                                text: option[1],
                                answer: questions[questionCounter]['answer']),
                          ],
                        ),
                      ),
                      //row for third and fourth options
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            thirdOption(
                                text: option[2],
                                answer: questions[questionCounter]['answer']),
                            SizedBox(width: 30),
                            fourthOption(
                                text: option[3],
                                answer: questions[questionCounter]['answer']),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),

                      //next button to lead to the next question
                      RaisedButton(
                        color: Color(0xffefd705),
                        splashColor: Colors.white24,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          setState(() {
                            if (buttonClicked == true) {
                              next();
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 30, right: 30, bottom: 15),
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: Color(0xff6e41a8),
                                fontStyle: FontStyle.italic,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
                //displays live score
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Score: ',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          scoreCounter.toString(),
                          style:
                              TextStyle(color: Color(0xff6e41a8), fontSize: 20),
                        ),
                        color: Color(0xfffefcfb),
                        splashColor: Colors.white24,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int scoreCounter = 0;
  int questionCounter = 0;

//function for the next button
  void next() {
    setState(
      () {
        if (questionCounter < questions.length - 1) {
          questionCounter++;
          buttonClicked = false;
        } else if (questionCounter == questions.length - 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizOver(scoreCounter),
            ),
          );
        } else {
          questionCounter += 0;
        }
      },
    );
  }

//function to increment score when the correct answer is clicked
  answer(String value) {
    if (value == questions[questionCounter]['answer']) {
      scoreCounter += 1;
    } else {
      scoreCounter += 0;
    }
  }

  bool buttonClicked = false;

  //seperated the color of each option
  Color firstColor = Color(0xfffefcfb);
  Color secondColor = Color(0xfffefcfb);
  Color thirdColor = Color(0xfffefcfb);
  Color fourthColor = Color(0xfffefcfb);

//function that loops through options, to mark the right answer green even if the wrong answer was selected
  setColor(String answer) {
    List options = questions[questionCounter]['options'];

    setState(() {
      firstColor = Color(0xfffefcfb);
      secondColor = Color(0xfffefcfb);
      thirdColor = Color(0xfffefcfb);
      fourthColor = Color(0xfffefcfb);
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

// different widget for each option
  Widget firstOption({String text, String answer}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: RaisedButton(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
          elevation: 8,
          onPressed: () {
            if (buttonClicked == false) {
              setColor(answer);
              setState(() {
                buttonClicked = true;
                firstColor = text == answer ? Colors.green : Colors.red;
                //replaced the answer function above with this if statement
                if (text == questions[questionCounter]['answer']) {
                  scoreCounter += 1;
                }
              });
            }
          },
          child: Text(text),
          color: buttonClicked == true ? firstColor : Color(0xfffefcfb),
          splashColor: Colors.white24,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget secondOption({String text, String answer}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: RaisedButton(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
          onPressed: () {
            if (buttonClicked == false) {
              setColor(answer);
              setState(() {
                buttonClicked = true;
                secondColor = text == answer ? Colors.green : Colors.red;
                //replaced the answer function above with this if statement
                if (text == questions[questionCounter]['answer']) {
                  scoreCounter += 1;
                }
              });
            }
          },
          elevation: 8,
          child: Text(text),
          color: buttonClicked == true ? secondColor : Color(0xfffefcfb),
          splashColor: Colors.white24,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget thirdOption({String text, String answer}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: RaisedButton(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
          onPressed: () {
            if (buttonClicked == false) {
              setColor(answer);
              setState(() {
                buttonClicked = true;
                thirdColor = text == answer ? Colors.green : Colors.red;
                //replaced the answer function above with this if statement
                if (text == questions[questionCounter]['answer']) {
                  scoreCounter += 1;
                }
              });
            }
          },
          elevation: 8,
          child: Text(text),
          color: buttonClicked == true ? thirdColor : Color(0xfffefcfb),
          splashColor: Colors.white24,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget fourthOption({String text, String answer}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: RaisedButton(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
          onPressed: () {
            if (buttonClicked == false) {
              setColor(answer);
              setState(() {
                buttonClicked = true;
                fourthColor = text == answer ? Colors.green : Colors.red;
                //replaced the answer function above with this if statement
                if (text == questions[questionCounter]['answer']) {
                  scoreCounter += 1;
                }
              });
            }
          },
          elevation: 8,
          child: Text(text),
          color: buttonClicked == true ? fourthColor : Color(0xfffefcfb),
          splashColor: Colors.white24,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
