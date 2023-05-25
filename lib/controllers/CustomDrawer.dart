import 'dart:io';
import 'package:app_tinterview/viewers/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_tinterview/viewers/AboutPage.dart';
import 'package:app_tinterview/viewers/ItensSalvosPage.dart';

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
                const Text(
                  "Boas Vindas!",
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ItensSalvosPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Color(0xFFeeeeee)),
            title: const Text('Sobre', style: TextStyle(color: Color(0xFFeeeeee))),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutPage()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFFeeeeee)),
            title: const Text('Sair', style: TextStyle(color: Color(0xFFeeeeee))),
            onTap: () {
              //await LoginController().signOut();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Login()));
            },
          ),
        ],
      ),
    );
  }
}
