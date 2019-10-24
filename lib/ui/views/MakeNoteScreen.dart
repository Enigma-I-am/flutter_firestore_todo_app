import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todo_app/core/viewmodels/CRUDModel.dart';
import 'package:provider/provider.dart';

import '../../core/models/Note.dart';

class MakeNoteScreen extends StatefulWidget {


  MakeNoteScreen();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MakeNoteScreenState();
  }
}

class _MakeNoteScreenState extends State<MakeNoteScreen> {
  String _noteBody, _noteTitle;
  DocumentSnapshot snapshot;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _MakeNoteScreenState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var noteProvider = Provider.of<CRUDModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () async{
              if(_formKey.currentState.validate()){
                _formKey.currentState.save();
                await noteProvider.addNote(Note(noteTitle: _noteTitle, noteBody: _noteBody));
                Navigator.pop(context);
              }
            },
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

//  write() async {
//    final formState = _formKey.currentState;
//    if (formState.validate()) {
//      formState.save();
//      await Firestore.instance
//          .collection("notes")
//          .add(Note(noteTitle: _noteTitle, noteBody: _noteBody).toJson());
//
//      Navigator.pop(context);
//    }
//  }


}
