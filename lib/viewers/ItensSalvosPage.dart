import 'package:app_tinterview/viewers/widgets/anuncio_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_tinterview/controllers/SavedQuestions.dart';
import 'package:app_tinterview/viewers/Perg_Resp.dart';
import 'package:provider/provider.dart';
import 'package:app_tinterview/viewers/widgets/appbar.dart';

class ItensSalvosPage extends StatelessWidget {
  const ItensSalvosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: return_AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 18),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.bookmark,
                    size: 40,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                Expanded(
                  child: Text(
                    "ITENS SALVOS",
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFFD9D9D9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            AnuncioWidget(),
            Consumer<SavedQuestionsProvider>(
              builder: (context, savedQuestionsProvider, _) {
                final savedQuestions = savedQuestionsProvider.savedQuestions;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: savedQuestions.length,
                  itemBuilder: (context, index) {
                    var question = savedQuestions[index];
                    return Container(
                      padding:
                          const EdgeInsets.only(top: 08, left: 10, right: 10),
                      child: ListTile(
                        minVerticalPadding: 8,
                        horizontalTitleGap: 14,
                        tileColor: const Color.fromARGB(255, 44, 42, 42),
                        minLeadingWidth: 30,
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundColor:
                              const Color.fromARGB(255, 41, 41, 41),
                          backgroundImage:
                              AssetImage("images/icons/${question.image}.png"),
                        ),
                        title: Text(
                          question.title,
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
                          question.subtitle,
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
                        trailing: const Icon(
                          Icons.bookmark,
                          color: Color.fromARGB(255, 126, 126, 126),
                        ),
                        isThreeLine: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PergResp(dados: question.data),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
