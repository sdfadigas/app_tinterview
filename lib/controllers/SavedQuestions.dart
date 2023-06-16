import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  final String documentName;

  Question({required this.documentName});
}

class SavedQuestionsProvider extends ChangeNotifier {
  List<Question?> _savedQuestions = [];
  late String _userUID; // UID do usuário logado

  SavedQuestionsProvider() {
    // Recupere o UID do usuário logado ao inicializar o provedor
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _userUID = user.uid;
      loadSavedQuestions(); // Carregue as perguntas salvas do Firestore
    }
  }

  List<Question?> get savedQuestions => _savedQuestions;

  bool isQuestionSaved(Question question) {
    return _savedQuestions.any((q) => q?.documentName == question.documentName);
  }

  Future<void> loadSavedQuestions() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(_userUID)
        .collection('saved_questions')
        .get();

    final savedQuestionIds = snapshot.docs.map((doc) => doc.id).toList();

    _savedQuestions.clear();

    for (final questionId in savedQuestionIds) {
      final question = Question(documentName: questionId);
      _savedQuestions.add(question);
    }

    notifyListeners();
  }

  Future<void> saveQuestion(Question question) async {
    final documentName = question.documentName;

    await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(_userUID)
        .collection('saved_questions')
        .doc(documentName)
        .set({});

    _savedQuestions.add(question);
    notifyListeners();
  }

  Future<void> removeQuestion(Question question) async {
    final documentName = question.documentName;

    await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(_userUID)
        .collection('saved_questions')
        .doc(documentName)
        .delete();

    final index = _savedQuestions
        .indexWhere((q) => q?.documentName == question.documentName);
    if (index != -1) {
      _savedQuestions[index] = null;
    }

    notifyListeners();
  }
}
