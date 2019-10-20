import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todo_app/ui/Loginpage.dart';
import 'package:flutter_firestore_todo_app/ui/MakeNoteScreen.dart';
import 'package:flutter_firestore_todo_app/ui/widgets/NoteListItem.dart';

import '../models/Note.dart';

class ListScreen extends StatefulWidget {
  final FirebaseUser user;

  const ListScreen({Key key, this.user}) : super(key: key);

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
          // ignore: missing_return
          PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                child: Text("SignOut"),
                value: "SignOut" ,
              ),
            ],
            onSelected: SignOut,
          ),
        ],
        backgroundColor: Colors.grey.shade900,
        elevation: 1.0,
      ),
      body: BuildList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
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

  void SignOut(String choice)async {
    if (choice == "SignOut") {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}

class BuildList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("notes").snapshots(),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Container(
              height: 45,
              width: 45,
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return BuildNoteList(snapshot.data.documents);
        }
      },
    );
  }
}

class BuildNoteList extends StatelessWidget {
  final List<DocumentSnapshot> snapshot;

  BuildNoteList(this.snapshot);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: snapshot.length > 0
          ? ListView(
              children: snapshot.map((data) => NoteListItem(data)).toList(),
            )
          : Text("No notes"),
    );
  }
}
