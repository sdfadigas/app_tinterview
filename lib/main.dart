import 'package:flutter/material.dart';
import 'package:app_tinterview/viewers/BackendPage.dart';
import 'package:app_tinterview/viewers/BancoDeDadosPage.dart';
import 'package:app_tinterview/viewers/ItensSalvosPage.dart';
import 'package:app_tinterview/viewers/MobilePage.dart';
import 'viewers/HomePage.dart';
import 'viewers/LoginPage.dart';
import 'viewers/SearchField.dart';
import 'viewers/FrontendPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: Home(),


    debugShowCheckedModeBanner: false,
  ));
}
