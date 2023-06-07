import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: returnAppBar(),
      body: Center(
        child: Text(
          'Sobre',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  AppBar returnAppBar() {
    return AppBar(
      title: Text(
        'Sobre',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AboutPage(),
  ));
}
