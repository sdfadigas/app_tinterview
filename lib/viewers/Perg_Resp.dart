import 'package:flutter/material.dart';
import '../controllers/CustomDrawer.dart';
import 'package:app_tinterview/viewers/widgets/appbar.dart';

// ignore: must_be_immutable
class PergResp extends StatelessWidget {
  var dados;

  PergResp({super.key, required this.dados});

  @override
  Widget build(BuildContext context) {
    List imagem = dados['filtros'];
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: return_AppBar(),
      endDrawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: const Color.fromARGB(255, 41, 41, 41),
              backgroundImage:
                  AssetImage("assets/images/icons/${imagem[1]}.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              dados["pergunta"],
              textAlign: TextAlign.center,
              maxLines: 1000,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child:
                Divider(height: 10, color: Color.fromARGB(255, 151, 146, 146)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              dados["resposta"],
              textAlign: TextAlign.justify,
              maxLines: 10000,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 25,
                  fontWeight: FontWeight.w200),
            ),
          ),
        ]),
      ),
    );
  }
}
