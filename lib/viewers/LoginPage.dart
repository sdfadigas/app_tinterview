import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:app_tinterview/viewers/SearchField.dart';
import 'package:app_tinterview/models/LoginLogoutGoogle.dart';


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
                      width: 120,
                      height: 120,
                    ))),


               Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 4),
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
                            MaterialPageRoute(builder: (context) => SearchField()),
                          );
                        }
                      },
                    ),
                  ),
                )
                ,
                Padding(padding: EdgeInsets.only(top: 16, bottom: 4)),
                Center(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchField()));
                  },
                  child: Text('Iniciar como convidado',
                      style: TextStyle(
                          color: Color(0xFFE7D110),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                )),
              ],
            ),
          ))),
    );
  }
}
