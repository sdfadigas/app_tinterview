import 'package:flutter/material.dart';
import 'package:app_tinterview/viewers/SearchField.dart';
import 'package:app_tinterview/viewers/ItensSalvosPage.dart';

class BackendPage extends StatefulWidget {
  @override
  _BackendPageState createState() => _BackendPageState();
}

class _BackendPageState extends State<BackendPage> {
  List<bool> _pressed = List.filled(17, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      appBar: AppBar(
        backgroundColor: Color(0xFF222222),
        centerTitle: true,
        title: Image.asset(
          "images/logo.png",
          width: 50,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchField()));
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ItensSalvosPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Ação do ícone de menu hamburguer
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
            Column(
              children: <Widget>[
                Text("BACK END",
                    style: TextStyle(
                        fontSize: 40,
                        color: Color(0xFFD9D9D9),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 18),
            Column(
              children: <Widget>[
                Text("Tipo de Entrevista",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFD9D9D9),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 18),
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[0] = !_pressed[0];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                        color:
                            _pressed[0] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[0]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Code Interview',
                        style: TextStyle(
                          color: _pressed[0]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[1] = !_pressed[1];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        color:
                            _pressed[1] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[1]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Entrevista Técnica',
                        style: TextStyle(
                          color: _pressed[1]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Column(
              children: <Widget>[
                Text("Senioridade",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFD9D9D9),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 18)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[2] = !_pressed[2];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color:
                            _pressed[2] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[2]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Estágio',
                        style: TextStyle(
                          color: _pressed[2]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[3] = !_pressed[3];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color:
                            _pressed[3] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[3]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Trainee',
                        style: TextStyle(
                          color: _pressed[3]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[4] = !_pressed[4];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color:
                            _pressed[4] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[4]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Junior',
                        style: TextStyle(
                          color: _pressed[4]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[5] = !_pressed[5];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color:
                            _pressed[5] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[5]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Pleno',
                        style: TextStyle(
                          color: _pressed[5]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[6] = !_pressed[6];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color:
                            _pressed[6] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[6]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Sênior',
                        style: TextStyle(
                          color: _pressed[6]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Column(
              children: <Widget>[
                Text("Linguagens",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFD9D9D9),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[7] = !_pressed[7];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                        color:
                            _pressed[7] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[7]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Java',
                        style: TextStyle(
                          color: _pressed[7]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[8] = !_pressed[8];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                        color:
                            _pressed[8] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[8]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Python',
                        style: TextStyle(
                          color: _pressed[8]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[9] = !_pressed[9];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                        color:
                            _pressed[9] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[9]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Ruby',
                        style: TextStyle(
                          color: _pressed[9]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[10] = !_pressed[10];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                        color: _pressed[10]
                            ? Color(0xFFD9D9D9)
                            : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[10]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'PHP',
                        style: TextStyle(
                          color: _pressed[10]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[11] = !_pressed[11];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                        color: _pressed[11]
                            ? Color(0xFFD9D9D9)
                            : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[11]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'C#',
                        style: TextStyle(
                          color: _pressed[11]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Column(
              children: <Widget>[
                Text("Frameworks",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFD9D9D9),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[12] = !_pressed[12];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                        color: _pressed[12]
                            ? Color(0xFFD9D9D9)
                            : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[12]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Django',
                        style: TextStyle(
                          color: _pressed[12]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[13] = !_pressed[13];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                        color: _pressed[13]
                            ? Color(0xFFD9D9D9)
                            : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[13]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Flask',
                        style: TextStyle(
                          color: _pressed[13]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[14] = !_pressed[14];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color: _pressed[14]
                            ? Color(0xFFD9D9D9)
                            : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[14]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'ASP.NET',
                        style: TextStyle(
                          color: _pressed[14]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[15] = !_pressed[15];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    width: 130,
                    height: 50,
                    decoration: BoxDecoration(
                        color: _pressed[15]
                            ? Color(0xFFD9D9D9)
                            : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[15]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Ruby on Rails',
                        style: TextStyle(
                          color: _pressed[15]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _pressed[16] = !_pressed[16];
                    }
                        // Ação do botão quando for clicado
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                        color: _pressed[16]
                            ? Color(0xFFD9D9D9)
                            : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[16]
                              ? Color(0xFFD9D9D9)
                             : Color(0xFF363533), width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Spring',
                        style: TextStyle(
                          color: _pressed[16]
                              ? Color(0xFF8A8787)
                              : Color(0xFFFAE800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Ação ao pressionar o botão
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFAE800),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    minimumSize: Size(100, 50),
                  ),
                  child: Text('APLICAR',
                      style: TextStyle(
                          color: Color(0xFF222222),
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 18),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(BackendPage());
}
