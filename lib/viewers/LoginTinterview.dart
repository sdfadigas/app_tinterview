import 'package:app_tinterview/constant/constant.dart';
import 'package:app_tinterview/service/AuthService.dart';
import 'package:app_tinterview/viewers/Cadastro.dart';
import 'package:app_tinterview/viewers/TelaPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class LoginTela extends StatelessWidget {
  LoginTela({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';

  final snackBar = const SnackBar(
    content: Text("Usuario e senha incorreto"),
  );

  @override
  Widget build(BuildContext context) {

      _login() async {
      try {
        await context.read<AuthService>().login(_emailController.text, _passwordController.text);
        Navigator.pushNamed(context, ConstantsRoute.TELA_PRINCIPAL);
      } on AuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Entrar'),
            ),
            SizedBox(height: 16.0),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cadastro()),
                );
              },
              child: Text('Cadastrar'),
            ),
            SizedBox(height: 16.0),
            Text(
              _errorMessage,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
