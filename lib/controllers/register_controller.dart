import 'package:app_tinterview/controllers/UserController.dart';
import 'package:app_tinterview/models/Usuario.dart';
import 'package:app_tinterview/service/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import '../viewers/TelaPrincipal.dart';

class Register extends ChangeNotifier {
  bool isLoading = false;

  registrar(UsuarioProvider value, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      await context.read<AuthService>().registrar(value.email!, value.senha!);
      value.id = Provider.of<AuthService>(context, listen: false).usuario!.uid;
      await Provider.of<UserController>(context, listen: false)
          .cadastrarUser(value);

      showMensageSuccess(context);

      isLoading = false;
    } on AuthException catch (e) {
      isLoading = false;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('erro: ${e.message}'),
        ),
      );
    }
    notifyListeners();
  }

  showMensageSuccess(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cadastro realizado com sucesso!!')),
    );

    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const TelaPrincipal()),
      (Route<dynamic> route) => false,
    );
  }
}
