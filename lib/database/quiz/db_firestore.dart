import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(QuizConfigPage());
}

// ignore: must_be_immutable
class QuizConfigPage extends StatelessWidget {
  List<Map<String, dynamic>> quizQuestions = [
    {
      'question': 'Qual é a linguagem de programação mais popular?',
      'options': ['Java', 'Python', 'JavaScript', 'C++', 'C#'],
      'answerIndex': 2,
    },
    {
      'question':
          'Qual linguagem de programação é amplamente usada para desenvolvimento de aplicativos móveis?',
      'options': ['Swift', 'Java', 'Python', 'Ruby', 'Kotlin'],
      'answerIndex': 1,
    },
    {
      'question':
          'Quais das seguintes linguagens são usadas para o desenvolvimento web?',
      'options': ['HTML', 'CSS', 'JavaScript', 'PHP', 'Todas as anteriores'],
      'answerIndex': 4,
    },
    {
      'question':
          'Qual linguagem de programação é usada para criar aplicativos nativos para iOS?',
      'options': ['Swift', 'Objective-C', 'Java', 'Kotlin', 'C++'],
      'answerIndex': 0,
    },
    {
      'question':
          'Qual linguagem de programação é usada para consultas em bancos de dados?',
      'options': ['SQL', 'Java', 'Python', 'C#', 'Ruby'],
      'answerIndex': 0,
    },
    {
      'question':
          'Qual linguagem de programação é usada para desenvolvimento de jogos?',
      'options': ['C++', 'Java', 'Python', 'JavaScript', 'Ruby'],
      'answerIndex': 0,
    },
    {
      'question':
          'Qual linguagem de programação é conhecida por sua simplicidade e legibilidade?',
      'options': ['Python', 'Java', 'C', 'Ruby', 'JavaScript'],
      'answerIndex': 0,
    },
    {
      'question':
          'Qual das seguintes linguagens de programação é orientada a objetos?',
      'options': ['Java', 'C', 'Python', 'Ruby', 'Todas as anteriores'],
      'answerIndex': 4,
    },
    {
      'question':
          'Qual linguagem de programação é usada para desenvolvimento de aplicações desktop?',
      'options': ['Java', 'Python', 'C#', 'Ruby', 'Swift'],
      'answerIndex': 0,
    },
    {
      'question':
          'Qual das seguintes linguagens de programação é usada para análise e processamento de dados?',
      'options': ['R', 'Python', 'Java', 'C++', 'JavaScript'],
      'answerIndex': 1,
    },
    {
      'question':
          'Qual linguagem de programação é usada para desenvolvimento de scripts no lado do servidor?',
      'options': ['Python', 'JavaScript', 'Ruby', 'PHP', 'Java'],
      'answerIndex': 3,
    },
    {
      'question':
          'Qual linguagem de programação é usada para desenvolvimento de inteligência artificial?',
      'options': ['Python', 'Java', 'C++', 'Ruby', 'Swift'],
      'answerIndex': 0,
    },
    {
      'question':
          'Qual linguagem de programação é usada para desenvolvimento de aplicativos Android?',
      'options': ['Java', 'Kotlin', 'Python', 'Swift', 'C#'],
      'answerIndex': 1,
    },
    {
      'question':
          'Qual das seguintes linguagens de programação é usada para desenvolvimento de blockchain?',
      'options': ['Solidity', 'JavaScript', 'Python', 'C++', 'Ruby'],
      'answerIndex': 0,
    },
    {
      'question':
          'Qual linguagem de programação é usada para desenvolvimento de automação de tarefas?',
      'options': ['Python', 'Java', 'C', 'Ruby', 'JavaScript'],
      'answerIndex': 0,
    },
  ];

  void configureQuizCollection() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Verificar se a coleção 'quiz' já existe
    bool quizCollectionExists = await firestore
        .collection('quiz')
        .get()
        .then((snapshot) => snapshot.size > 0);

    if (!quizCollectionExists) {
      // Criar a coleção 'quiz' se não existir
      CollectionReference quizCollection = firestore.collection('quiz');

      // Adicionar as perguntas à coleção
      for (var question in quizQuestions) {
        await quizCollection.add(question);
      }

      print('Perguntas adicionadas com sucesso à coleção "quiz" no Firestore!');
    } else {
      print(
          'A coleção "quiz" já existe no Firestore. Não foram feitas alterações.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurar Coleção Quiz'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: configureQuizCollection,
          child: Text('Configurar Coleção'),
        ),
      ),
    );
  }
}
