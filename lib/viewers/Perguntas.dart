import 'package:flutter/material.dart';
import 'package:app_tinterview/database/db_firestore.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';

import '../controllers/CustomDrawer.dart';

class Perguntas extends StatelessWidget {
  var dados;
  
  Perguntas({required this.dados});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      backgroundColor: const Color(0xFF222222),
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        // TODO: ICONE "FAVORITOS"
      ),
      endDrawer: const CustomDrawer(),

body: ListView(
        //physics: NeverScrollableScrollPhysics(),
        children: [ 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              color: Colors.amber,
              child: Center(
                child: Text(
                  "$dados",
                  style: const TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}