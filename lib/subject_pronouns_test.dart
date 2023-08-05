import 'package:flutter/material.dart';
import 'home_page.dart';

class SubjectPronounsPage extends StatefulWidget {
  @override
  _SubjectPronounsPageState createState() => _SubjectPronounsPageState();
}

class _SubjectPronounsPageState extends State<SubjectPronounsPage> {
  int _totalQuestions = 15;
  int _correctAnswers = 0;
  int _currentSlide = 0;
  bool _showQuestions = false;
  double _lastAverage = 0.0;

  List<Map<String, dynamic>> _questions = [
    {
      'question': '___ estou indo pra loja.',
      'options': ['I', 'We', 'She', 'It'],
      'correctAnswer': 'I',
    },
    {
      'question': '___ está lendo um livro.',
      'options': ['We', 'They', 'She', 'I'],
      'correctAnswer': 'She',
    },
    {
      'question': '___ estão jogando futebol comigo.',
      'options': ['You', 'It', 'They', 'He'],
      'correctAnswer': 'They',
    },
    {
      'question': 'He ___ a doctor.',
      'options': ['am', 'is', 'are', 'be'],
      'correctAnswer': 'is',
    },
    {
      'question': 'We ___ studying for the test.',
      'options': ['am', 'is', 'are', 'be'],
      'correctAnswer': 'are',
    },
    {
      'question': 'You ___ my best friend.',
      'options': ['am', 'is', 'are', 'be'],
      'correctAnswer': 'are',
    },
    {
      'question': 'She ___ from Canada.',
      'options': ['am', 'is', 'are', 'be'],
      'correctAnswer': 'is',
    },
    {
      'question': 'It ___ a nice day.',
      'options': ['am', 'is', 'are', 'be'],
      'correctAnswer': 'is',
    },
    {
      'question': 'I ___ a student.',
      'options': ['am', 'is', 'are', 'be'],
      'correctAnswer': 'am',
    },
    {
      'question': 'They ___ good at cooking.',
      'options': ['am', 'is', 'are', 'be'],
      'correctAnswer': 'are',
    },
    {
      'question': 'You ___ very talented.',
      'options': ['am', 'is', 'are', 'be'],
      'correctAnswer': 'are',
    },
    {
      'question': 'She ___ a singer.',
      'options': ['am', 'is', 'are', 'be'],
      'correctAnswer': 'is',
    },
    {
      'question': 'We ___ ready to leave.',
      'options': ['am', 'is', 'are', 'be'],
      'correctAnswer': 'are',
    },
    {
      'question': 'He ___ an engineer.',
      'options': ['am', 'is', 'are', 'be'],
      'correctAnswer': 'is',
    },
    {
      'question': 'It ___ a big problem.',
      'options': ['am', 'is', 'are', 'be'],
      'correctAnswer': 'is',
    },
  ];

  PageController _pageController = PageController(initialPage: 0);

  void _answerQuestion(String selectedOption) {
    String correctAnswer = _questions[_currentSlide]['correctAnswer'];
    setState(() {
      if (selectedOption == correctAnswer) {
        _correctAnswers++;
      }
      _currentSlide++;
      if (_currentSlide < _totalQuestions) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        _finishQuiz();
      }
    });
  }

  void _startQuiz() {
    setState(() {
      _showQuestions = true;
      _currentSlide = 0;
    });
  }

  void _finishQuiz() {
    double average = (_correctAnswers / _totalQuestions) * 100;
    _showResultDialog(average);
    setState(() {
      _showQuestions = false;
      _correctAnswers = 0;
      _currentSlide = 0;
      _lastAverage = average;
    });
  }

  void _showResultDialog(double average) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Média alcançada'),
          content: Text('${average.toStringAsFixed(1)}%'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste de Subject Pronouns'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemCount: _showQuestions ? _totalQuestions : 1,
                itemBuilder: (context, index) {
                  if (_showQuestions) {
                    return _buildQuestionSlide(index);
                  } else {
                    return _buildInitialSlide();
                  }
                },
              ),
            ),
            if (!_showQuestions)
              ElevatedButton(
                onPressed: _startQuiz,
                child: Text('Iniciar teste'),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
        child: Icon(Icons.home),
        tooltip: 'Voltar para a página Home',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      persistentFooterButtons: [
        if (_showQuestions && _currentSlide == _totalQuestions - 1)
          ElevatedButton(
            onPressed: _finishQuiz,
            child: Text('Finalizar'),
          ),
      ],
    );
  }

  Widget _buildInitialSlide() {
    return Center(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 32.0), // 2cm padding on both sides
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Preencha as lacunas com a opção correta.',
              style: TextStyle(fontSize: 24),
            ),
            // Text(
            //   '${_lastAverage.toStringAsFixed(1)}%',
            //   style: TextStyle(fontSize: 24),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionSlide(int index) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _questions[index]['question'],
            style: TextStyle(fontSize: 24),
          ),
          ...(_questions[index]['options'] as List<String>).map((option) {
            return ElevatedButton(
              onPressed: () {
                _answerQuestion(option);
              },
              child: Text(option),
            );
          }).toList(),
        ],
      ),
    );
  }
}
