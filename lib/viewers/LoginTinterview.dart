import 'package:app_tinterview/constant/constant.dart';
import 'package:app_tinterview/service/AuthService.dart';
import 'package:app_tinterview/viewers/Cadastro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginTinterview extends StatelessWidget {
  LoginTinterview({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  final snackBar = const SnackBar(
    content: Text(
      "Usuário e/ou senha incorretos",
      style: TextStyle(
        color: Colors.red,
        fontSize: 22.0,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    _login() async {
      try {
        await context
            .read<AuthService>()
            .login(_emailController.text, _passwordController.text);
        Navigator.pushNamedAndRemoveUntil(
          context,
          ConstantsRoute.TELA_PRINCIPAL,
          (Route<dynamic> route) => false,
        );
        // ignore: unused_catch_clause
      } on AuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF323232),
      body: SingleChildScrollView(
        // Adicionado SingleChildScrollView
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Por favor, faça login para aproveitar todas as nossas funcionalidades.',
                style: TextStyle(
                  color: Colors.white54,
                ),
              ),
              const SizedBox(height: 70.0),
              TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                ),
              ),
              const SizedBox(height: 26.0),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFFED00),
                    onPrimary: Colors.black,
                    elevation: 2,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 26.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Não tem conta? ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cadastro()),
                      );
                    },
                    child: const Text(
                      'Registre-se agora',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                _errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
