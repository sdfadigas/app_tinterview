import 'package:app_tinterview/viewers/widgets/appbar.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: return_AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(46.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TInterview - Preparação para Entrevistas de Emprego',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'TInterview é um aplicativo revolucionário criado especificamente para preparar desenvolvedores para entrevistas de emprego na área da programação. Com recursos abrangentes, um conjunto diversificado de perguntas e um ambiente de simulação realista, o TInterview está aqui para ajudá-lo a ter sucesso em suas entrevistas e garantir sua trajetória profissional na programação.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 30),
                Text(
                  'Recursos Principais:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Bancos de Perguntas Abrangentes:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'O TInterview possui uma vasta coleção de perguntas frequentes e desafiadoras, compiladas a partir de várias empresas de renome em todo o mundo. Você terá acesso a uma ampla gama de tópicos, como algoritmos, estruturas de dados, programação orientada a objetos, desenvolvimento web e muito mais. Domine cada conceito essencial e esteja preparado para qualquer pergunta que possa surgir durante a entrevista.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  'Ambiente de Simulação Realista:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Prepare-se para o ambiente de uma entrevista real através do recurso de simulação do TInterview. Você terá a oportunidade de praticar suas habilidades em uma configuração virtual, onde poderá resolver problemas, escrever código e explicar suas soluções como se estivesse participando de uma entrevista presencial. Com feedback instantâneo, você poderá aprimorar suas respostas e ganhar confiança para enfrentar qualquer desafio.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  'Personalização e Acompanhamento:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'O TInterview se adapta às suas necessidades individuais. Você poderá personalizar seu plano de estudos com base em suas áreas de interesse, nível de experiência e as empresas específicas para as quais deseja se candidatar. O aplicativo também permite acompanhar seu progresso, fornecendo estatísticas detalhadas sobre seu desempenho e destacando as áreas que precisam de mais atenção.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  'Recursos de Aprendizagem Adicionais:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Além das perguntas e simulações de entrevistas, o TInterview oferece acesso a uma rica biblioteca de recursos de aprendizagem, como artigos, tutoriais em vídeo e exemplos de código. Aproveite esses materiais para aprimorar seus conhecimentos e se manter atualizado com as tendências atuais no campo da programação.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  'Comunidade Ativa:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Junte-se a uma comunidade vibrante de desenvolvedores como você, compartilhando dicas, experiências e oferecendo suporte mútuo. O TInterview permite que você se conecte com outros usuários, participe de discussões e até mesmo agende sessões de estudo em grupo para aprimorar suas habilidades de entrevista.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 30),
                Text(
                  'Esteja pronto para enfrentar qualquer entrevista de emprego na área da programação com confiança, graças ao TInterview. Baixe o aplicativo agora e dê um impulso em sua carreira como desenvolvedor, conquistando as melhores oportunidades profissionais disponíveis no mercado. Sua jornada para o sucesso começa aqui!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AboutPage(),
  ));
}
