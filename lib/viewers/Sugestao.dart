import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_tinterview/database/db_firestore.dart';
import '../controllers/CustomDrawer.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import './Perg_Resp.dart';

class Sugestao extends StatelessWidget {
  String pesquisa;
  List<String> linguagem = [];

  funcao(pesquisa) {
    linguagem.add(pesquisa.toUpperCase());
    return linguagem;
  }

  Sugestao({required this.pesquisa});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
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
            .where("filtros", arrayContains: funcao(pesquisa))
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

              if (pesquisa.isNotEmpty) {
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
                      //backgroundImage: AssetImage("images/icons/${linguagem}.png"),
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
                    trailing: Icon(Icons.bookmark,
                        color: Color.fromARGB(255, 126, 126, 126)),
                    isThreeLine: true,
                    onTap: () {
                      //PergResp pergResp = PergResp(dados: dados, linguagem: ,);
                      //Navigator.push(
                      //  context,
                      //  MaterialPageRoute(builder: (context) => pergResp),
                      //);
                    },
                  ),
                );
              }
              /*  if (dados["$pesquisa"]
                  .toString()
                  .toLowerCase()
                  .startsWith(pesquisa.toLowerCase())) {
              } */
            },
          );
        },
      ),
    );
  }
}


           /* if(data['name'].toString().startsWith(name.toLowerCase())){
               return ListTile(
              title: Text(
                data['name'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.amber,
                fontSize: 16,
                fontWeight: FontWeight.bold),
                ),
                subtitle: Text(,
                data['email'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(data['image']),
              ),
            );
          }
            } 
            return Container();
          });
          },
      ));
  }
} */