import 'package:app_tinterview/viewers/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VagasPage extends StatefulWidget {
  final String url;

  VagasPage({required this.url});

  @override
  _VagasPageState createState() => _VagasPageState();
}

class _VagasPageState extends State<VagasPage> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Atualize a barra de carregamento.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        centerTitle: true,
        title: Image.asset(
          "images/logo.png",
          width: 48,
          height: 48,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Ajuda'),
                    content: Text(
                        'Para aplicar filtros, utilize o botão: \n\n"Labels" \n\n\n Para limpar os filtros, utilize o botão: \n\n "Clear current search query, filters, and sorts"'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Fechar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
