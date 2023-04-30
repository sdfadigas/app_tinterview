import 'dart:io';
import 'package:app_tinterview/viewers/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_tinterview/models/LoginLogoutGoogle.dart';
import 'package:app_tinterview/viewers/AboutPage.dart';
import 'package:app_tinterview/viewers/ExercisesPage.dart';
import 'package:app_tinterview/viewers/ItensSalvosPage.dart';


class ImagePickerExample extends StatefulWidget {
  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
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
    return Scaffold(endDrawer: Drawer(


      child: Container(
        color: Color(0xFF222222),
        alignment: Alignment.centerRight,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      backgroundImage: _image != null ? FileImage(_image!) : null,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
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

              leading: Icon(Icons.bookmark, color: Color(0xFFeeeeee)),
              title: Text('Meus Itens Salvos', style: TextStyle(color: Color(0xFFeeeeee))),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ItensSalvosPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color: Color(0xFFeeeeee)),
              title: Text('Questões para Praticar', style: TextStyle(color: Color(0xFFeeeeee))),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ExercisesPage()));

                //  tem que ver se vai implementar mesmo
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Color(0xFFeeeeee)),
              title: Text('Sobre',style: TextStyle(color: Color(0xFFeeeeee))),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
              },
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.logout, color: Color(0xFFeeeeee)),
              title: Text('Sair', style: TextStyle(color: Color(0xFFeeeeee))),
              onTap: () async {
                await LoginController().signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],),
      ),


    ),
    );
  }
}
