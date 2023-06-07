import 'package:app_tinterview/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_tinterview/models/Usuario.dart';
import 'package:provider/provider.dart';

class Cadastro extends StatefulWidget {
  Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();

  final _keyForm = GlobalKey<FormState>();

  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UsuarioProvider>(context, listen: false);

    return ChangeNotifierProvider<Register>(
      create: (context) => Register(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Color(0xFF323232),
          body: SingleChildScrollView(
            // Adicionado SingleChildScrollView
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Por favor, preencha o formulário abaixo para criar uma conta.',
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                  SizedBox(height: 70.0),
                  Form(
                    key: _keyForm,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _controllerNome,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Digite um Nome';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Nome',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _controllerEmail,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Digite um Email';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _controllerSenha,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Digite uma Senha';
                            }
                            return null;
                          },
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_keyForm.currentState!.validate()) {
                                _user.nome = _controllerNome.text;
                                _user.email = _controllerEmail.text;
                                _user.senha = _controllerSenha.text;

                                await context
                                    .read<Register>()
                                    .registrar(_user, context);
                              }
                            },
                            child: Text('Cadastrar'),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFFED00),
                              onPrimary: Colors.black,
                              elevation: 2,
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
