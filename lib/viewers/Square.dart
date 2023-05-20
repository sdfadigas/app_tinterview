import 'package:app_tinterview/viewers/TelaPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_tinterview/database/db_firestore.dart';
import '../controllers/CustomDrawer.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import './Perg_Resp.dart';

class Square extends StatelessWidget {
  var linguagem;

  Square({required this.linguagem});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),

      appBar: TelaPrincipal().return_AppBar(),
      endDrawer: const CustomDrawer(),

      body: StreamBuilder(
        stream: DBFirestore()
            .firestore()
            .collection('interview')
            .where("filtros", arrayContains: "$linguagem")
            .snapshots(),
        builder: (builder, AsyncSnapshot snapshot) {
          //Future.delayed(const Duration(seconds: 3));
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Color.fromARGB(255, 252, 220, 116),
                valueColor: new AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 235, 180, 1),
                ),
              ),
            );
          return ListView.builder(
            //itemExtent: 80.0,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var dados = snapshot.data!.docs[index]
                  //as Map<String, dynamic>
                  ;
              return Container(
                padding: EdgeInsets.only(top: 08, left: 10, right: 10),
                //alignment: Alignment.center,
                child: ListTile(
                  minVerticalPadding: 8,
                  horizontalTitleGap: 14,
                  tileColor: Color.fromARGB(255, 44, 42, 42),
                  //visualDensity: VisualDensity(),
                  minLeadingWidth: 30,
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundColor: Color.fromARGB(255, 41, 41, 41),
                    backgroundImage:
                        AssetImage("images/icons/${linguagem}.png"),
                  ),
                  title: Text(
                    dados["pergunta"],
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        height: 0,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),

                  subtitle: Text(
                    dados["resposta"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14,
                        fontWeight: FontWeight.w200),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  trailing: Icon(Icons.bookmark, color: Color.fromARGB(255, 126, 126, 126)),
                  isThreeLine: true,
                  onTap: () {
                    PergResp pergResp = PergResp(dados: dados, linguagem: linguagem,);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => pergResp),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}












/*     return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 400,
        color: Colors.amber,
        child: Center(
            child: Text(
          style: const TextStyle(fontSize: 24, color: Color.fromARGB(255, 156, 80, 80)),

        )),
      ),
    );
  }
}


*/
