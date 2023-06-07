import 'package:app_tinterview/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_tinterview/models/Usuario.dart';
import 'package:provider/provider.dart';

class Cadastro extends StatelessWidget {
  Cadastro({Key? key}) : super(key: key);
  //
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  //
  final _keyForm = GlobalKey<FormState>();
  //
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UsuarioProvider>(context, listen: false);

    return ChangeNotifierProvider<Register>(
        create: (context) => Register(),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Cadastro'),
            ),
            body: Form(
              key: _keyForm,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _controllerNome,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite um Nome";
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _controllerEmail,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite um Email";
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _controllerSenha,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite uma senha";
                          }
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
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
                        child: const Text('Cadastrar ddd'),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
