import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';

class ScrollCircle extends StatelessWidget {
  final String linguagem;

  ScrollCircle({required this.linguagem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 3),
      child: Container(
        height: 80,
        width: 80,
        child: IconButton(
          icon: Image.asset("images/icons/${linguagem}.png"),
           iconSize: 48,
          onPressed:() {
            linguagem;  //recebe a variavél com nome da linguagem
            //chama a funcão de consulta passando a linguagem e é levado para próxima tela.
          },
        ),
      ),
    );
  }
}


//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  IconButton(
//                    icon: Icon(FlutterIcons.js_faw5d),
//                    iconSize: 48,
//                    color: Color(0xFFeeeeee),
//                    onPressed: () {
//                      // Ação do ícone
//                    }, // Ícone JavaScript
//                  ),
//                ],

//IconButton( icon: Icon(FlutterIcons.js_faw5d),
 //         iconSize: 48,
   //       color: Color.fromARGB(255, 255, 251, 0),
