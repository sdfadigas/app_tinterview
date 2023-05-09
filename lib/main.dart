import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'database/db_firestore.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'viewers/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    //TODO: Igor, vi que em alguns projetos os Providers são implementados aqui:  https://www.youtube.com/watch?v=OTBR40yevG4&list=PL_wKlpKIC9vWubXsj3IRPZ2Rk6QMfsPPg&index=3&pp=iAQB

    const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
  DBFirestore().addData();
}
