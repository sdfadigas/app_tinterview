// ignore_for_file: empty_constructor_bodies

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DBFirestore {
  //List lista_techs = [];
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; //recuperando instancia do FB

  firestore() {
    return _firestore;
  }

  // * Exportando ao banco
  addData() async {
    int i = 1;
    for (var element in data) {
      _firestore.collection('interview').doc(i.toString()).set(element);
      i += 1;
    }
  }

  // * CONSULTA SIMPLES: Recebe: uma linguaem | Retorna List Map com perguntas que a contém em "filtros:".
  /*
  Future queryTech(linguagem) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection("interview")
        .where("filtros", arrayContains: "$linguagem")
        //.orderBy("filtros: junior").orderBy("filtros: estágio").orderBy("filtros: senior").orderBy("filtros: pleno")
        .get();  //print("$linguagem");
    late var dados;
    for (DocumentSnapshot item in querySnapshot.docs) {
      dados = item.data(); print(dados);
      }
    return Future.value(dados);
    }     
    //dados as Map;
    //var list = []; //print(dados as Map); //
    //print(("${dados["pergunta"]}"));
    //list = dados.entries.map((e) => Customer(e.key, e.value)).toList();
    //print(dados);
    
 

  */

  // * CONSULTA COMPLEXA: SearchField





  

  // * Lista de linguagens:
  List lista_techs = [
    "PYTHON",
    "FLUTTER",
    'JAVA',
    'CSS',
    'ANGULAR',
    'HTML',
    'JAVASCRIPT',
    "RUBY"
  ];

  // * Lista de perguntas para subir ao banco:
  List<Map<String, dynamic>> data = [
    {
    "pergunta": "O que é Angular?",
    "resposta": "Angular é um framework para construção de aplicativos web, desenvolvido pela equipe do Google. Ele permite criar aplicativos web dinâmicos, SPA (Single Page Applications) e mobile com uma sintaxe clara e concisa em TypeScript, que é um superset do JavaScript. O Angular é baseado em componentes, onde cada componente possui seu próprio template HTML, estilo e comportamento, o que permite criar aplicativos modulares e escaláveis. Ele também oferece recursos como injeção de dependência, rotea,mento, validação de formulários e integração com o back-end de serviços web.",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "JUNIOR"
        
    ]
  },
  {
    "pergunta": "Para que serve o Angular?",
    "resposta": "O Angular é usado para criar aplicativos Web dinâmicos, escaláveis e de alto desempenho com recursos avançados de front-end, como vinculação de dados bidirecional, injeção de dependência, roteamento, criação de formulários, animações, testes automatizados e muito mais.",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "JUNIOR",
        
    ]
  },
  {
    "pergunta": "Nomeie os módulos que você deve importar para usar [(ngModel)] e formulários reactive.",
    "resposta": "FormsModule e Reactiveforms Module",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "JUNIOR",
    ]
  },
  {
    "pergunta": "O que são expressões angulares?",
    "resposta": "As expressões angulares são usadas no Angular para exibir valores de variáveis e executar operações aritméticas, lógicas e outras operações em HTML. Elas são escritas entre chaves duplas ({{ }}) e são avaliadas como JavaScript no contexto atual do componente. Elas podem ser usadas para exibir o valor de uma variável em um modelo HTML, bem como para executar operações em tempo real em dados de entrada.",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "JUNIOR",
    ]
  },
  {
    "pergunta": "O que quer dizer compilação AOT?",
    "resposta": "AOT é a abreviação de compilação ahead-of-time. Para aplicações Angular, isso se refere a escrever o código da aplicação e compilá-lo no momento da construção, ou seja, antes que a aplicação seja executada no navegador. Essa é uma abordagem alternativa para a compilação just-in-time, em que a compilação de código é feita imediatamente antes de executar a aplicação no navegador. Você pode aumentar o desempenho da aplicação ao utilizar a compilação AOT./n Esse tipo de pergunta em entrevistas Angular avalia sua sagacidade e garante que você conhece abordagens alternativas para diferentes cenários.",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "JUNIOR",
    ]
  },
  {
    "pergunta": "Quando o modelo de dados é atualizado fora da Zone, como atualizar a visualização?",
    "resposta": "Os seguintes métodos podem ser utilizados para atualizar a visualização:/n O método ApplicationRef.prototype.run pode ajudar a atualizar a visualização executando a detecção de mudanças em toda a árvore de componentes;/n O método NgZone.prototype.run pode alcançar o mesmo resultado executando a detecção de mudanças na árvore completa de forma similar. O método run chama internamente o método tick, e a função a ser realizada é passada por parâmetro antes do tick;/n O método ChangeDetectorRef.prototype.detectChanges executa a detecção de mudanças no componente atual e em seus filhos.",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "JUNIOR",
    ]
  },
  {
    "pergunta": "Qual a diferença entre testes unitários e testes um-para-um? Mencione algumas ferramentas de teste para aplicativos Angular.",
    "resposta": "Quando se deseja verificar o funcionamento adequado de segmentos isolados, são usados testes unitários, também conhecidos como unit tests, que fazem a verificação desses segmentos. Por outro lado, quando se quer garantir que conjuntos inteiros de componentes estão funcionando corretamente e em sincronia, e que o aplicativo está funcionando como desejado, pode-se usar testes um-para-um. Simulações de interação do usuário são frequentemente usadas em testes um-para-um para garantir que os aplicativos estejam funcionando corretamente. Duas boas ferramentas de teste são Jasmine e Karma.",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "JUNIOR",
    ]
  },
  {
    "pergunta": "O que são os templates em Angular?",
    "resposta": "Em Angular, um template é uma representação visual de como os dados devem ser exibidos na interface do usuário. Ele é definido com HTML, juntamente com algumas extensões especiais para Angular, como a inclusão de diretivas e binding de dados. Os templates são usados para definir a estrutura da página, a disposição dos elementos e o seu estilo, além de permitir a exibição de dados dinâmicos./n Seu uso permite que os desenvolvedores Angular criem interfaces de usuário ricas e dinâmicas, com lógica e interações complexas, de forma mais fácil e eficiente do que em outras abordagens de desenvolvimento de interfaces.",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "JUNIOR",
    ]
  },
  {
    "pergunta": "Quais são as principais vantagens do Angular sobre outros frameworks?",
    "resposta": "Algumas das principais vantagens do Angular sobre outros frameworks são:/n Grande ecossistema: Angular é um dos frameworks JavaScript mais populares e tem uma grande comunidade de desenvolvedores que contribuem para o seu ecossistema, criando bibliotecas, pacotes e soluções para diversos problemas./n MVC completo: O Angular é um framework completo que implementa o padrão Model-View-Controller (MVC), permitindo uma estrutura clara e organizada para o desenvolvimento de aplicações web./n Two-way data binding: O Angular suporta vinculação de dados bidirecional, o que significa que as alterações em um elemento da interface do usuário (UI) são automaticamente refletidas no modelo de dados e vice-versa./n Injeção de dependência: O Angular utiliza injeção de dependência para gerenciar a instância de objetos e seus relacionamentos, o que ajuda a tornar o código mais modular e fácil de testar./n Ferramentas de desenvolvimento: O Angular vem com um conjunto completo de ferramentas de desenvolvimento, como o Angular CLI, que simplifica o processo de criação e manutenção de projetos, além de facilitar o desenvolvimento de testes unitários e end-to-end.",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "JUNIOR",
    ]
  },
  {
    "pergunta": "",
    "resposta": "",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "JUNIOR",
    ]
  },
  {
    "pergunta": "Angular 2 vs AngularJS: qual a diferença?",
    "resposta": "Os dois são semelhantes. Ambos são frameworks front-end mantidos pela Google. No entanto, também tem suas diferenças já que o Angular 2 não é apenas uma versão atualizada do AngularJS. O Angular 2 é um novo framework escrito do zero. Portanto, se alguém estiver procurando atualizar ou mudar para o Angular 2 a partir do AngularJS, será necessário reescrever todo o código./n Nesta ou em outras perguntas de entrevista sobre o Angular 2, se você puder usar exemplos práticos ou experiências pessoais para responder à pergunta, isso será vantajoso e fará você se diferenciar da concorrência.",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "PLENO",
    ]
  },
  {
    "pergunta": "Qual é a principal diferença entre expressões angulares e expressões JavaScript?",
    "resposta": "A principal diferença entre expressões angulares e expressões JavaScript é que as expressões angulares são avaliadas dentro do contexto do AngularJS, enquanto as expressões JavaScript são avaliadas dentro do contexto do navegador./n As expressões angulares são usadas principalmente em templates HTML e permitem que você incorpore valores dinâmicos em sua página. Por exemplo, você pode usar uma expressão angular para exibir o valor de uma variável ou para realizar uma operação matemática simples./n As expressões JavaScript, por outro lado, são escritas em JavaScript puro e são avaliadas pelo navegador. Elas são usadas para manipular o DOM e para realizar operações mais avançadas que as expressões angulares não podem realizar. Por exemplo, você pode usar expressões JavaScript para acessar o DOM e adicionar ou remover elementos da página.",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "PLENO",
    ]
  },
  {
    "pergunta": "Como funciona o Transpiling no Angular?",
    "resposta": "Você já deve saber que quando o código-fonte de uma linguagem de programação é convertido em outra, o processo é chamado de Transpiling. No Angular, isso se refere principalmente à conversão de TypeScript para JavaScript. Como desenvolvedor, você pode escrever o código da sua aplicação Angular em TypeScript ou Dart e depois transpilá-lo para JavaScript para, então, executar a aplicação. Esse processo é interno e automático./n Esse é o tipo de pergunta de entrevista Angular que ajuda o entrevistador a entender a profundidade do seu conhecimento em desenvolvimento Angular.",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "PLENO",
    ]
  },
  {
    "pergunta": "Para que são usados os módulos Core e Shared?",
    "resposta": "Para todos os módulos, componentes, etc. que não precisam ocorrer em uma única cópia para o aplicativo, mas devem ser importados em diferentes módulos, existe um módulo genérico chamado módulo Shared. Para armazenar serviços que precisam ocorrer em uma única cópia em todo o aplicativo, é usado um módulo Core. Por exemplo, quando a autorização do usuário para armazenamento de dados é necessária, a autorização do usuário aparece como um módulo core (central).",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "PLENO",
    ]
  },
  {
    "pergunta": "O que são controladores em Angular?",
    "resposta": "Em Angular, os controladores são classes que desempenham o papel de intermediários entre o modelo e a exibição de dados. Eles são responsáveis por gerenciar as informações da página, controlar a lógica de negócios e se comunicar com os serviços. Eles são criados usando a injeção de dependência, onde as dependências são declaradas como parâmetros no construtor da classe. Além disso, você ainda pode dividir os controladores em subcontroladores para organizar o código.",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "PLENO",
    ]
  },
  {
    "pergunta": "O que são components, módulos e services em Angular?",
    "resposta": "Componentes (components), módulos e serviços (services) são todos elementos fundamentais do Angular e usados na construção de aplicações web modulares e escalares./n Componentes: são responsáveis por controlar a exibição de elementos de interface do usuário em uma página web. Cada componente é uma classe que contém metadados, como o seletor, o template e o estilo, que definem como o componente será renderizado na página. Eles também podem ter lógica de negócios associada./n Módulos: são conjuntos lógicos de componentes, serviços e outros módulos que podem ser agrupados e reutilizados em diferentes partes do aplicativo. Eles ajudam a organizar o código em pedaços menores e mais gerenciáveis. Cada aplicativo Angular tem pelo menos um módulo raiz, que é usado para inicializar o aplicativo./n Services: são classes que fornecem funcionalidades específicas para outras partes do aplicativo, como a busca de dados em um servidor, o compartilhamento de dados entre componentes ou a validação de formulários. Eles são injetados em componentes e outros serviços que os usam para realizar suas funções.",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "PLENO",
    ]
  },
  {
    "pergunta": "O que é vinculação de propriedade e por que é importante no Angular 12?",
    "resposta": "A vinculação de propriedade (ou property binding) é uma das técnicas fundamentais do Angular para atualizar dinamicamente os valores das propriedades dos elementos HTML. Isso permite que os dados sejam exibidos e atualizados em tempo real na página, sem a necessidade de atualizar a página inteira./n A vinculação de propriedade é importante porque torna o desenvolvimento de aplicativos Angular mais eficiente, permitindo que as alterações de dados sejam exibidas de forma dinâmica. Além disso, ajuda a manter um código mais limpo e fácil de ler e reduz a necessidade de código JavaScript personalizado para atualizar manualmente os valores dos elementos HTML.",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "SENIOR",
    ]
  },
  {
    "pergunta": "O que é um provider em Angular?",
    "resposta": "Um provider é uma classe que fornece um valor ou uma instância de um objeto para a aplicação. Ele pode ser usado para injetar objetos em outros componentes ou serviços, e é a maneira mais comum de fornecer um objeto ou serviço para a aplicação./n Os providers podem ser definidos em vários níveis, como no módulo raiz (app.module.ts), em um módulo de funcionalidade ou em um componente específico. Além disso, existem três tipos de providers em Angular: provider de serviço, provider de fábrica e provider de valor.",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "SENIOR",
    ]
  },
  {
    "pergunta": "Qual a diferença entre BOM e DOM?",
    "resposta": "BOM (Browser Object Model) e DOM (Document Object Model) são duas coisas diferentes no contexto da web./n O BOM é a interface do navegador com o mundo exterior. Ele fornece objetos como window, navigator e location, que permitem que o JavaScript interaja com o navegador e a janela do navegador./n Já o DOM é a representação em memória do documento HTML, XML ou XHTML em um modelo orientado a objeto. O DOM é criado pelo navegador quando uma página é carregada. Ele permite que o JavaScript manipule os elementos HTML como objetos, permitindo que os desenvolvedores criem dinamicamente e interajam com o conteúdo da página, alterem o estilo da página e adicionem ou removam elementos do documento HTML.",
    "filtros": [
        "FRONTEND",
        "ANGULAR",
        "SEM CODIGO",
        "SENIOR",
    ]
  },

  ];
}
