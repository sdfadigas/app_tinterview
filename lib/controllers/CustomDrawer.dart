import 'dart:io';
import 'package:app_tinterview/constant/constant.dart';
import 'package:app_tinterview/models/Usuario.dart';
import 'package:app_tinterview/service/AuthService.dart';
import 'package:app_tinterview/viewers/AboutPage.dart';
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
    final _authService = Provider.of<AuthService>(context);

    String? imageUrl =
        _authService.usuario != null ? _authService.usuario!.photoURL : null;

    ImageProvider? backgroundImage;
    if (_image != null) {
      backgroundImage = FileImage(_image!);
    } else if (imageUrl != null) {
      backgroundImage = NetworkImage(imageUrl);
    }

    return Drawer(
      backgroundColor: const Color(0xFF222222),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: imageUrl == null
                      ? _pickImage
                      : null, // Impede a seleção de imagem se a imagem do Google estiver carregada
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    backgroundImage: backgroundImage,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  _user.nome != null
                      ? "Boas Vindas, ${_user.nome}!"
                      : "Boas Vindas!",
                  style: TextStyle(
                    fontSize: 17.5,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Divider(
                  color: Color.fromARGB(255, 46, 45, 45),
                  thickness: 1,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.bookmark, color: Color(0xFFeeeeee)),
            title: const Text('Meus Itens Salvos',
                style: TextStyle(color: Color(0xFFeeeeee))),
            onTap: () {
              final userUID = _user.id;
              if (userUID != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItensSalvosPage(userUID: userUID),
                  ),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb, color: Color(0xFFeeeeee)),
            title:
                const Text('Quiz', style: TextStyle(color: Color(0xFFeeeeee))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.code, color: Color(0xFFeeeeee)),
            title: const Text('Code Interview (Exemplo)',
                style: TextStyle(color: Color(0xFFeeeeee))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CodeInterviewPage(),
                ),
              );
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.person_search, color: Color(0xFFeeeeee)),
            title: const Text('Repositório de Vagas',
                style: TextStyle(color: Color(0xFFeeeeee))),
            iconColor: Colors.white,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: ListTile(
                  title: const Text('Frontend'),
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
                  title: const Text('Backend'),
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
