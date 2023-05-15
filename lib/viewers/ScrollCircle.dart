import 'package:app_tinterview/viewers/Square.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
//import 'package:app_tinterview/database/db_firestore.dart';
//import 'package:app_tinterview/viewers/Perguntas.dart';

class ScrollCircle extends StatelessWidget {
  final String linguagem;

  ScrollCircle({required this.linguagem});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 3),
      child: SizedBox(
        height: 80,
        width: 80,
        child: IconButton(
          icon: Image.asset("images/icons/${linguagem}.png"),
          iconSize: 48,
          onPressed:() async {
            //dynamic dados =
            //var dados = await DBFirestore().queryTech(linguagem);
          
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Square(linguagem: linguagem), //levado para próxima tela com os dados da linguagem
              ),
            );
          },
        ),
      ),
    );
  }
}