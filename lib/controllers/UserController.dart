import 'package:app_tinterview/service/AuthService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/Usuario.dart';

class UserController extends ChangeNotifier {
  final _db = FirebaseFirestore.instance;
  bool isLoading = true;

  UserController(User? user, UsuarioProvider usuario, AuthService auth) {
    if (user != null) {
      getUser(user, usuario);
    }

    auth.addListener(() {
      if (auth.usuario == null) {
        handleLogout(usuario);
      }
    });
  }

  void handleLogout(UsuarioProvider usuario) {
    // Limpar os dados do usuário
    usuario.clearUserData();

    // Notificar os ouvintes sobre as mudanças
    notifyListeners();
  }

  Future<void> cadastrarUser(UsuarioProvider user) async {
    var doc = _db.collection("User").doc();
    final result = {
      'UIDusuario': user.id,
      'nome': user.nome,
      'email': user.email
    };
    await doc.set(result);
  }

  Future<Map<String, dynamic>> getUser(
      User? user, UsuarioProvider usuario) async {
    Map<String, dynamic> data = {};
    await _db
        .collection("User")
        .where('UIDusuario', isEqualTo: user!.uid)
        .get()
        .then((value) {
      data = value.docs.single.data();
    });

    setDataUser(usuario, data);
    return data;
  }

  setDataUser(UsuarioProvider cliente, Map<String, dynamic> json) {
    cliente.fromJson(json);

    isLoading = false;
    notifyListeners();
  }
}
