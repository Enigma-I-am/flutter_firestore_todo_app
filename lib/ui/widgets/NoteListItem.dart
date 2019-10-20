import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todo_app/models/Note.dart';
import 'package:flutter_firestore_todo_app/Utils/randomColors.dart';
import 'package:flutter_firestore_todo_app/ui/EditNoteScreen.dart';

class NoteListItem extends StatefulWidget {
  final DocumentSnapshot snapshot;

  NoteListItem(this.snapshot);

  @override
  _NoteListItemState createState() => _NoteListItemState();
}

class _NoteListItemState extends State<NoteListItem> {
  @override
  Widget build(BuildContext context) {
    final noteData = Note.fromSnapshot(widget.snapshot);
    return Dismissible(
      key: Key(noteData.reference.documentID),
      onDismissed: (direction)
          // ignore: unnecessary_statements
          async {
        await Firestore.instance
            .collection("notes")
            .document(noteData.reference.documentID)
            .delete();

        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            "item Deleted",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black12,
        ));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.24,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(2.0, 1.0, 2.0, 1.0),
              child: Card(
                color: randomColors(),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditNoteScreen(noteData)),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: Text(
                          noteData?.noteTitle ?? ' ',
                          style: TextStyle(
                              fontSize: 23,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                          child: Text(
                            noteData?.noteBody ?? ' ',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
