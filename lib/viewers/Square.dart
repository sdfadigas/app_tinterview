import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_tinterview/controllers/CustomDrawer.dart';
import 'package:app_tinterview/controllers/SavedQuestions.dart';
import './Perg_Resp.dart';
import 'package:app_tinterview/viewers/widgets/appbar.dart';
import 'package:flutter/foundation.dart';

class Square extends StatelessWidget {
  final Stream dados_bd;

  const Square({Key? key, required this.dados_bd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SavedQuestionsProvider>(
        builder: (context, savedQuestionsProvider, _) {
      return Scaffold(
        backgroundColor: const Color(0xFF222222),
        appBar: return_AppBar(),
        endDrawer: const CustomDrawer(),
        body: StreamBuilder(
          stream: dados_bd,
          builder: (context, AsyncSnapshot snapshot) {
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
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var dados = snapshot.data!.docs[index];
                List imagem = dados['filtros'];
                String pergunta = dados["pergunta"];
                String resposta = dados["resposta"];

                return Container(
                  padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
                  child: Consumer<SavedQuestionsProvider>(
                    builder: (context, savedQuestionsProvider, _) {
                      final question = Question(documentName: dados.id);
                      bool isSaved =
                          savedQuestionsProvider.isQuestionSaved(question);

                      return ListTile(
                        minVerticalPadding: 8,
                        horizontalTitleGap: 14,
                        tileColor: const Color.fromARGB(255, 44, 42, 42),
                        minLeadingWidth: 30,
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundColor:
                              const Color.fromARGB(255, 41, 41, 41),
                          backgroundImage: AssetImage(
                              "assets/images/icons/${imagem[1]}.png"),
                        ),
                        title: Text(
                          pergunta,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            height: 0,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          resposta,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            if (isSaved) {
                              savedQuestionsProvider.removeQuestion(question);
                            } else {
                              savedQuestionsProvider.saveQuestion(question);
                            }
                          },
                          child: Icon(
                            isSaved ? Icons.bookmark : Icons.bookmark_border,
                            color: isSaved
                                ? const Color.fromARGB(255, 126, 126, 126)
                                : Colors.grey,
                          ),
                        ),
                        isThreeLine: true,
                        onTap: () {
                          PergResp pergResp = PergResp(
                            dados: dados,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => pergResp),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      );
    });
  }
}
