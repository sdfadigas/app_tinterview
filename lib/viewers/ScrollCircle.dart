import 'package:app_tinterview/database/db_firestore.dart';
import 'package:app_tinterview/viewers/Square.dart';
import 'package:flutter/material.dart';

class ScrollCircle extends StatelessWidget {
  final String linguagem;

  const ScrollCircle({super.key, required this.linguagem});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 3),
      child: SizedBox(
        height: 80,
        width: 80,
        child: IconButton(
          icon: Image.asset("assets/images/icons/$linguagem.png"),
          iconSize: 48,
          onPressed: () async {
            var dados = await DBFirestore().queryTech(linguagem);
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Square(
                    dados_bd:
                        dados), //levado para próxima tela com os dados da linguagem
              ),
            );
          },
        ),
      ),
    );
  }
}
