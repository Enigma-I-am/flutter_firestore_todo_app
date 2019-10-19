import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todo_app/ui/MakeNoteScreen.dart';

class ListScreen extends StatefulWidget {
  final FirebaseUser user;

  const ListScreen({Key key,  this.user}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListScreenState();
  }
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert,color: Colors.white,),
            onPressed: null,
          )
        ],
        backgroundColor: Colors.grey.shade900,
        elevation: 1.0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MakeNoteScreen()),
          );
        },

        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
