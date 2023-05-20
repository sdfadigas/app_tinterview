import 'package:flutter/material.dart';
import '../controllers/CustomDrawer.dart';

class PergResp extends StatelessWidget {
  var dados;
  var linguagem;

  PergResp({required this.dados, required this.linguagem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        title: Row(
          children: <Widget>[
            Image.asset(
              "images/logo.png",
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
      endDrawer: const CustomDrawer(),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Color.fromARGB(255, 41, 41, 41),
              backgroundImage: AssetImage("images/icons/${linguagem}.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              dados["pergunta"],
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
