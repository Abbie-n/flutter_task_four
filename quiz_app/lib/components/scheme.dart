class Scheme {
  String question;
  List<String> options = List<String>(4);
  String answer;

  Scheme(this.question, this.options, this.answer);
}

class Questions {

  int questionCounter = 0;

  List<Scheme> getQuestions = [
    Scheme('What is the name of the most awesom Human?', ['Abbie', 'Bert', 'Both', 'None'], 'A'),
    Scheme('What is the name of the most awesom Human?', ['Abbie', 'Bert', 'Both', 'None'], 'B'),
    Scheme('What is the name of the most awesom Human?', ['Abbie', 'Bert', 'Both', 'None'], 'C'),
    Scheme('What is the name of the most awesom Human?', ['Abbie', 'Bert', 'Both', 'None'], 'D'),
    Scheme('What is the name of the most awesom Human?', ['Abbie', 'Bert', 'Both', 'None'], 'A')
  ];

  String questions() {
    return getQuestions[questionCounter].question;
  }

  // List option() {
  //   return getQuestions[questionCounter].options;
  // }

  String answer() {
    return getQuestions[questionCounter].answer;
  }


  
}

