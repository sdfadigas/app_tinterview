import 'package:app_tinterview/viewers/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:async';

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
  List<Color> buttonColors = [];
  List<bool> buttonEnabled = [];
  Timer? timer;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
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
      initializeButtonColors();
      initializeButtonEnabled();
      isLoading = false;
    });
  }

  void initializeButtonColors() {
    buttonColors = List<Color>.filled(
      questions[currentQuestionIndex].options.length,
      Colors.blue,
    );
  }

  void initializeButtonEnabled() {
    buttonEnabled = List<bool>.filled(
      questions[currentQuestionIndex].options.length,
      true,
    );
  }

  void checkAnswer(int selectedIndex) {
    setState(() {
      if (selectedIndex == questions[currentQuestionIndex].answerIndex) {
        score++;
        buttonColors[selectedIndex] = Colors.green;
      } else {
        wrongAnswers++;
        buttonColors[selectedIndex] = Colors.red;
      }
      buttonEnabled = List<bool>.filled(
        questions[currentQuestionIndex].options.length,
        false,
      );

      if (wrongAnswers >= 3) {
        isGameOver = true;
      }
    });

    timer = Timer(const Duration(milliseconds: 500), () {
      goToNextQuestion();
    });
  }

  void goToNextQuestion() {
    setState(() {
      timer?.cancel();
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        initializeButtonColors();
        initializeButtonEnabled();
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
      initializeButtonColors();
      initializeButtonEnabled();
    });
  }

  Widget buildQuiz() {
    return Container(
      width: 400,
      height: 700,
      decoration: BoxDecoration(
        color: const Color(0xFF222222),
        borderRadius: BorderRadius.circular(46),
      ),
      padding: const EdgeInsets.only(top: 30, bottom: 80, left: 20, right: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            height: 200, // Defina a altura fixa da pergunta aqui
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    questions[currentQuestionIndex].question,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  const Divider(
                    height: 1,
                    thickness: 2,
                    color: Color.fromARGB(255, 53, 53, 53),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: questions[currentQuestionIndex].options.length,
              itemBuilder: (context, index) {
                final option = questions[currentQuestionIndex].options[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ElevatedButton(
                    onPressed:
                        buttonEnabled[index] ? () => checkAnswer(index) : null,
                    child: Text(option, style: const TextStyle(fontSize: 26)),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 60),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (buttonColors[index] == Colors.green) {
                            return Colors.green;
                          } else if (buttonColors[index] == Colors.red) {
                            return Colors.red;
                          } else {
                            return const Color.fromARGB(255, 34, 34, 34);
                          }
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildResult() {
    int totalQuestions = questions.length;
    int correctAnswers = score;
    int incorrectAnswers = wrongAnswers;

    return Container(
      width: 400,
      height: 700,
      decoration: BoxDecoration(
        color: const Color(0xFF333333),
        borderRadius: BorderRadius.circular(46),
      ),
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Pontuação: $score',
            style: const TextStyle(fontSize: 48, color: Colors.white),
          ),
          const SizedBox(height: 80),
          Text(
            'Você acertou $correctAnswers pergunta(s).',
            style: const TextStyle(fontSize: 18, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            'Você errou $incorrectAnswers perguntas.',
            style: const TextStyle(fontSize: 18, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 80),
          ElevatedButton(
            onPressed: restartQuiz,
            child: const Text('Recomeçar'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 46, 46, 46)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(fontSize: 24)),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        centerTitle: true,
        title: Image.asset(
          "images/logo.png",
          width: 48,
          height: 48,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              '${currentQuestionIndex + 1}/${questions.length}',
              style: const TextStyle(fontSize: 38),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bkg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              isLoading
                  ? const CircularProgressIndicator()
                  : (isGameOver ? buildResult() : buildQuiz()),
            ],
          ),
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> options;
  final int answerIndex;

  Question({
    required this.question,
    required this.options,
    required this.answerIndex,
  });
}
