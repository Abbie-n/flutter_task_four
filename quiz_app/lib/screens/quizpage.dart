import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quizover.dart';

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
                options(text: option[0]),
                SizedBox(width: 30),
                options(text: option[1]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                options(text: option[2]),
                SizedBox(width: 30),
                options(text: option[3]),
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
                next();
              },
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
        } else if (questionsCounter == questions.length - 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizOver(scoreCounter),
            ),
          );
        }
      },
    );
  }

  Color initialColor = Colors.blue[400];
  Color correct = Colors.green;
  Color wrong = Colors.red;

  void answer(String value) {
    if (value == questions[questionsCounter]['answer']) {
      scoreCounter += 1;
      initialColor = correct;
    } else {
      initialColor = wrong;
    }
    setState(() {
      haba[value] = initialColor;
    });
  }

  void optionsLoop() {
    List option = questions[questionsCounter]['options'];
    option[0] = 'a';
    option[1] = 'b';
    option[2] = 'c';
    option[3] = 'd';
  }

  Map<String, Color> haba = {
    'a': Colors.blue[400],
    'b': Colors.blue[400],
    'c': Colors.blue[400],
    'd': Colors.blue[400],
  };

  Widget options({String text}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: FlatButton(
          onPressed: () {
            answer(text);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
          color: initialColor,
          splashColor: Colors.white24,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

// bool selectedOption = false;

// Widget firstOption({String text, Color color}) {
//   return Center(
//     child: Padding(
//       padding: EdgeInsets.only(top: 40),
//       child: FlatButton(
//         onPressed: () {
//           if (text == questions[questionsCounter]['answer']) {
//             setState(() => selectedOption = !selectedOption);
//           }else {
//             setState(() =>  Colors.red);
//           }
//         },
//         child: Padding(
//           padding: EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
//           child: Text(text),
//         ),
//         color: (selectedOption) ? Colors.green  : Colors.blue[200],
//         splashColor: Colors.white24,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//     ),
//   );
// }

// Widget secondOption({String text, Color color}) {
//   return Center(
//     child: Padding(
//       padding: EdgeInsets.only(top: 40),
//       child: FlatButton(
//         onPressed: () {
//           if (text == questions[questionsCounter]['answer']) {
//             setState(() => selectedOption = !selectedOption);
//           }else if (text != questions[questionsCounter]['answer']) {
//             setState(() => selectedOption == selectedOption);
//           }
//         },
//         child: Padding(
//           padding: EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
//           child: Text(text),
//         ),
//         color: (selectedOption) ? Colors.green  : Colors.blue[200],
//         splashColor: Colors.white24,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//     ),
//   );
// }

// Widget thirdOption({String text, Color color}) {
//   return Center(
//     child: Padding(
//       padding: EdgeInsets.only(top: 40),
//       child: FlatButton(
//         onPressed: () {
//           if (text == questions[questionsCounter]['answer']) {
//             color = Colors.green;
//           }else {
//             color = Colors.red;
//           }
//         },
//         child: Padding(
//           padding: EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
//           child: Text(text),
//         ),
//         color:Colors.blue[200],
//         splashColor: Colors.white24,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//     ),
//   );
// }

// Widget fourthOption({String text, Color color}) {
//   return Center(
//     child: Padding(
//       padding: EdgeInsets.only(top: 40),
//       child: FlatButton(
//         onPressed: () {
//           if (text == questions[questionsCounter]['answer']) {
//             color = Colors.green;
//           }else {
//             color = Colors.red;
//           }
//         },
//         child: Padding(
//           padding: EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
//           child: Text(text),
//         ),
//         color:Colors.blue[200],
//         splashColor: Colors.white24,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//     ),
//   );
// }
