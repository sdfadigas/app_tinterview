import 'package:flutter/material.dart';
import '../controllers/CustomDrawer.dart';

class PergResp extends StatelessWidget {
  var dados;

  PergResp({required this.dados});

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
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            dados["pergunta"],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }
}
