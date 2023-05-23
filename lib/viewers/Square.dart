import 'package:app_tinterview/viewers/TelaPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:app_tinterview/database/db_firestore.dart';
import '../controllers/CustomDrawer.dart';
import './Perg_Resp.dart';

class Square extends StatelessWidget {
  var dados_bd;

  Square({
    super.key,
    required this.dados_bd,
  });

  @override
  Widget build(BuildContext context) {
    //dados_bd as Stream; //String linguagem;

    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: TelaPrincipal().return_AppBar(),
      endDrawer: const CustomDrawer(),
      body: StreamBuilder(
        stream: dados_bd,
        builder: (builder, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Color.fromARGB(255, 252, 220, 116),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 235, 180, 1),
                ),
              ),
            );
          }
          return ListView.builder(
            //itemExtent: 80.0,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var dados = snapshot.data!.docs[index];
              List imagem = dados['filtros'];
              return Container(
                padding: const EdgeInsets.only(top: 08, left: 10, right: 10),
                //alignment: Alignment.center,
                child: ListTile(
                  minVerticalPadding: 8,
                  horizontalTitleGap: 14,
                  tileColor: const Color.fromARGB(255, 44, 42, 42),
                  //visualDensity: VisualDensity(),
                  minLeadingWidth: 30,
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundColor: const Color.fromARGB(255, 41, 41, 41),
                    backgroundImage:
                        AssetImage("images/icons/${imagem[1]}.png"),
                  ),
                  title: Text(
                    dados["pergunta"],
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        height: 0,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),

                  subtitle: Text(
                    dados["resposta"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14,
                        fontWeight: FontWeight.w200),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  trailing: const Icon(Icons.bookmark,
                      color: Color.fromARGB(255, 126, 126, 126)),
                  isThreeLine: true,
                  onTap: () {
                    PergResp pergResp = PergResp(
                      dados: dados,
                      //linguagem: dados["filtros[1]"],
                    );
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
