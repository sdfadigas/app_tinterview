import 'package:flutter/material.dart';

class Question {
  final String title;
  final String subtitle;
  final String image;
  final dynamic data;

  Question({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.data,
  });
}

class SavedQuestionsProvider extends ChangeNotifier {
  List<Question> _savedQuestions = [];

  List<Question> get savedQuestions => _savedQuestions;

  bool isQuestionSaved(Question question) {
    return _savedQuestions.contains(question);
  }

  void saveQuestion(Question question) {
    _savedQuestions.add(question);
    notifyListeners();
  }

  void removeQuestion(Question question) {
    _savedQuestions.remove(question);
    notifyListeners();
  }
}
