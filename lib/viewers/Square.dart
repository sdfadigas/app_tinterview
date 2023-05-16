import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_tinterview/database/db_firestore.dart';
import '../controllers/CustomDrawer.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import './Perg_Resp.dart';

class Square extends StatelessWidget {
  final String linguagem;

  Square({required this.linguagem});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      /*appBar: AppBar(title: Card(
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search), hintText: "Pesquisar"), onChanged: (val){
              setState(() {
                var name = val;
              });
            }, 
          ),)
      ),*/

      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        title: Row(
          children: <Widget>[
            Image.asset(
              "images/logo.png",
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
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
                /* decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),  */

                color: Color.fromARGB(31, 27, 26, 26),
                padding: EdgeInsets.only(
                  top: 08,
                  left: 10,
                  right: 10,
                ),
                alignment: Alignment.center,
                //itemExtend: 100.0,

                child: ListTile(
                  tileColor: Color.fromARGB(255, 29, 29, 29),
                  //visualDensity: VisualDensity(),

                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 37, 37, 37),
                    backgroundImage:
                        AssetImage("images/icons/${linguagem}.png"),
                  ),
                  title: Text(
                    dados["pergunta"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
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
                  //trailing: Icon(Icons.bookmark, color: Color.fromARGB(255, 126, 126, 126)),
                  onTap: () {
                     PergResp pergResp = PergResp(dados: dados,);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pergResp
                              //PergResp(), //levado para próxima tela com os dados da linguagem
                        ));
                  },
                ),
              );
            },
            //return Container();
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
