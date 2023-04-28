import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:app_tinterview/viewers/CadastroPage.dart';
import 'package:app_tinterview/viewers/SearchField.dart';
import 'package:app_tinterview/controllers/LoginSocial.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController _loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF323232),
      body: Container(
          padding: EdgeInsets.all(16),
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                (Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Image.asset(
                      "images/logo.png",
                      width: 100,
                      height: 100,
                    ))),


                Padding(
                    padding: EdgeInsets.only(top: 12, bottom: 4),
                    child: SignInButton(Buttons.Google,
                        text: "Login com o Google", onPressed: () async {
                      final user = await _loginController.signInWithGoogle();

                      if (user != null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchField()));
                      }
                    })),
                Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: SignInButton(
                      Buttons.GitHub,
                      text: "Login com o GitHUb",
                      onPressed: () {
                        //instanciar a função de login com o github
                      },
                    )),
                Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: SignInButton(
                      Buttons.Facebook,
                      text: "Login com o Facebook",
                      onPressed: () {
                        //instanciar a função de login com o facebook
                      },
                    )),
                Center(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchField()));
                  },
                  child: Text('Iniciar como convidado',
                      style: TextStyle(
                          color: Color(0xFFE7D110),
                          fontWeight: FontWeight.bold)),
                )),
              ],
            ),
          ))),
    );
  }
}
