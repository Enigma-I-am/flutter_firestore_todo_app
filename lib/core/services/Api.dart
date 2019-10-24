import 'package:cloud_firestore/cloud_firestore.dart';

class Api{
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  Api(this.path){
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getNoteCollection(){
    return ref.getDocuments();
  }

  Stream<QuerySnapshot> streamNoteCollection(){
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getNoteById(String id){
    return ref.document(id).delete();
  }

  Future<void> removeNote(String id){
    return ref.document(id).delete();
  }


  Future<DocumentReference> addNote(Map data){
    return ref.add(data);
  }

  Future<void> updateNote(Map data, String id){
    return ref.document(id).updateData(data);
  }



}