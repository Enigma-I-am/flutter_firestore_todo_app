import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todo_app/Note.dart';


class NoteListItem extends StatelessWidget {
  final DocumentSnapshot snapshot;

  NoteListItem(this.snapshot);

  @override
  Widget build(BuildContext context) {
    final noteData = Note.fromSnapshot(snapshot);
    return  Container(child: Column(children: <Widget>[Text(noteData?.noteTitle ?? ' ')],),);
  }

}
