import 'package:firebase_core/firebase_core.dart';
import 'database/db_firestore.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'viewers/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
  //DBFirestore().addData();
}
