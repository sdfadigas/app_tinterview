import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_tinterview/models/Cadastro.dart';
import 'package:app_tinterview/models/Usuario.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  // ignore: unused_field
  String _mensagemErro = "";
  final ValidadorCampos _validador = ValidadorCamposPadrao();

  void _validarCampos() {
    // recuperar dados dos campos
    String nome = _controllerNome.text.trim();
    String email = _controllerEmail.text.trim();
    String senha = _controllerSenha.text;

    if (_validador.validarNome(_controllerNome.text) &&
        _validador.validarEmail(_controllerEmail.text) &&
        _validador.validarSenha(_controllerSenha.text)) {
      Usuario usuario = Usuario();
      usuario.nome = nome;
      usuario.email = email;
      usuario.senha = senha;

      void _cadastrarUsuario() {
        FirebaseAuth auth = FirebaseAuth.instance;
        auth
            .createUserWithEmailAndPassword(
                email: usuario.email, password: usuario.senha)
            .then((firebaseUser) {
          setState(() {
            _mensagemErro = "Sucesso ao cadastrar";
          });
        }).catchError((error) {
          setState(() {
            _mensagemErro = "erro ao cadastrar";
          });
        });
      }

      _cadastrarUsuario();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TO: implement build
    throw UnimplementedError();
  }
}
