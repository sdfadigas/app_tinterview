import 'package:app_tinterview/database/db_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app_tinterview/viewers/BackendPage.dart';
import 'package:app_tinterview/viewers/BancoDeDadosPage.dart';
import 'package:app_tinterview/viewers/FrontendPage.dart';
import 'package:app_tinterview/viewers/MobilePage.dart';
import 'package:app_tinterview/controllers/CustomDrawer.dart';
import 'ScrollCircle.dart';
import 'Sugestao.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  String _pesquisa = '';

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

      endDrawer: const CustomDrawer(), //MENU

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // * CAIXA DE PESQUISA
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (valor) {
                  setState(() {
                    _pesquisa = valor;
                    Sugestao(pesquisa: _pesquisa);
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Digite sua busca',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  suffixIcon: const Icon(Icons.search, color: Colors.grey),
                  labelStyle: const TextStyle(color: Color(0xFF222222)),
                  suffixStyle: const TextStyle(color: Color(0xFF222222)),
                  filled: true,
                  fillColor: const Color(0xFFE5E5E5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            // * LISTA HORIZONATAL DE TECNOLOGIAS OU 'STORIES'KKK
            SizedBox(
              height: 80,
              child: ListView.builder(
                  itemCount: DBFirestore().lista_techs.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, Index) {
                    return ScrollCircle(
                      linguagem: DBFirestore().lista_techs[Index],
                    );
                  }),
            ),

            const SizedBox(height: 18),
            InkWell(
              onTap: () {
                // Ação do anúncio quando for clicado
                print('Anúncio clicado!');
              },
              child: Container(
                width: 300,
                height: 100,
                color: Colors.grey,
                child: const Center(
                  child: Text(
                    'Anúncio', // Conteúdo da caixa de anúncio
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FrontendPage()));
                  },
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 1,
                            offset: const Offset(2, 2))
                      ],
                      color: const Color(0xFF363533),
                    ),
                    child: const Center(
                      child: Text(
                        'Frontend',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xFFeeeeee),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BackendPage()));
                  },
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 1,
                            offset: const Offset(-2, 2))
                      ],
                      color: const Color(0xFF363533),
                    ),
                    child: const Center(
                      child: Text(
                        'Backend',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xFFeeeeee),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(children: <Widget>[
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MobilePage()));
                    },
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          color: const Color(0xFF363533),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 1,
                                offset: const Offset(2, -2))
                          ]),
                      child: const Center(
                        child: Text(
                          'Mobile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFFeeeeee),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BancoDeDadosPage()));
                    },
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 1,
                              offset: const Offset(-2, -2))
                        ],
                        color: const Color(0xFF363533),
                      ),
                      child: const Center(
                        child: Text(
                          'Banco de dados',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFFeeeeee),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
            const SizedBox(height: 22)
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(SearchField());
}
