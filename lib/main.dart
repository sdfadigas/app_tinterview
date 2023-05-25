import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_tinterview/controllers/SavedQuestions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'viewers/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (context) => SavedQuestionsProvider(),
      child: const MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
  //DBFirestore().addData();
}
