import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exemplo de Tela'),
        ),
        body: const Center(
          child: Text(
            'Olá, mundo!',
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
    );
  }
}
