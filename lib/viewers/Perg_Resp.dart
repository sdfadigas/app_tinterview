import 'package:flutter/material.dart';
import '../controllers/CustomDrawer.dart';
import 'TelaPrincipal.dart';

class PergResp extends StatelessWidget {
  var dados;

  PergResp({required this.dados});

  @override
  Widget build(BuildContext context) {
    List imagem = dados['filtros'];
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: TelaPrincipal().return_AppBar(),
      endDrawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Color.fromARGB(255, 41, 41, 41),
              backgroundImage:
                  AssetImage("images/icons/${imagem[1]}.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              dados["pergunta"],
              textAlign: TextAlign.center,
              maxLines: 1000,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Divider(height: 10, color: Color.fromARGB(255, 151, 146, 146)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              dados["resposta"],
              textAlign: TextAlign.justify,
              maxLines: 10000,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 25,
                  fontWeight: FontWeight.w200),
            ),
          ),
        ]),
      ),
    );
  }
}
