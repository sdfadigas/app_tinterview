import 'package:app_tinterview/viewers/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/a11y-dark.dart';

class CodeInterviewPage extends StatelessWidget {
  final String code = '''
    // Exemplo de código em Python
    def calculate_sum(a, b):
      return a + b
    
    result = calculate_sum(3, 4)
    print(result)
  ''';

  final String output = '7'; // Resultado esperado do código

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2b2b),
      appBar: return_AppBar(),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 18.0),
            Text(
              'Código:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 18.0),
            Flexible(
              child: SingleChildScrollView(
                child: HighlightView(
                  code,
                  language: 'python',
                  theme: a11yDarkTheme,
                  padding: EdgeInsets.all(12.0),
                  textStyle: TextStyle(
                    fontFamily: 'Monospace',
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 300.0),
            Text(
              'Saída Esperada:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              output,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Monospace',
                fontSize: 26.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
