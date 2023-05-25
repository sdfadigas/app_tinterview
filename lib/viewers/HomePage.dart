import 'package:flutter/material.dart';
import 'package:app_tinterview/viewers/LoginPage.dart';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    _carregarApp();
  }

  Future<void> _carregarApp() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAE800),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "images/logoFull.png",
                    width: 300,
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}