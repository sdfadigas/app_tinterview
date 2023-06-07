import 'package:app_tinterview/viewers/LoginTinterview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:app_tinterview/viewers/TelaPrincipal.dart';
import 'package:app_tinterview/models/LoginLogoutGoogle.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF323232),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                (Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Image.asset(
                      "images/logo.png",
                      width: 120,
                      height: 120,
                    ))),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 4),
                  child: SizedBox(
                    width: double.infinity,
                    child: SignInButton(
                      Buttons.Google,
                      text: "Login com o Google",
                      onPressed: () async {
                        final user = await _loginController.signInWithGoogle();

                        if (user != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TelaPrincipal()),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: SignInButton(
                      Buttons.GitHub,
                      text: "Login com o GitHUb",
                      onPressed: () {
                        //instanciar a função de login com o github
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: SignInButton(
                      Buttons.Facebook,
                      text: "Login com o Facebook",
                      onPressed: () {
                        //instanciar a função de login com o facebook
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: SignInButton(
                      Buttons.Tumblr,
                      text: "Login com TInterview",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginTela()));
                      },
                    )),
                const Padding(padding: EdgeInsets.only(top: 16, bottom: 4)),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TelaPrincipal()));
                    },
                    child: const Text('Iniciar como convidado',
                        style: TextStyle(
                            color: Color(0xFFE7D110),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
