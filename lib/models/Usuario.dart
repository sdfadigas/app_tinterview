import 'package:app_tinterview/controllers/SavedQuestions.dart';
import 'package:flutter/material.dart';

class UsuarioProvider extends ChangeNotifier {
  String? id;
  String? nome;
  String? email;
  String? senha;
  List<Question>? questoesfavoritas;

  void clearUserData() {
    id = null;
    nome = null;
    email = null;
    senha = null;
    questoesfavoritas = null;

    notifyListeners();
  }

  fromJson(Map<String, dynamic> json) {
    id = json['UIDusuario'];
    nome = json['nome'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UIDusuario'] = id;
    data['nome'] = senha;
    data['email'] = email;
    return data;
  }
}
