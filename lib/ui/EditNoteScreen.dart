import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todo_app/models/Note.dart';

class EditNoteScreen extends StatefulWidget {
  Note noteData;

  EditNoteScreen(this.noteData);

  @override
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  String _noteBody, _noteTitle;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: update,
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
          )
        ],
        title: Text("Add todo"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade900,
        elevation: 1.0,
      ),
      backgroundColor: Colors.grey.shade900,
      body: Container(
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: widget.noteData.noteTitle,
                  controller: null,
                  autofocus: true,
                  maxLines: 2,
                  onSaved: (input) => _noteTitle = input,
                  validator: (val) {
                    if (val.isNotEmpty) {
                      return null;
                    } else {
                      return "Error on this field";
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.grey.shade800),
                    contentPadding: EdgeInsets.all(15.0),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: widget.noteData.noteBody,
                    controller: null,
                    maxLines: 100,
                    onSaved: (input) => _noteBody = input,
                    validator: (val) {
                      if (val.isNotEmpty) {
                        return null;
                      } else {
                        return "Error on this field";
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Note",
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      contentPadding: EdgeInsets.all(15.0),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  update() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      await Firestore.instance
          .collection("notes")
          .document(widget.noteData.reference.documentID)
          .updateData(
              Note(noteTitle: _noteTitle, noteBody: _noteBody).toJson());

      Navigator.pop(context);
    }
  }
}
