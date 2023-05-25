import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_tinterview/models/Usuario.dart';
import 'package:app_tinterview/models/Cadastro.dart';



class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}


class _CadastroState extends State<Cadastro> {

  // controladores
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";
  final ValidadorCampos _validador = ValidadorCamposPadrao();

  void _validarCampos() {
    // recuperar dados dos campos
    String nome = _controllerNome.text.trim();
    String email = _controllerEmail.text.trim();
    String senha = _controllerSenha.text;

    void _validarCampos() {
      if (_validador.validarNome(_controllerNome.text) &&
          _validador.validarEmail(_controllerEmail.text) &&
          _validador.validarSenha(_controllerSenha.text)) {
        Usuario usuario = Usuario();
        usuario.nome = nome;
        usuario.email = email;
        usuario.senha = senha;

        _cadastrarUsuario() {
          FirebaseAuth auth = FirebaseAuth.instance;
          auth
              .createUserWithEmailAndPassword(
              email: usuario.nome, password: usuario.senha)
              .then((firebaseUser) {
            setState(() {
              _mensagemErro = "Sucesso ao cadastrar";
            });
          }).catchError((error) {
            setState(() {
              setState(() {
                _mensagemErro = "erro ao cadastrar";
              });
            });
          });
        }
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
      ),
      backgroundColor: const Color(0xFF323232),
      body: Container(
          padding: const EdgeInsets.all(16),
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                (Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Image.asset(
                      "images/logo.png",
                      width: 70,
                      height: 70,
                    ))),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerNome,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 20, color: Color(0xFFEEEEEE)),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(
                        32,
                        16,
                        32,
                        16,
                      ),
                      hintText: "Nome",
                      hintStyle: const TextStyle(color: Color(0xFFE7D110)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFE7D110)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 20, color: Color(0xFFEEEEEE)),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(
                        32,
                        16,
                        32,
                        16,
                      ),
                      hintText: "Email",
                      hintStyle: const TextStyle(color: Color(0xFFE7D110)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFE7D110)),
                      ),
                    ),
                  ),
                ),
                TextField(
                  controller: _controllerSenha,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(fontSize: 20, color: Color(0xFFEEEEEE)),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(
                      32,
                      16,
                      32,
                      16,
                    ),
                    hintText: "Senha",
                    hintStyle: const TextStyle(color: Color(0xFFE7D110)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFFE7D110),
                        width: 5.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE7D110)),
                      onPressed: () {
                        _validarCampos();
                      },
                      child: const Text(
                        "Cadastrar",
                        style:
                            TextStyle(color: Color(0xFF323232), fontSize: 20),
                      )),
                ),
                Center(
                    child: Text(_mensagemErro,
                        style: const TextStyle(color: Colors.red, fontSize: 20)))
              ],
            ),
          ))),
    );
  }
}
