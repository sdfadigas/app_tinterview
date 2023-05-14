import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

/*
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("tinterview").snapshots(),
      builder: (context, snapshots){
        return (snapshots.connectionState == ConnectionState.waiting)
        ? Center(
          child: CircularProgressIndicator(),
          )
        : ListView.builder(
          itemCount: snapshots.data!.docs.lenght,
          itemBuilder: (context, Index) {
          var data = snapshots.data!.docs[Index].data() as Map<String, dynamic>;

          if (name.isEmpty) {
            return ListTile(
              title: Text(
                data['name'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.amber,
                fontSize: 16,
                fontWeight: FontWeight.bold),
                ),
                subtitle: Text(,
                data['email'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(data['image']),
              ),
            );
          }
            if(data['name'].toString().startsWith(name.toLowerCase())){
               return ListTile(
              title: Text(
                data['name'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.amber,
                fontSize: 16,
                fontWeight: FontWeight.bold),
                ),
                subtitle: Text(,
                data['email'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(data['image']),
              ),
            );
          }
            } 
            return Container();
          });
          },
      ));
  }
} */