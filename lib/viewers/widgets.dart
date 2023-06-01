import 'package:flutter/material.dart';

AppBar return_AppBar() {
  return AppBar(
    backgroundColor: const Color(0xFF222222),
    centerTitle: true,
    title: Image.asset(
      "images/logo.png",
      width: 48,
      height: 48,
    ),
  );
}

Widget return_Anuncio() {
  return InkWell(
    onTap: () {
      print('Anúncio clicado!'); // Ação do anúncio quando for clicado
    },
    child: Container(
      width: 385,
      height: 110,
      color: Colors.grey,
      child: Image.asset(
        "images/publicity/SENAI.png",
        width: 385,
        height: 100,
      ),
    ),
  );
}
