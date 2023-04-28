import 'package:flutter/material.dart';

class ItensSalvosPage extends StatefulWidget {
  const ItensSalvosPage({Key? key}) : super(key: key);

  @override
  State<ItensSalvosPage> createState() => _ItensSalvosPageState();
}

class _ItensSalvosPageState extends State<ItensSalvosPage> {
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
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 16),

            Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.bookmark,
                  size: 40,
                  color: Color(0xFFD9D9D9)),

                ),
                Expanded(
                  child: Text(
                    "ITENS SALVOS",
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFFD9D9D9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
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
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(ItensSalvosPage());
}
