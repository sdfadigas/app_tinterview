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
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFED00),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginTinterview()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 34),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 2.0,
                              child: Image.asset(
                                "images/logo.png",
                                width: 36,
                                height: 36,
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "Login com TInterview",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 4),
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
                      text: "Login com o GitHub",
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
                const Padding(padding: EdgeInsets.only(bottom: 4)),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TelaPrincipal()),
                      );
                    },
                    child: const Text('Iniciar como convidado',
                        style: TextStyle(
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                blurRadius: 8,
                                offset: Offset.zero,
                              ),
                            ],
                            color: Colors.white,
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
