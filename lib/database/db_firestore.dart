// ignore_for_file: empty_constructor_bodies

import 'package:cloud_firestore/cloud_firestore.dart';

class DBFirestore {
  //List lista_techs = [];
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; //recuperando instancia do FB
  firestore() {
    return _firestore;
  }

  // * Exportar ao banco
  addData() async {
    int i = 1;
    for (var element in data) {
      _firestore.collection('interview').doc(i.toString()).set(element);
      i += 1;
    }
  }

  // * CONSULTA: Tecnologia
  Future queryTech(tecnologia) async {
    return await DBFirestore()
        .firestore()
        .collection('interview')
        .where("filtros", arrayContains: tecnologia)
        .snapshots();
  }

  // * CONSULTA: Filtros
  Future queryFilter(filtros) async {
    return await DBFirestore()
        .firestore()
        .collection('interview')
        .where("filtros", isEqualTo: filtros)
        .snapshots();
  }

  // * Lista de linguagens:
   List lista_techs = [
    'JAVASCRIPT',
    "PYTHON",
    'ANGULAR',
    "RUBY",
    "SWIFT",
    "C#",
    "PHP", 
    "SQL",
    "FLUTTER",
    'JAVA',
    'HTML',
    'CSS',
    "REACT", 
    "VUE",

  ];

  // * Lista de perguntas para subir ao banco:
  List<Map<String, dynamic>> data = [
    
  ];

}




    // * CONSULTA SIMPLES: Recebe: Retorna List Map com perguntas que a contém em "filtros:".
  /*
  Future queryTech(linguagem) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection("interview")
        .where("filtros", arrayContains: "$linguagem")
        //.orderBy("filtros: junior").orderBy("filtros: estágio").orderBy("filtros: senior").orderBy("filtros: pleno")
        .get();  //print("$linguagem");
    late var dados;
    for (DocumentSnapshot item in querySnapshot.docs) {
      dados = item.data(); print(dados);
      }
    return Future.value(dados);
    }     
    //dados as Map;
    //var list = []; //print(dados as Map); //
    //print(("${dados["pergunta"]}"));
    //list = dados.entries.map((e) => Customer(e.key, e.value)).toList();
    //print(dados);
  */