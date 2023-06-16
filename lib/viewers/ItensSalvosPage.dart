import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_tinterview/viewers/Perg_Resp.dart';
import 'package:app_tinterview/viewers/widgets/appbar.dart';
import 'package:provider/provider.dart';
import 'package:app_tinterview/controllers/SavedQuestions.dart';

class ItensSalvosPage extends StatelessWidget {
  final String userUID;

  const ItensSalvosPage({required this.userUID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: return_AppBar(),
      backgroundColor: const Color(0xFF222222),
      body: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('usuarios')
              .doc(userUID)
              .collection('saved_questions')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text('Ocorreu um erro ao carregar os itens salvos'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            final savedQuestions = snapshot.data?.docs;

            if (savedQuestions == null || savedQuestions.isEmpty) {
              return Center(child: Text('Nenhum item salvo'));
            }

            return ListView.builder(
              itemCount: savedQuestions.length,
              itemBuilder: (context, index) {
                final questionID = savedQuestions[index].id;

                return Consumer<SavedQuestionsProvider>(
                  builder: (context, savedQuestionsProvider, _) {
                    final question = Question(documentName: questionID);
                    bool isSaved =
                        savedQuestionsProvider.isQuestionSaved(question);

                    return FutureBuilder<
                        DocumentSnapshot<Map<String, dynamic>>>(
                      future: FirebaseFirestore.instance
                          .collection('interview')
                          .doc(questionID)
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError || !snapshot.hasData) {
                          return SizedBox();
                        }

                        final questionData = snapshot.data!.data();

                        if (questionData == null) {
                          return SizedBox();
                        }

                        final imagem = questionData['filtros'] as List?;
                        final pergunta = questionData['pergunta'] as String?;
                        final resposta = questionData['resposta'] as String?;

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PergResp(
                                  dados: questionData,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 8, left: 10, right: 10),
                            child: ListTile(
                              minVerticalPadding: 8,
                              horizontalTitleGap: 14,
                              tileColor: const Color.fromARGB(255, 44, 42, 42),
                              minLeadingWidth: 30,
                              leading: CircleAvatar(
                                radius: 28,
                                backgroundColor:
                                    const Color.fromARGB(255, 41, 41, 41),
                                backgroundImage: AssetImage(
                                    "images/icons/${imagem?[1]}.png"),
                              ),
                              title: Text(
                                pergunta ?? '',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  height: 0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                resposta ?? '',
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
                                    savedQuestionsProvider
                                        .removeQuestion(question);
                                  } else {
                                    savedQuestionsProvider
                                        .saveQuestion(question);
                                  }
                                },
                                child: Icon(
                                  isSaved
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color: isSaved
                                      ? const Color.fromARGB(255, 126, 126, 126)
                                      : Colors.grey,
                                ),
                              ),
                              isThreeLine: true,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
