import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app_tinterview/firebase_options.dart';

class DBFirestore {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; //recuperando instancia do FB

  // * lista de arquivos para o banco
  List<Map<String, dynamic>> data = [
    {
      "pergunta": "O que é HTML?",
      "resposta": "HTML é blalbalaqlbalba",
      "filtros": {"HTML", "ESTAGIO", "TECNICA", "FRONT-END"}
    }
  ];

  // * Exportando ao banco
  addData() async {
    for (var element in data) {
      _firestore.collection('interview').add(element);
    }
  }

  // * Consulta simples: filtro[tecnologia] ordenado por nível de dificuldade.

  // * Consulta complexa: SearchField

  // *
}
