import 'dart:io';
import 'package:app_tinterview/constant/constant.dart';
import 'package:app_tinterview/models/Usuario.dart';
import 'package:app_tinterview/service/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_tinterview/viewers/ItensSalvosPage.dart';
import 'package:app_tinterview/viewers/QuizPage.dart';
import 'package:provider/provider.dart';

import '../viewers/VagasPage.dart';
import '../viewers/codeteste.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UsuarioProvider>(context);

    return Drawer(
      backgroundColor: const Color(0xFF222222),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _user.nome != null
                      ? "Boas Vindas, ${_user.nome}!"
                      : "Boas Vindas!",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.bookmark, color: Color(0xFFeeeeee)),
            title: const Text('Meus Itens Salvos',
                style: TextStyle(color: Color(0xFFeeeeee))),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ItensSalvosPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb, color: Color(0xFFeeeeee)),
            title:
                const Text('Quiz', style: TextStyle(color: Color(0xFFeeeeee))),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QuizScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.code, color: Color(0xFFeeeeee)),
            title: const Text('Code Interview (Exemplo)',
                style: TextStyle(color: Color(0xFFeeeeee))),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CodeInterviewPage()));
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.person_search, color: Color(0xFFeeeeee)),
            title: const Text('Repositório de Vagas',
                style: TextStyle(color: Color(0xFFeeeeee))),
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: ListTile(
                  title: const Text('FrontEnd'),
                  textColor: Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VagasPage(
                          url: 'https://github.com/frontendbr/vagas/issues',
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: ListTile(
                  title: const Text('BackEnd'),
                  textColor: Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VagasPage(
                          url: 'https://github.com/backend-br/vagas/issues',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Color(0xFFeeeeee)),
            title:
                const Text('Sobre', style: TextStyle(color: Color(0xFFeeeeee))),
            onTap: () {
              Navigator.pushNamed(context, ConstantsRoute.ABOUT);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFFeeeeee)),
            title:
                const Text('Sair', style: TextStyle(color: Color(0xFFeeeeee))),
            onTap: () {
              context.read<AuthService>().logout();
              Navigator.pushReplacementNamed(context, ConstantsRoute.LOGIN);
            },
          ),
        ],
      ),
    );
  }
}
