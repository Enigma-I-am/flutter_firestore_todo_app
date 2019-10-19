import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String noteTitle;
  String noteBody;
  final DocumentReference reference;

  Note({this.noteTitle, this.noteBody, this.reference});

  Note.fromMap(Map<dynamic, dynamic> map, {this.reference})
      : noteTitle = map["noteTitle"],
        noteBody = map["noteBody"];

  Note.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
     data["noteTitle"]  = noteTitle ;
     data["noteBody"] = noteBody;
     return data;
  }
}
