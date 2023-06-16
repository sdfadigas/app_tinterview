import 'package:app_tinterview/models/Usuario.dart';
import 'package:app_tinterview/service/AuthService.dart';
import 'package:app_tinterview/viewers/TelaPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:app_tinterview/viewers/LoginPage.dart';

import 'package:provider/provider.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    UsuarioProvider usuarioProvider = Provider.of<UsuarioProvider>(context);

    return FutureBuilder(
      future: Home(),
      builder: (context, snapshot) {
        if (auth.usuario == null) {
          return Login();
        } else if (usuarioProvider.id != '') {
          return TelaPrincipal();
        } else {
          return HomeFree();
        }
      },
    );
  }
}

Future<Widget> Home() async {
  print('teala aqui');
  Future.delayed(Duration(seconds: 10));

  return Scaffold(
    backgroundColor: const Color(0xFFFAE800),
    body: Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Image.asset(
                  "images/logoFull.png",
                  width: 300,
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget HomeFree() {
  print('teala aqui3');
  return Scaffold(
    backgroundColor: const Color(0xFFFAE800),
    body: Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Image.asset(
                  "images/logoFull.png",
                  width: 300,
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
