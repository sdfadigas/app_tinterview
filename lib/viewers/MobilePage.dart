import 'package:flutter/material.dart';
import 'package:app_tinterview/controllers/CustomDrawer.dart';

class MobilePage extends StatefulWidget {
  @override
  _MobilePageState createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  List<bool> _pressed = List.filled(13, false);

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
      ),
      endDrawer: CustomDrawer() ,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 18),
            InkWell(
              onTap: () {
                // Ação do anúncio quando for clicado
              },
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    'Anúncio',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: <Widget>[
                Text("MOBILE",
                    style: TextStyle(
                        fontSize: 40,
                        color: Color(0xFFD9D9D9),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 22),
              alignment: Alignment.centerLeft,
              child: Text("Tipo de Entrevista",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFD9D9D9),
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 18),
            Container(
              padding: EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        _pressed[0] = !_pressed[0];
                      }
                        // Ação do botão quando for clicado
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 16),
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                        color:
                        _pressed[0] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[0]
                              ? Color(0xFFD9D9D9)
                              : Color(0xFF363533),
                        ),
                        boxShadow: _pressed[0]
                            ? [
                          BoxShadow(
                            color: Colors.white24.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          )
                        ]
                            : null,
                      ),
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
                      width: 170,
                      height: 50,
                      decoration: BoxDecoration(
                        color:
                        _pressed[1] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[1]
                              ? Color(0xFFD9D9D9)
                              : Color(0xFF363533),
                          width: 2,
                        ),
                        boxShadow: _pressed[1]
                            ? [
                          BoxShadow(
                            color: Colors.white24.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          )
                        ]
                            : null,
                      ),
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
            ),
            SizedBox(height: 18),
            Container(
                padding: EdgeInsets.only(left: 24),
                alignment: Alignment.centerLeft,
                child: Text("Senioridade",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFD9D9D9),
                        fontWeight: FontWeight.bold))),
            SizedBox(height: 18),
            Container(
              padding: EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              child: Row(
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
                      margin: EdgeInsets.only(right: 22),
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color:
                        _pressed[2] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[2]
                              ? Color(0xFFD9D9D9)
                              : Color(0xFF363533),
                          width: 2,
                        ),
                        boxShadow: _pressed[2]
                            ? [
                          BoxShadow(
                            color: Colors.white24.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          )
                        ]
                            : null,
                      ),
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
                              : Color(0xFF363533),
                          width: 2,
                        ),
                        boxShadow: _pressed[3]
                            ? [
                          BoxShadow(
                            color: Colors.white24.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          )
                        ]
                            : null,
                      ),
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
                      margin: EdgeInsets.only(left: 22, right: 22),
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color:
                        _pressed[4] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[4]
                              ? Color(0xFFD9D9D9)
                              : Color(0xFF363533),
                          width: 2,
                        ),
                        boxShadow: _pressed[4]
                            ? [
                          BoxShadow(
                            color: Colors.white24.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          )
                        ]
                            : null,
                      ),
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
            ),
            SizedBox(height: 18),
            Row(
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
                    margin: EdgeInsets.only(left: 24),
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color:
                      _pressed[5] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color:
                        _pressed[5] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        width: 2,
                      ),
                      boxShadow: _pressed[5]
                          ? [
                        BoxShadow(
                          color: Colors.white24.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(2, 2),
                        )
                      ]
                          : null,
                    ),
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
                    margin: EdgeInsets.only(left: 22, right: 22),
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color:
                      _pressed[6] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color:
                        _pressed[6] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        width: 2,
                      ),
                      boxShadow: _pressed[6]
                          ? [
                        BoxShadow(
                          color: Colors.white24.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(2, 2),
                        )
                      ]
                          : null,
                    ),
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
            Container(
              padding: EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              child: Text("Linguagens",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFD9D9D9),
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 18),
            Row(
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
                    margin: EdgeInsets.only(left: 24),
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color:
                      _pressed[7] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color:
                        _pressed[7] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        width: 2,
                      ),
                      boxShadow: _pressed[7]
                          ? [
                        BoxShadow(
                          color: Colors.white24.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(2, 2),
                        )
                      ]
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        'Swift',
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
                    margin: EdgeInsets.only(left: 22, right: 22),
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color:
                        _pressed[8] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[8]
                              ? Color(0xFFD9D9D9)
                              : Color(0xFF363533),
                          width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Kotlin',
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
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color:
                      _pressed[9] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color:
                        _pressed[9] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                        width: 2,
                      ),
                      boxShadow: _pressed[9]
                          ? [
                        BoxShadow(
                          color: Colors.white24.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(2, 2),
                        )
                      ]
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        'Dart',
                        style: TextStyle(
                          color: _pressed[9]
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
            Container(
              padding: EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              child: Text("Frameworks",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFD9D9D9),
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 18),
            Row(children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    _pressed[10] = !_pressed[10];
                  }
                    // Ação do botão quando for clicado
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 24),
                  width: 110,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _pressed[10] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color:
                      _pressed[10] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                      width: 2,
                    ),
                    boxShadow: _pressed[10]
                        ? [
                      BoxShadow(
                        color: Colors.white24.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(2, 2),
                      )
                    ]
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      'React Native',
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
                  margin: EdgeInsets.only(left: 22, right: 22),
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _pressed[11] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color:
                      _pressed[11] ? Color(0xFFD9D9D9) : Color(0xFF363533),
                      width: 2,
                    ),
                    boxShadow: _pressed[11]
                        ? [
                      BoxShadow(
                        color: Colors.white24.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(2, 2),
                      )
                    ]
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      'Flutter',
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
              SizedBox(height: 22),
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
                      width: 110,
                      height: 50,
                      decoration: BoxDecoration(
                        color: _pressed[12]
                            ? Color(0xFFD9D9D9)
                            : Color(0xFF363533),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _pressed[12]
                              ? Color(0xFFD9D9D9)
                              : Color(0xFF363533),
                          width: 2,
                        ),
                        boxShadow: _pressed[12]
                            ? [
                          BoxShadow(
                            color: Colors.white24.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          )
                        ]
                            : null,
                      ),
                      child: Center(
                        child: Text(
                          'RubyMotion',
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
                ],
              ),
            ]),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      for (int i = 0; i < _pressed.length; i++) {
                        _pressed[i] = false;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    minimumSize: Size(120, 50),
                  ),
                  child: Text('LIMPAR',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 22),
                ElevatedButton(
                  onPressed: () {
                    // Ação ao pressionar o botão
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFAE800),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    minimumSize: Size(120, 50),
                  ),
                  child: Text('APLICAR',
                      style: TextStyle(
                          color: Color(0xFF222222),
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            SizedBox(height: 18),
          ],
        ),
      ),
    );



  }
}

void main() {
  runApp(MobilePage());
}
