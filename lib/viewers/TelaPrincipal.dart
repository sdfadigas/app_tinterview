import 'package:app_tinterview/database/db_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app_tinterview/viewers/antigos%20fltros/BackendPage.dart';
import 'package:app_tinterview/viewers/antigos%20fltros/BancoDeDadosPage.dart';
import 'package:app_tinterview/viewers/antigos%20fltros/MobilePage.dart';
import 'package:app_tinterview/controllers/CustomDrawer.dart';
import 'Filtrar.dart';
import 'ScrollCircle.dart';
import 'Sugestao.dart';

class TelaPrincipal extends StatefulWidget {
  
// * FUNÇÃO AppBAR
  return_AppBar() {
    return AppBar(
      backgroundColor: Color(0xFF222222),
      centerTitle: true,
      title: Image.asset(
        "images/logo.png",
        width: 48,
        height: 48,
      ),
    );
  }

// * FUNÇÃO ANÚNCIO
  return_Anuncio() {
    return InkWell(
      onTap: () {
        print('Anúncio clicado!'); // Ação do anúncio quando for clicado
      },
      child: Container(
        width: 385,
        height: 100,
        color: Colors.grey,
        child: const Center(
          child: Text(
            'Anúncio', // Conteúdo da caixa de anúncio
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  String _pesquisa = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: TelaPrincipal().return_AppBar(),
      endDrawer: const CustomDrawer(),
      
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // * CAIXA DE PESQUISA
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (valor) {
                  _pesquisa = valor;
                },
                decoration: InputDecoration(
                  hintText: 'Digite sua busca',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  suffixIcon: IconButton(
                    padding: EdgeInsets.all(4.0),
                    icon: const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 51, 49, 49),
                      size: 45,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Sugestao(pesquisa: _pesquisa)));
                    },
                  ),
                  labelStyle: const TextStyle(color: Color(0xFF222222)),
                  suffixStyle: const TextStyle(color: Color(0xFF222222)),
                  filled: true,
                  fillColor: const Color(0xFFE5E5E5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
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

            const SizedBox(height: 20),

            // * ANUNCIO
            TelaPrincipal().return_Anuncio(),

            const SizedBox(height: 18),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // * BOTÃO FRONTEND
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Filtrar()));
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

                // * BOTÃO BACKEND

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
  runApp(TelaPrincipal());
}
