import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_tinterview/models/QuizQuestion.dart';
import 'package:app_tinterview/viewers/widgets.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Question> questions = [];
  int currentQuestionIndex = 0;
  int score = 0;
  int wrongAnswers = 0;
  bool isGameOver = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  void fetchQuestions() async {
    QuerySnapshot querySnapshot = await firestore.collection('quiz').get();
    setState(() {
      questions = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Question(
          question: data['question'],
          options: List<String>.from(data['options']),
          answerIndex: data['answerIndex'],
        );
      }).toList();
      isLoading = false; // Indica que as perguntas foram carregadas
    });
  }

  void checkAnswer(int selectedIndex) {
    if (selectedIndex == questions[currentQuestionIndex].answerIndex) {
      setState(() {
        score++;
      });
    } else {
      setState(() {
        wrongAnswers++;
        if (wrongAnswers >= 3) {
          isGameOver = true;
        }
      });
    }
    goToNextQuestion();
  }

  void goToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        isGameOver = true;
      }
    });
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      wrongAnswers = 0;
      isGameOver = false;
    });
  }

  Widget buildQuiz() {
    return Column(
      children: [
        Text(
          'Pergunta ${currentQuestionIndex + 1}/${questions.length}',
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontFamily: 'RockoFLF'),
        ),
        const SizedBox(height: 20),
        Text(
          questions[currentQuestionIndex].question,
          style: TextStyle(fontSize: 18, color: Color(0xFFE7D110)),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        ...questions[currentQuestionIndex]
            .options
            .asMap()
            .entries
            .map((option) => ElevatedButton(
                  onPressed: isGameOver ? null : () => checkAnswer(option.key),
                  child: Text(option.value),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    textStyle: TextStyle(fontSize: 16),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ))
            .toList(),
      ],
    );
  }

  Widget buildResult() {
    int totalQuestions = questions.length;
    int correctAnswers = score;
    int incorrectAnswers = wrongAnswers;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Pontuação: $score',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        SizedBox(height: 20),
        Text(
          'Você acertou $correctAnswers de $totalQuestions perguntas.',
          style: TextStyle(fontSize: 18, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        Text(
          'Você errou $incorrectAnswers perguntas.',
          style: TextStyle(fontSize: 18, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: restartQuiz,
          child: Text('Recomeçar'),
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 34),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: return_AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            return_Anuncio(),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : (isGameOver ? buildResult() : buildQuiz()),
          ],
        ),
      ),
    );
  }
}
