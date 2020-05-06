import 'package:flutter/material.dart';
import '../components/scheme.dart';

Questions question = Questions();

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int scoreCounter = 0;
  int questionsCounter = 0;

  String currentSelection;

  bool answerSelected = false;

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
      'answer': 'None'
    },
    {
      'question': 'When is the name of the most awesome Human?',
      'options': ['Abbie', 'Bert', 'Both', 'None'],
      'answer': 'Both'
    },
    {
      'question': 'Could be the name of the most awesome Human?',
      'options': ['Abbie', 'Bert', 'Both', 'None'],
      'answer': 'Abbie'
    },
  ];

  Color firstColor = Colors.blue[200];
  Color secondColor = Colors.blue[200];
  Color thirdColor = Colors.blue[200];
  Color fourthColor = Colors.blue[200];

  @override
  Widget build(BuildContext context) {
    List option = questions[questionsCounter]['options'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quiz Page'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
        child: Column(
          children: <Widget>[
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
            firstOption(
                text: option[0],
                color: setColor(questions[questionsCounter]['answer'])),
            secondOption(
                text: option[1],
                color: setColor(questions[questionsCounter]['answer'])),
            thirdOption(
                text: option[2],
                color: setColor(questions[questionsCounter]['answer'])),
            fourthOption(
                text: option[3],
                color: setColor(questions[questionsCounter]['answer'])),
            SizedBox(height: 50),
            RaisedButton(
              onPressed: () {
                next();
              },
              child: Text('Next'),
            )
          ],
        ),
      ),
    );
  }

  processOptions() {}

  next() {
    setState(() {
      currentSelection = '';
      answerSelected = false;
    });
    print(currentSelection);
  }

  setColor(String answer) {
    if (currentSelection == answer && answerSelected) {
      return Colors.green;
    }
    if (currentSelection != answer && answerSelected) {
      return Colors.red;
    }
    return Colors.blue[200];
  }

  Widget firstOption({String text, Color color}) {
    Color buttonColor;
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: FlatButton(
          onPressed: answerSelected == false
              ? () {
                  setState(() {
                    currentSelection = text;
                    answerSelected = true;
                    firstColor =
                        currentSelection == 'test' ? Colors.green : Colors.red;
                  });
                  print(currentSelection);
                }
              : () {},
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

  Widget secondOption({String text, Color color}) {
    Color buttonColor = Colors.blue[200];
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: FlatButton(
          onPressed: answerSelected == false
              ? () {
                  setState(() {
                    currentSelection = text;
                    answerSelected = true;
                    secondColor =
                        currentSelection == text ? Colors.green : Colors.red;
                  });
                  print(currentSelection);
                }
              : () {},
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

  Widget thirdOption({String text, Color color}) {
    Color buttonColor = Colors.blue[200];
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: FlatButton(
          onPressed: answerSelected == false
              ? () {
                  setState(() {
                    currentSelection = text;
                    answerSelected = true;
                    thirdColor =
                        currentSelection == text ? Colors.green : Colors.red;
                  });
                  print(currentSelection);
                }
              : () {},
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

  Widget fourthOption({String text, Color color}) {
    Color buttonColor = Colors.blue[200];
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: FlatButton(
          onPressed: answerSelected == false
              ? () {
                  setState(() {
                    currentSelection = text;
                    answerSelected = true;
                    fourthColor =
                        currentSelection == text ? Colors.green : Colors.red;
                  });
                  print(currentSelection);
                }
              : () {},
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
}
