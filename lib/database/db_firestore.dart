import 'package:cloud_firestore/cloud_firestore.dart';

class DBFirestore {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; //recuperando instancia do FB

  // * Exportando ao banco
  addData() async {
    int i = 1;
    for (var element in data) {
      _firestore.collection('interview').doc(i.toString()).set(element);
      i += 1;
    }
  }


  // * Consulta simples: filtro[tecnologia] ordenado por nível de dificuldade.
  
  queryTech() async {
    DocumentSnapshot snap =
        await _firestore.collection("tinterview").doc().get();

    //QuerySnapshot querySnapshot = await snap.get();
  }

  // TODO: Consulta complexa: SearchField

  // * Lista de linguagens:
 final List lista_techs = [
    'HTML',
    'CSS',
    'JAVASCRIPT',
    'ANGULAR',
    'NODE',
    'PYTHON',
    'JAVA',
    ];

  // * Lista de perguntas para subir ao banco:
  List<Map<String, dynamic>> data = [
    {
      "pergunta": "O que é HTML?",
      "resposta":
          "HTML é uma linguagem de marcação de hipertexto (do inglês 'HyperText Markup Language'). É a linguagem principal usada para criar páginas da web e outros tipos de conteúdo que podem ser exibidos em um navegador da web. A linguagem HTML usa marcações para definir elementos, como títulos, parágrafos, imagens, links e outros elementos que compõem uma página da web. Cada elemento é definido usando uma tag HTML, que é uma sequência de caracteres colocada entre colchetes angulares (< e >). As tags HTML fornecem informações para o navegador sobre como exibir o conteúdo na página da web. Por exemplo, a tag <img> é usada para inserir uma imagem na página e a tag <a> é usada para criar um link para outra página da web. Os arquivos HTML são geralmente criados usando um editor de texto simples e podem ser exibidos em qualquer navegador da web.",
      "filtros": ["HTML", "ESTAGIO", "TECNICA", "FRONTEND", "JUNIOR"]
    },
    {
      "pergunta": "Qual é a diferença entre HTML e XHTML?",
      "resposta":
          "HTML (HyperText Markup Language) e XHTML (eXtensible HyperText Markup Language) são ambas linguagens de marcação usadas para criar páginas da web. A principal diferença entre as duas é a sintaxe utilizada para escrever o código. HTML é uma linguagem mais antiga e é menos rigorosa em relação às regras de sintaxe. Por exemplo, em HTML, as tags não precisam ser fechadas e o uso de letras maiúsculas ou minúsculas não faz diferença. Isso significa que o código HTML pode ser mais fácil de escrever e editar, mas pode ter mais erros. Por outro lado, XHTML é uma linguagem mais recente e mais rigorosa em relação às regras de sintaxe. O código XHTML deve ser escrito de acordo com as regras do XML, o que significa que todas as tags devem ser fechadas corretamente e as letras maiúsculas e minúsculas devem ser usadas corretamente. Isso torna o código XHTML mais estruturado e fácil de validar, o que pode ajudar a evitar erros de codificação. Em geral, a escolha entre HTML e XHTML depende das necessidades do projeto. Para projetos mais simples, como sites pessoais ou blogs, HTML pode ser mais adequado. Já para projetos mais complexos, como sites de comércio eletrônico ou aplicações web, XHTML pode ser uma escolha mais segura, garantindo maior integridade do código e melhorando a compatibilidade com diversos navegadores e plataformas.",
      "filtros": ["HTML", "XHTML", "ESTAGIO", "TECNICA", "FRONTEND", "JUNIOR"]
    },
    {
      "pergunta": "O que é CSS?",
      "resposta":
          "CSS (Cascading Style Sheets) é uma linguagem de estilo usada para descrever a aparência e o formato de um documento escrito em HTML (HyperText Markup Language), incluindo a formatação de texto, cores, imagens, layout e outros elementos visuais. O CSS separa a apresentação do conteúdo do documento HTML, permitindo que os desenvolvedores criem estilos consistentes e reutilizáveis para todo o site. Isso significa que, em vez de formatar cada elemento visual individualmente dentro do HTML, o CSS permite criar estilos que afetam todo o site. Os estilos CSS são definidos em um arquivo separado, geralmente com a extensão .css, que é vinculado ao arquivo HTML por meio de uma tag <link>. Isso significa que o CSS pode ser alterado facilmente sem afetar o conteúdo do documento HTML. Ao separar o estilo da estrutura do documento, o CSS torna o desenvolvimento web mais eficiente e mais fácil de manter. Também permite que os desenvolvedores criem designs mais atraentes e sofisticados para sites, além de tornar as páginas da web mais acessíveis para pessoas com deficiência visual, permitindo a personalização da aparência das páginas.",
      "filtros": ["CSS", "ESTAGIO", "TECNICA", "FRONTEND", "JUNIOR"]
    },
    {
      "pergunta": "O que é o Angular?",
      "resposta":
          "Angular é um framework JavaScript de código aberto criado e mantido pelo Google. Ele é usado para desenvolver aplicativos web e móveis baseados em componentes. O Angular oferece uma abordagem moderna e escalável para o desenvolvimento de aplicativos web do lado do cliente, que utiliza o padrão MVC (Model-View-Controller) para separar o modelo de dados da lógica de negócios e da apresentação. O Angular é construído com base em tecnologias modernas, como HTML, CSS e TypeScript, e é conhecido por sua capacidade de criar aplicativos web de página única (SPA) que carregam rapidamente e oferecem uma experiência de usuário suave e interativa. Ele inclui recursos avançados, como injeção de dependência, roteamento, validação de formulários, animações e muito mais. Uma das principais vantagens do Angular é a sua grande comunidade de desenvolvedores e suporte contínuo do Google, o que garante que o framework seja atualizado regularmente com novos recursos e correções de bugs. O Angular também é altamente personalizável, permitindo que os desenvolvedores criem componentes reutilizáveis e adaptem o framework às suas necessidades específicas. Em resumo, o Angular é uma poderosa ferramenta para o desenvolvimento de aplicativos web modernos, que oferece aos desenvolvedores uma abordagem estruturada e eficiente para a construção de aplicativos complexos e escaláveis.",
      "filtros": [
        "ANGULAR",
        "JAVASCRIPT",
        "ESTAGIO",
        "TECNICA",
        "FRONTEND",
        "JUNIOR"
      ]
    },
    {
      "pergunta": "frameworks front-end mais populares atualmente são?",
      "resposta":
          "React: uma biblioteca JavaScript de código aberto desenvolvida pelo Facebook, é focada em criar interfaces de usuário (UI) dinâmicas e eficientes. Ele utiliza o conceito de componentes e pode ser usado com outras bibliotecas e frameworks. Angular: um framework front-end desenvolvido pelo Google, ele permite a criação de aplicativos web complexos com uma arquitetura escalável e modular. Ele utiliza o conceito de componentes, diretivas e serviços para construir aplicações robustas. Vue: uma biblioteca JavaScript de código aberto, ela é voltada para a criação de interfaces de usuário reativas e progressivas. É fácil de aprender e pode ser integrada facilmente em outros projetos.",
      "filtros": ["REACT", "JAVASCRIPT", "FRONTEND", "ANGULAR", "VUE", "JUNIOR"]
    },
    {
      "pergunta":
          "Como se manter atualizado em relação às novas tecnologias e tendências no desenvolvimento front-end?",
      "resposta":
          "O desenvolvimento front-end é um campo em constante evolução, e é importante se manter atualizado em relação às novas tecnologias e tendências. Aqui estão algumas maneiras de se manter atualizado: Leia blogs e artigos: existem muitos blogs e sites dedicados ao desenvolvimento front-end, como o CSS-Tricks, o Smashing Magazine e o A List Apart. Eles publicam regularmente artigos e tutoriais sobre as últimas tendências e tecnologias do desenvolvimento front-end. Assista vídeos e palestras: plataformas como o YouTube e o Vimeo têm muitos vídeos e palestras de desenvolvedores experientes compartilhando seus conhecimentos sobre as últimas tendências e tecnologias do desenvolvimento front-end. Participe de eventos e conferências: participar de eventos e conferências é uma ótima maneira de se manter atualizado em relação às tendências do desenvolvimento front-end e conhecer outros profissionais da área. Experimente novas tecnologias e ferramentas: tente experimentar novas tecnologias e ferramentas, como frameworks e bibliotecas, para se manter atualizado e expandir suas habilidades. Participe de comunidades on-line: participe de comunidades on-line de desenvolvedores front-end, como grupos no LinkedIn, Slack ou Reddit, para compartilhar conhecimentos e obter informações sobre as últimas tendências e tecnologias. Siga especialistas em mídias sociais: muitos especialistas em desenvolvimento front-end compartilham seus conhecimentos e opiniões nas mídias sociais, como o Twitter e o Instagram. Siga esses especialistas para ficar atualizado em relação às últimas tendências e tecnologias. Ao se manter atualizado em relação às últimas tendências e tecnologias do desenvolvimento front-end, você pode aprimorar suas habilidades e se tornar um profissional mais valioso para sua equipe e seus clientes.",
      "filtros": ["FRONTEND", "JUNIOR", "TECNICA"]
    },
    {
      "pergunta":
          "Como você planeja e organiza seu trabalho de desenvolvimento front-end?",
      "resposta":
          "Existem várias etapas no processo de planejamento e organização do trabalho de desenvolvimento front-end. Aqui estão algumas práticas recomendadas que você pode seguir: Compreender os requisitos do projeto: Antes de começar a trabalhar, é importante ter uma compreensão clara dos requisitos do projeto. Isso inclui a compreensão do escopo do projeto, dos objetivos de negócios, dos prazos e do orçamento.Compreender os requisitos do projeto: Antes de começar a trabalhar, é importante ter uma compreensão clara dos requisitos do projeto. Isso inclui a compreensão do escopo do projeto, dos objetivos de negócios, dos prazos e do orçamento. Definir as etapas do projeto: Depois de entender os requisitos do projeto, você deve definir as etapas do projeto e estabelecer um plano de ação. Isso envolve a criação de um cronograma de trabalho, a definição de marcos e a alocação de recursos necessários. Utilizar ferramentas de gerenciamento de projeto: Utilizar ferramentas de gerenciamento de projeto, como o Trello ou o Asana, pode ajudá-lo a manter o controle do projeto e a acompanhar as etapas do desenvolvimento. Criar wireframes e protótipos: Antes de começar a escrever código, é importante criar wireframes e protótipos para validar a usabilidade e a funcionalidade da interface do usuário. Utilizar metodologias ágeis: As metodologias ágeis, como o Scrum, ajudam a manter o foco nas entregas e a garantir que o trabalho esteja sendo entregue de forma iterativa e incremental. Testar e validar: Testar e validar continuamente seu trabalho é essencial para garantir que o código esteja funcionando corretamente e que a interface do usuário seja intuitiva e fácil de usar. Documentar o trabalho: Documentar o trabalho é importante para ajudar a manter a consistência e a rastreabilidade do código. Isso inclui a documentação de requisitos, testes e fluxos de trabalho. Revisar e refatorar o código: Revisar e refatorar o código regularmente ajuda a garantir que o código seja limpo, otimizado e fácil de manter. Em resumo, o planejamento e organização do trabalho de desenvolvimento front-end envolve a compreensão dos requisitos do projeto, a definição de etapas, a utilização de ferramentas de gerenciamento de projetos, a criação de wireframes e protótipos, a utilização de metodologias ágeis, a testagem e validação contínua, a documentação do trabalho e a revisão e refatoração do código.Em resumo, o planejamento e organização do trabalho de desenvolvimento front-end envolve a compreensão dos requisitos do projeto, a definição de etapas, a utilização de ferramentas de gerenciamento de projetos, a criação de wireframes e protótipos, a utilização de metodologias ágeis, a testagem e validação contínua, a documentação do trabalho e a revisão e refatoração do código.",
      "filtros": ["FRONTEND", "PLENO", "JUNIOR", "TECNICA"]
    },
    {
      "pergunta":
          "Como você lida com prazos apertados e situações de pressão no ambiente de trabalho?",
      "resposta":
          "Lidar com prazos apertados e situações de pressão é uma habilidade importante no ambiente de trabalho, especialmente no desenvolvimento front-end, onde os prazos muitas vezes são curtos. Aqui estão algumas estratégias que você pode utilizar para lidar com essas situações: Priorizar tarefas: Em situações de pressão, é importante priorizar as tarefas de acordo com sua importância e impacto no projeto. Focar nas tarefas mais críticas primeiro pode ajudar a garantir que o trabalho mais importante seja concluído dentro do prazo. Comunicar com a equipe: Comunicar-se abertamente com a equipe pode ajudar a aliviar a pressão e a encontrar soluções criativas para os desafios do projeto. Trabalhar em conjunto para definir prioridades e delegar tarefas pode ajudar a manter o projeto no caminho certo. Ser realista: É importante ser realista em relação aos prazos e às expectativas do projeto. Estar ciente dos recursos disponíveis e das limitações de tempo pode ajudar a definir expectativas realistas e a evitar frustrações desnecessárias. Utilizar ferramentas e recursos: Utilizar ferramentas e recursos para otimizar o tempo de trabalho pode ajudar a cumprir prazos apertados. Isso pode incluir a utilização de bibliotecas de código pré-existente, templates e ferramentas de automação. Gerenciar o tempo: Gerenciar o tempo de forma eficiente pode ajudar a evitar a procrastinação e a garantir que o trabalho esteja sendo concluído dentro do prazo. Focar nas tarefas mais importantes e limitar as distrações pode ajudar a manter o foco e a produtividade. Manter-se calmo e focado: Manter-se calmo e focado é fundamental em situações de pressão. Praticar técnicas de relaxamento, como respiração profunda, e manter o foco nas tarefas prioritárias pode ajudar a lidar com a pressão e a manter a clareza mental. Em resumo, lidar com prazos apertados e situações de pressão no ambiente de trabalho envolve priorizar tarefas, comunicar com a equipe, ser realista, utilizar ferramentas e recursos, gerenciar o tempo e manter-se calmo e focado.",
      "filtros": ["FRONTEND", "PLENO", "SENIOR", "TECNICA"]
    },
    {
      "pergunta": "O que é SQL injection?",
      "resposta":
          "SQL injection é um tipo de ataque cibernético que explora vulnerabilidades em sistemas de gerenciamento de banco de dados (DBMS) para obter acesso não autorizado ou controlar o banco de dados. Nesse tipo de ataque, o invasor usa técnicas para inserir instruções SQL maliciosas em uma entrada de formulário, string de consulta ou outras entradas do usuário em um aplicativo da web. Essas instruções são executadas pelo DBMS sem a devida validação e filtragem, permitindo que o invasor leia, modifique ou exclua dados do banco de dados. Os ataques de SQL injection podem causar graves danos aos sistemas e aos dados armazenados. Para evitá-los, é importante garantir que todas as entradas do usuário sejam devidamente validadas, filtradas e sanitizadas antes de serem usadas em consultas SQL. Além disso, é recomendável utilizar parâmetros de consulta e procedimentos armazenados para prevenir esse tipo de ataque.",
      "filtros": ["FRONTEND", "JUNIOR", "SQL INJECTION", "TECNICA"]
    },
    {
      "pergunta": "O que é escopo em JavaScript?",
      "resposta":
          "Escopo em JavaScript se refere ao contexto no qual as variáveis, funções e outros identificadores são definidos e acessíveis. O escopo é uma das características fundamentais da linguagem, pois afeta diretamente a visibilidade e a acessibilidade das variáveis e funções em um programa. Existem dois tipos de escopo em JavaScript: escopo global e escopo local. O escopo global é aquele em que as variáveis e funções são definidas fora de qualquer função, ou seja, estão disponíveis em todo o programa. Já o escopo local é aquele em que as variáveis e funções são definidas dentro de uma função, e só são acessíveis dentro dessa função. Uma variável declarada com a palavra-chave 'var' é definida no escopo da função em que ela é declarada enquanto uma variável declarada com a palavra-chave 'let' ou 'const' é definida no bloco em que ela é declarada (dentro de uma função ou dentro de um bloco de código delimitado por chaves). Entender o escopo em JavaScript é importante para evitar problemas como variáveis sendo acessadas ou modificadas inadvertidamente em partes do programa onde não deveriam estar disponíveis. Além disso, o uso correto do escopo pode ajudar a escrever um código mais organizado e modular.",
      "filtros": ["FRONTEND", "PLENO", "TECNICA"]
    },
    {
      "pergunta":
          "Explique o CSS “box model” e os componentes de layout que o compõem.",
      "resposta":
          "O CSS Box Model é um conceito fundamental em design de layout da web que define a forma como os elementos HTML são renderizados em uma página da web. O modelo se refere à caixa retangular invisível que envolve cada elemento HTML, incluindo seu conteúdo, preenchimento, bordas e margens. O Box Model é composto pelos seguintes componentes: Conteúdo: é o próprio conteúdo do elemento, como texto, imagem ou outro tipo de conteúdo. Preenchimento (padding): é uma área transparente ao redor do conteúdo dentro da caixa. Ele pode ser configurado com um valor fixo em pixels ou uma porcentagem em relação ao tamanho da caixa. Borda (border): é uma linha que circunda a caixa. Ele pode ser configurado com um estilo, largura e cor personalizados. Margem (margin): é uma área transparente fora da borda da caixa. Ela pode ser configurada com um valor fixo em pixels ou uma porcentagem em relação ao tamanho da caixa. Esses componentes do Box Model afetam a maneira como os elementos são dimensionados, posicionados e alinhados em uma página da web. Por exemplo, se você aumentar o valor do preenchimento, o tamanho total da caixa do elemento aumentará e seu conteúdo será deslocado mais para o centro da caixa. Da mesma forma, se você aumentar o valor da margem, a caixa do elemento se tornará maior e haverá mais espaço em branco entre o elemento e os outros elementos em torno dele. O Box Model é um conceito importante para entender quando se trata de design de layout da web, pois permite que os desenvolvedores ajustem o posicionamento e o tamanho dos elementos em uma página de forma precisa e consistente.",
      "filtros": ["FRONTEND", "JUNIOR", "CSS", "TECNICA"]
    },
    {
      "pergunta": "Como JavaScript e jQuery são diferentes?",
      "resposta":
          "JavaScript e jQuery são tecnologias diferentes, embora ambas sejam usadas para desenvolver aplicativos da web interativos. JavaScript é uma linguagem de programação de alto nível, interpretada e orientada a objetos que é usada para criar aplicativos da web interativos. Ela pode ser executada em qualquer navegador moderno sem a necessidade de instalar plugins ou outras tecnologias adicionais. jQuery, por outro lado, é uma biblioteca de JavaScript que fornece uma série de funcionalidades e recursos adicionais para simplificar o desenvolvimento de aplicativos da web interativos. Ele é usado para manipulação de DOM, eventos, animações e outras interações da interface do usuário, e pode ser usado em conjunto com JavaScript ou em substituição a ele. A principal diferença entre JavaScript e jQuery é que o jQuery é uma biblioteca que foi criada para tornar o desenvolvimento em JavaScript mais fácil e rápido. Ele fornece uma sintaxe mais simples e intuitiva para tarefas comuns, além de fornecer recursos como a manipulação do DOM e suporte a AJAX com menos código do que seria necessário em JavaScript puro. No entanto, vale lembrar que jQuery é uma biblioteca de JavaScript, ou seja, é construída em cima da linguagem JavaScript e utiliza suas funcionalidades. Portanto, para usar jQuery de forma efetiva, é importante ter uma boa compreensão de JavaScript e suas funcionalidades.",
      "filtros": ["FRONTEND", "JUNIOR", "TECNICA"]
    },
    {
      "pergunta": "O que é Cross-Site Scripting (XSS)?",
      "resposta":
          "É um ataque de injeção de client-side script (código malicioso) que se aproveita de brechas em aplicações web para se apropriar de dados no navegador.",
      "filtros": ["FRONTEND", "JUNIOR", "TECNICA"]
    },
    {
      "pergunta": "O que é Sass?",
      "resposta":
          "É uma linguagem de extensão do CSS, a sua ideia é adicionar recursos especiais como variáveis, mixins, funções, nested selectors. Tem o objetivo tornar o desenvolvimento mais simples e eficiente.",
      "filtros": ["FRONTEND", "JUNIOR", "CSS", "SASS", "TECNICA"]
    },
    {
      "pergunta": "Qual o ponto de se usar Redux?",
      "resposta":
          "Com o redux é criado um state global, e todos os componentes tem acesso a esse state, isso elimina a necessidade de passar continuamente o state de um componente para outro.",
      "filtros": ["FRONTEND", "JUNIOR", "REDUX", "TECNICA"]
    },
    {
      "pergunta": "Explique a diferença de null e undefined em JavaScript",
      "resposta":
          "Null é um valor primitivo que representa a ausência intencional de um valor, ja o undefined é um valor primitivo utilizado quando não se teve valor atribuído previamente.",
      "filtros": ["FRONTEND", "JUNIOR", "JAVASCRIPT", "TECNICA"]
    },
    {
      "pergunta": "Liste as vantagens da arquitetura de microsserviços",
      "resposta":
          "Facilidade e rapidez na atualização e implantação dos serviços; Aumentar a flexibilidade da infraestrutura Escalabilidade; Estandardização de serviços; Redução de dívida técnica ;Desenvolvimento de práticas de DevOps e de colaboração do time",
      "filtros": [
        "FRONTEND",
        "JUNIOR",
        "ARQUITETURA DE MICROSSERVIÇOS",
        "TECNICA"
      ]
    },
    {
      "pergunta": "Quais são as vantagens do NoSQL sobre o RDBMS tradicional?",
      "resposta":
          "Escalabilidade;/n Grande volume de Dados;/n Flexibilidade no formato de dados;/n Menor custo",
      "filtros": ["FRONTEND", "JUNIOR", "NoSQL", "RDBMS", "TECNICA"]
    },
    {
      "pergunta": "O que é programação reativa?",
      "resposta":
          "É um paradigma de programação declarativo preocupado com os fluxos de dados e a propagação de mudança, reage a eventos disparados por interações do usuário ou situações comuns.",
      "filtros": ["FRONTEND", "JUNIOR", "TECNICA"]
    },
    {
      "pergunta":
          "Qual o papel do HTML na indexação de páginas por buscadores?",
      "resposta":
          "Na indexação, se busca as páginas para o índice do motor de busca, motando o Pagerank, um ranking baseado numa fórmula desenvolvida pelo Google que considera também uma série de informações sobre o website para classificá-lo com uma pontuação de 0 a 10. O papel do HTML é muito influente nesse caso, quando mais semântico e bem escrito, melhor é o Pagerank, como os títulos das páginas, meta tags, heading tags, atributo alt em imagens e etc.",
      "filtros": ["FRONTEND", "JUNIOR", "HTML"]
    },
    {
      "pergunta":
          "Cite 3 conceitos da Programação Orientada a Objetos aplicada ao JavaScript",
      "resposta": "Classe, herança e encapsulamento.",
      "filtros": ["FRONTEND", "JUNIOR", "JAVASCRIPT"]
    },
    {
      "pergunta": "Quais os beneficios do TypeScript?",
      "resposta":
          "Adiciona tipagem estática a linguagem JavaScript, possibilita que a IDE incremente o IntelliSense, Utilizar funcionalidades do Javascript que ainda não estão disponíveis de forma nativa, transpilar o código para que o mesmo seja lido por todas as versões do browsers.",
      "filtros": ["FRONTEND", "JUNIOR", "JAVASCRIPT", "TYPESCRIPT"]
    },
    {
      "pergunta": "Mencione qual é a diferença entre PUT e POST?",
      "resposta":
          "PUT/POST é um método Http. POST usado para criar um recurso, o PUT para alterar um recurso.",
      "filtros": ["FRONTEND", "PLENO", "POST", "PUT"]
    },
    {
      "pergunta": "O que são atributos defer e assync em uma tag <script>?",
      "resposta":
          "Defer assim como occore com o async, com o defer o download do script é feito de forma assíncrona, mas sua execução ocorre apenas quando todo o processo de renderização estiver concluído.",
      "filtros": ["FRONTEND", "PLENO", "ASYNC", "DEFER"]
    },
    {
      "pergunta": "O que significa SOLID? Quais são seus princípios?",
      "resposta":
          "SOLID São princípios e boas práticas de programação que melhore o design de software e arquitetura, seus princípios são:/n Single Responsiblity: Uma classe deve ter um, e somente um, motivo para mudar; /n Open-Closed: Objetos ou entidades devem estar abertos para extensão, mas fechados para modificação; /n Liskov Substitution: Uma classe derivada deve ser substituível por sua classe base/n Interface Segregation: Uma classe não deve ser forçada a implementar interfaces e métodos que não irão utilizar/n Dependency Inversion: Dependa de abstrações e não de implementações",
      "filtros": ["FRONTEND", "PLENO", "SOLID"]
    },
    {
      "pergunta": "O que é coerção em JavaScript?",
      "resposta":
          "É um processo de conversão de um valor de um tipo, para outro (como a conversão de string para number). Qualquer tipo, seja primitivo ou um objeto, é um sujeito válido para coerção de tipo.",
      "filtros": ["FRONTEND", "PLENO", "JAVASCRIPT"]
    },
    {
      "pergunta": "Cite alguns sistemas de grid CSS",
      "resposta":
          "grid-template-columns, grid-template-rows, grid-template-areas, grid-template, grid-auto-columns, grid-auto-columns.",
      "filtros": ["FRONTEND", "PLENO", "CSS"]
    },
    {
      "pergunta": "Quando devo usar as Arrow functions no ES6?",
      "resposta":
          "Para funções que não sejam métodos, Em funções mais curtas, e quando não precisar usar o contexto(this, arguments, super, new.target).",
      "filtros": ["FRONTEND", "PLENO", "ES6"]
    },
    {
      "pergunta": "Quando devemos usar generators no ES6?",
      "resposta":
          "Quando queremos uma função que pode ser executada, pausada e continuada em diferentes estágios da sua execução. Criar de maneira mais fácil iteradores e controlar o código assíncrono.",
      "filtros": ["FRONTEND", "PLENO", "ES6"]
    },
    {
      "pergunta": "Cite algumas características de sistemas reativos",
      "resposta": "Flexíveis, desacoplados e escaláveis.",
      "filtros": ["FRONTEND", "PLENO"]
    },
    {
      "pergunta":
          "Descreva a diferença entre a programação reativa e a programação imperativa",
      "resposta":
          "Programação reativa reage a eventos disparados por interações do usuário ou situações comuns. Já a programação imperativa é mais autoritária, diz como e o quê exatamente um programa ou rotina deve realizar.",
      "filtros": ["FRONTEND", "PLENO"]
    },
    {
      "pergunta": "Imperativo vs Funcional vs Programação Reativa. Explique",
      "resposta":
          "Imperativo descreve exatamente como um programa ou rotina deve funcionar, controlando totalmente o estado do programa, A funcional usa a composição de funções puras evitando o compartilhamento de estados, dados mutáveis e efeitos colaterais, Programação reativa reage a eventos disparado pelo usuário ou situações comuns do programa.",
      "filtros": ["FRONTEND", "SENIOR"]
    },
    {
      "pergunta": "Você pode explicar o que “git reset” faz?",
      "resposta":
          "Desfazer alterações locais no estado de um repositório git, gerenciando o estado interno do git como a árvore de commits(HEAD), o índice de staging e o diretório de trabalho.",
      "filtros": ["FRONTEND", "SENIOR"]
    },
    {
      "pergunta": "Qual a diferença de Interface e Type no TypeScript?",
      "resposta":
          "Usar type é como se criasse um apelido para tipos primitivos. Interface para descrever uma forma de dados.",
      "filtros": ["FRONTEND", "SENIOR", "TYPESCRIPT"]
    },
    {
      "pergunta":
          "O que é teste de unidade, teste de integração e quais são as diferenças entre eles?",
      "resposta":
          "Teste de unidade é quando os módulos são testados individualmente, no de integração os módulos são combinados e testados em grupo.",
      "filtros": ["FRONTEND", "SENIOR", "TESTE"]
    },
    {
      "pergunta":
          "O que é Java? Como você descreveria a linguagem em algumas palavras?",
      "resposta":
          "Java é uma linguagem de programação de alto nível, orientada a objetos e projetada para ser portátil e independente de plataforma. Ela é compilada para um bytecode que é interpretado pela Máquina Virtual Java (JVM), o que significa que o código escrito em Java pode ser executado em qualquer plataforma que possua uma JVM instalada. Java é amplamente utilizada para desenvolver aplicativos de software de diversos tipos, incluindo aplicativos de desktop, aplicativos móveis, aplicativos da web e até mesmo sistemas operacionais. A linguagem é conhecida por sua sintaxe clara e concisa, sua facilidade de uso e sua grande quantidade de bibliotecas e frameworks disponíveis, tornando-a uma escolha popular para muitos desenvolvedores de software.",
      "filtros": ["BACKEND", "JUNIOR", "JAVA"]
    },
    {
      "pergunta":
          "Quais são as diferenças entre uma classe abstrata e uma interface em Java?",
      "resposta":
          "Em Java, tanto as classes abstratas quanto as interfaces são usadas para criar tipos abstratos que podem ser implementados por outras classes. No entanto, existem algumas diferenças fundamentais entre elas:/n Implementação de métodos: uma classe abstrata pode ter métodos implementados, enquanto uma interface não pode. Todos os métodos de uma interface são abstratos e não têm corpo./n Herança: uma classe abstrata pode estender outra classe abstrata ou implementar uma ou mais interfaces, enquanto uma interface pode apenas estender outras interfaces./n Construtores: uma classe abstrata pode ter um construtor, enquanto uma interface não pode./n Níveis de acesso: os métodos e variáveis de uma interface são sempre públicos, enquanto uma classe abstrata pode ter membros com qualquer nível de acesso./n Finalidade: uma classe abstrata é usada quando há uma relação 'é um' entre a classe abstrata e suas subclasses, enquanto uma interface é usada para representar um conjunto de comportamentos que uma classe pode implementar, independentemente da sua hierarquia./n Em resumo, uma classe abstrata é mais apropriada quando se deseja fornecer uma implementação básica para subclasses e, ao mesmo tempo, permitir que subclasses forneçam sua própria implementação para métodos específicos. Já uma interface é mais apropriada quando se deseja fornecer um conjunto de comportamentos que uma classe pode implementar, independentemente de sua hierarquia.",
      "filtros": ["BACKEND", "JAVA", "JUNIOR"]
    },
    {
      "pergunta": "O que é polimorfismo em Java? Como ele funciona?",
      "resposta":
          "O polimorfismo é um conceito fundamental em programação orientada a objetos que permite que objetos de diferentes classes possam ser tratados como se fossem objetos da mesma classe. Em Java, o polimorfismo é implementado por meio de dois mecanismos: sobrecarga de métodos e sobrescrita de métodos./n A sobrecarga de métodos permite que você defina vários métodos com o mesmo nome, mas com diferentes parâmetros. Isso permite que você chame um método com diferentes tipos de argumentos e, assim, obter um comportamento diferente para cada tipo de argumento. O compilador Java seleciona o método correto para chamar com base nos tipos de argumentos fornecidos./n A sobrescrita de métodos, por sua vez, permite que você substitua um método definido em uma classe pai em uma classe filha. Isso permite que você forneça uma implementação diferente do método para a classe filha que é mais adequada para suas necessidades específicas. O método substituto deve ter a mesma assinatura (nome e tipos de parâmetros) do método pai para que a sobrescrita funcione corretamente./n Em resumo, o polimorfismo permite que você escreva código que possa ser reutilizado em diferentes contextos, sem a necessidade de criar um código específico para cada contexto. Ele funciona selecionando a implementação correta de um método com base nos tipos de argumentos passados ou na hierarquia de classes.",
      "filtros": ["BACKEND", "JAVA", "JUNIOR"]
    },
    {
      "pergunta": "Por que Java é independente de plataforma?",
      "resposta":
          "Java é chamado de plataforma independente por causa de seus códigos de byte que podem ser executados em qualquer sistema, independentemente do sistema operacional subjacente.",
      "filtros": ["BACKEND", "JAVA", "JUNIOR"]
    },
    {
      "pergunta": "Por que Java não é 100% orientado a objetos?",
      "resposta":
          "Java não é 100% orientado a objetos porque faz uso de oito tipos de dados primitivos como boolean, byte, char, int, float, double, long, short que não são objetos.",
      "filtros": ["BACKEND", "JAVA", "JUNIOR"]
    },
    {
      "pergunta": "Explique JDK, JRE e JVM?",
      "resposta":
          "JDK: Significa Kit de Desenvolvimento Java. É a ferramenta necessária para compilar, documentar e empacotar programas Java. Ele contém JRE + ferramentas de desenvolvimento./n JRE: Significa Java Runtime Environment. JRE refere-se a um ambiente de tempo de execução no qual o bytecode Java pode ser executado. É uma implementação da JVM que existe fisicamente./n JVM: Significa Java Virtual Machine. É uma máquina abstrata. É uma especificação que fornece um ambiente de tempo de execução no qual o bytecode Java pode ser executado. A JVM segue três notações: Especificação, Implementação e  Instância de Tempo de Execução .",
      "filtros": ["BACKEND", "JAVA", "JUNIOR"]
    },
    {
      "pergunta": "Explique public static void main(String args[]) em Java.",
      "resposta":
          "main() em Java é o ponto de entrada para qualquer programa Java. É sempre escrito como public static void main(String[] args)./n public : Public é um modificador de acesso, que é usado para especificar quem pode acessar esse método. Público significa que este Método será acessível por qualquer Classe./n static : É uma palavra-chave em java que identifica que é baseada em classe. main() é estático em Java para que possa ser acessado sem criar a instância de uma classe. Caso main não seja estático, o compilador lançará um erro, pois main () é chamado pela JVM antes que qualquer objeto seja criado e apenas métodos estáticos podem ser invocados diretamente por meio da classe./n void : É o tipo de retorno do método. Void define o método que não retornará nenhum valor./n main : É o nome do método que é procurado pela JVM como ponto de partida para uma aplicação apenas com uma assinatura específica. É o método onde ocorre a execução principal./n String args[] : É o parâmetro passado para o método main.",
      "filtros": ["BACKEND", "JAVA", "JUNIOR"]
    },
    {
      "pergunta": "O que são classes wrapper em Java?",
      "resposta":
          "As classes wrapper convertem as primitivas Java em tipos de referência (objetos). Todo tipo de dado primitivo tem uma classe dedicada a ele. Elas são conhecidas como classes wrapper porque “empacotam” o tipo de dados primitivo em um objeto dessa classe. Consulte a imagem abaixo que exibe diferentes tipos primitivos, classe wrapper e argumento do construtor.",
      "filtros": ["BACKEND", "JAVA", "JUNIOR"]
    },
    {
      "pergunta": "O que são construtores em Java?",
      "resposta":
          "Em Java, construtor refere-se a um bloco de código que é usado para inicializar um objeto. Deve ter o mesmo nome da classe. Além disso, não possui tipo de retorno e é chamado automaticamente quando um objeto é criado./n  Existem dois tipos de construtores:/n Construtor padrão: Em Java, um construtor padrão é aquele que não recebe nenhuma entrada. Em outras palavras, construtores padrão são os construtores sem argumento que serão criados por padrão caso nenhum outro construtor seja definido pelo usuário. Seu objetivo principal é inicializar as variáveis ​​de instância com os valores padrão. Além disso, é usado principalmente para a criação de objetos./n Construtor parametrizado: O construtor parametrizado em Java, é o construtor capaz de inicializar as variáveis ​​de instância com os valores fornecidos. Em outras palavras, os construtores que recebem os argumentos são chamados de construtores parametrizados.",
      "filtros": ["BACKEND", "JAVA", "JUNIOR"]
    },
    {
      "pergunta": " O que é herança em Java?",
      "resposta":
          "Herança em Java é o conceito onde as propriedades de uma classe podem ser herdadas pela outra. Ajuda a reutilizar o código e estabelecer um relacionamento entre as diferentes classes. A herança é realizada entre dois tipos de classes:",
      "filtros": ["BACKEND", "JAVA", "PLENO"]
    },
    {
      "pergunta":
          "Qual é a diferença entre uma exceção verificada e uma exceção não verificada? Como você lidaria com esses tipos de exceções em um programa Java?",
      "resposta":
          "Em Java, existem dois tipos de exceções: exceções verificadas e exceções não verificadas./n As exceções verificadas (checked exceptions) são exceções que o compilador Java exige que sejam tratadas ou propagadas. Essas exceções são geralmente relacionadas a erros de entrada/saída, como arquivos não encontrados, ou a condições de erro que não podem ser facilmente detectadas durante a execução. Para lidar com exceções verificadas, é necessário envolver o código que pode gerar essas exceções em um bloco try-catch ou propagá-las para um bloco superior usando a palavra-chave 'throws.'/n As exceções não verificadas (unchecked exceptions) são exceções que o compilador Java não exige que sejam tratadas ou propagadas. Essas exceções geralmente são relacionadas a erros de programação, como divisão por zero ou acesso a uma posição inválida de um array. Para lidar com exceções não verificadas, é recomendável envolver o código que pode gerar essas exceções em um bloco try-catch para evitar que o programa seja interrompido abruptamente./n Para lidar com exceções em um programa Java, é recomendável seguir algumas boas práticas, como:/n Use exceções verificadas quando uma operação pode falhar devido a uma condição que não possa ser facilmente detectada durante a execução. /n Use exceções não verificadas quando uma operação pode falhar devido a uma condição que pode ser detectada durante a execução./n Não capture exceções que você não sabe como lidar corretamente. Em vez disso, permita que as exceções sejam propagadas para um bloco superior onde possam ser tratadas adequadamente./n Forneça informações úteis de exceção, como mensagens de erro significativas e rastreamentos de pilha, para ajudar a diagnosticar e corrigir problemas./n Não ignore exceções, pois isso pode levar a comportamentos inesperados e difíceis de depurar em seu programa.",
      "filtros": ["BACKEND", "JAVA", "PLENO"]
    },
    {
      "pergunta":
          "O que são threads em Java? Como elas são implementadas e gerenciadas na linguagem?",
      "resposta":
          "Threads em Java são uma forma de realizar programação concorrente e paralela, permitindo que o programa execute múltiplas tarefas simultaneamente. Uma thread é basicamente uma unidade básica de processamento que pode ser executada simultaneamente com outras threads dentro do mesmo processo./n Em Java, threads são implementadas pela classe Thread ou por meio da interface Runnable, que é implementada por uma classe que deseja ser executada em uma thread. Quando uma thread é iniciada, ela executa o método run() da classe Thread ou da classe que implementa a interface Runnable. O método run() é o ponto de entrada da thread e define o comportamento da thread./n Para gerenciar threads em Java, o Java Virtual Machine (JVM) usa um algoritmo de escalonamento de threads que decide qual thread deve ser executada em um determinado momento. A JVM também fornece um conjunto de métodos para permitir que as threads se comuniquem entre si e sincronizem suas operações./n A criação de threads em Java é relativamente fácil. Basta estender a classe Thread ou implementar a interface Runnable e, em seguida, chamar o método start() para iniciar a execução da thread. O método start() cria uma nova thread e, em seguida, chama o método run() da classe ou objeto implementando a thread. É importante lembrar que a execução de múltiplas threads pode levar a problemas de concorrência e sincronização, como condições de corrida e bloqueios mútuos, que precisam ser gerenciados corretamente para garantir a correta execução do programa.",
      "filtros": ["BACKEND", "JAVA", "PLENO"]
    },
    {
      "pergunta":
          "Qual é o conceito de 'garbage collection' em Java? Como o Java trata o gerenciamento de memória?",
      "resposta":
          "O garbage collection (coleta de lixo) é um recurso da linguagem Java que gerencia automaticamente a alocação e liberação de memória de objetos em tempo de execução. Em outras palavras, o garbage collection é um processo pelo qual o Java identifica e remove automaticamente objetos que não estão mais em uso pelo programa, liberando assim a memória associada a esses objetos./n O gerenciamento de memória em Java é realizado pela Java Virtual Machine (JVM), que aloca memória dinamicamente para objetos criados durante a execução do programa. Quando um objeto não é mais referenciado por nenhum código em execução, o garbage collector detecta que o objeto não é mais necessário e libera a memória associada a ele./n O garbage collector é um processo de fundo que é executado automaticamente pela JVM em intervalos regulares, e geralmente é transparente para o programador. O Java usa um algoritmo de coleta de lixo conhecido como 'mark-and-sweep', que verifica quais objetos ainda estão sendo referenciados pelo programa e quais não estão mais em uso. Os objetos não utilizados são marcados como 'lixo' e o garbage collector remove-os da memória./n Embora o garbage collection torne a programação em Java mais fácil e segura, ele pode ter um impacto negativo no desempenho do programa se não for gerenciado corretamente. Por exemplo, se muitos objetos estiverem sendo criados e destruídos em rápida sucessão, isso pode afetar o desempenho da coleta de lixo. Para evitar esse problema, é importante seguir algumas boas práticas de programação, como limitar o uso de objetos temporários, reutilizar objetos sempre que possível e controlar o escopo das variáveis para minimizar o número de objetos criados e destruídos durante a execução do programa.",
      "filtros": ["BACKEND", "JAVA", "PLENO"]
    },
    {
      "pergunta": "O que é o Hibernate Framework?",
      "resposta":
          "O mapeamento objeto-relacional ou ORM é a técnica de programação para mapear objetos de modelo de domínio de aplicativo para as tabelas de banco de dados relacional. Hibernate é uma ferramenta ORM baseada em Java que fornece uma estrutura para mapear objetos de domínio de aplicativo para as tabelas de banco de dados relacional e vice-versa./n O Hibernate fornece uma implementação de referência da Java Persistence API, o que o torna uma ótima opção como ferramenta ORM com benefícios de baixo acoplamento. Podemos usar a API de persistência do Hibernate para operações CRUD. A estrutura do Hibernate fornece a opção de mapear objetos Java antigos simples para tabelas de banco de dados tradicionais com o uso de anotações JPA, bem como configuração baseada em XML./n Da mesma forma, as configurações de hibernação são flexíveis e podem ser feitas a partir do arquivo de configuração XML, bem como programaticamente.",
      "filtros": ["BACKEND", "JAVA", "SENIOR"]
    },
    {
      "pergunta":
          "Quais são os benefícios importantes de usar o Hibernate Framework?",
      "resposta":
          "Alguns dos benefícios importantes de usar o framework de hibernação são:/n O Hibernate elimina todo o código clichê que vem com o JDBC e cuida do gerenciamento de recursos, para que possamos nos concentrar na lógica de negócios./n A estrutura do Hibernate fornece suporte para anotações XML e JPA, o que torna nossa implementação de código independente./n O Hibernate fornece uma poderosa linguagem de consulta (HQL) que é semelhante ao SQL. No entanto, HQL é totalmente orientado a objetos e entende conceitos como herança, polimorfismo e associação./n Hibernate é um projeto de código aberto da Red Hat Community e usado em todo o mundo. Isso o torna uma escolha melhor do que outros porque a curva de aprendizado é pequena e há toneladas de documentação on-line e a ajuda está facilmente disponível em fóruns./n O Hibernate é fácil de integrar com outros frameworks Java EE, é tão popular que o Spring Framework fornece suporte embutido para integração do hibernate com aplicativos Spring./n O Hibernate suporta inicialização lenta usando objetos proxy e executa consultas de banco de dados reais somente quando necessário./n O cache de hibernação nos ajuda a obter um melhor desempenho./n Para recursos específicos do fornecedor de banco de dados, a hibernação é adequada porque também podemos executar consultas sql nativas./n No geral, a hibernação é a melhor escolha no mercado atual para a ferramenta ORM, pois contém todos os recursos que você precisará em uma ferramenta ORM.",
      "filtros": ["BACKEND", "JAVA", "SENIOR"]
    },
    {
      "pergunta": "Quais são as diferentes tags fornecidas em JSTL?",
      "resposta":
          "Existem 5 tipos de tags JSTL./n tags principais/n tags sql/n tags xml/n tags de internacionalização/n tags de funções",
      "filtros": ["BACKEND", "JAVA", "SENIOR"]
    },
    {
      "pergunta": "",
      "resposta": "",
      "filtros": ["BACKEND"]
    }
  ];
}
