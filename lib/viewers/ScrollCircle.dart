import 'package:app_tinterview/viewers/Square.dart';
import 'package:flutter/material.dart';
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
          onPressed: () async {
            List <String> linguagemList = [linguagem];
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Square(
                    linguagemList:
                        linguagemList), //levado para próxima tela com os dados da linguagem
              ),
            );
          },
        ),
      ),
    );
  }
}
