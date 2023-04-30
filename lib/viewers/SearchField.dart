import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:app_tinterview/viewers/BackendPage.dart';
import 'package:app_tinterview/viewers/BancoDeDadosPage.dart';
import 'package:app_tinterview/viewers/FrontendPage.dart';
import 'package:app_tinterview/viewers/MobilePage.dart';
import 'package:app_tinterview/controllers/CustomDrawer.dart';

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      appBar: AppBar(
        backgroundColor: Color(0xFF222222),
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
      endDrawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Digite sua busca',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  suffixIcon: Icon(Icons.search, color: Colors.grey),
                  labelStyle: TextStyle(color: Color(0xFF222222)),
                  suffixStyle: TextStyle(color: Color(0xFF222222)),
                  filled: true,
                  fillColor: Color(0xFFE5E5E5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(FlutterIcons.js_faw5d),
                  iconSize: 48,
                  color: Color(0xFFeeeeee),
                  onPressed: () {
                    // Ação do ícone
                  }, // Ícone JavaScript
                ),
                IconButton(
                    icon: Icon(FlutterIcons.html5_faw5d), // Ícone HTML
                    iconSize: 48,
                    color: Color(0xFFeeeeee),
                    onPressed: () {
                      // Ação do ícone
                    }),
                IconButton(
                    icon: Icon(FlutterIcons.css3_alt_faw5d), // Ícone HTML
                    iconSize: 48,
                    color: Color(0xFFeeeeee),
                    onPressed: () {
                      // Ação do ícone
                    }),
                IconButton(
                    icon: Icon(FlutterIcons.python_faw5d), // Ícone HTML
                    iconSize: 48,
                    color: Color(0xFFeeeeee),
                    onPressed: () {
                      // Ação do ícone
                    }),
                IconButton(
                    icon: Icon(FlutterIcons.java_faw5d), // Ícone HTML
                    iconSize: 48,
                    color: Color(0xFFeeeeee),
                    onPressed: () {
                      // Ação do ícone
                    }),
              ],
            ),
            SizedBox(height: 18),
            InkWell(
              onTap: () {
                // Ação do anúncio quando for clicado
                print('Anúncio clicado!');
              },
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    'Anúncio', // Conteúdo da caixa de anúncio
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),
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
                            offset: Offset(2,2)
                        )

                      ],
                      color: Color(0xFF363533),
                    ),
                    child: Center(
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
                            offset: Offset(-2, 2))
                      ],
                      color: Color(0xFF363533),
                    ),
                    child: Center(
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
              SizedBox(height: 18),
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
                          color: Color(0xFF363533),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 1,
                                offset: Offset(2, -2))
                          ]),
                      child: Center(
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
                              offset: Offset(-2, -2))
                        ],
                        color: Color(0xFF363533),
                      ),
                      child: Center(
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
            SizedBox(height: 22)
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(SearchField());
}
