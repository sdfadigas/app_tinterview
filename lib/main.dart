import 'package:app_tinterview/constant/constant.dart';
import 'package:app_tinterview/controllers/UserController.dart';
import 'package:app_tinterview/service/AuthService.dart';
import 'package:app_tinterview/viewers/AboutPage.dart';
import 'package:app_tinterview/viewers/LoginPage.dart';
import 'package:app_tinterview/viewers/TelaPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_tinterview/controllers/SavedQuestions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'models/Usuario.dart';
import 'viewers/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Provider.debugCheckInvalidValueType = null;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
            lazy: false, create: (context) => AuthService()),
        ChangeNotifierProvider<UsuarioProvider>(
            create: (context) => UsuarioProvider()),
        ProxyProvider2<AuthService, UsuarioProvider, UserController>(
          lazy: false,
          update: (context, auth, usuario, previous) =>
              UserController(auth.usuario, usuario, auth),
        ),
        ChangeNotifierProvider<SavedQuestionsProvider>(
            create: (context) => SavedQuestionsProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'RockoFLF'),
        debugShowCheckedModeBanner: false,
        routes: {
          //AQUI VAI SER ADICIONADO AS ROTAS DESSA FORMA ☻☻
          ConstantsRoute.HOME: (context) => const AuthCheck(),
          ConstantsRoute.TELA_PRINCIPAL: (context) => const TelaPrincipal(),
          ConstantsRoute.LOGIN: (context) => Login(),
          ConstantsRoute.ABOUT: (context) => AboutPage(),
        },
      ),
    ),
  );
  //DBFirestore().addData();
}
