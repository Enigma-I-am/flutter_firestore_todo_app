
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firestore_todo_app/core/models/Note.dart';
import 'package:flutter_firestore_todo_app/core/services/Api.dart';
import 'package:flutter_firestore_todo_app/locator.dart';

class CRUDModel extends ChangeNotifier{
  Api _api = locator<Api>();

  Stream<QuerySnapshot> fetchProductsAsStream(){
    return _api.streamNoteCollection();
  }

  Future addNote(Note data)async{
    var result = await _api.addNote(data.toJson());
    return;
  }

  Future removeNote(String id)async{
    var doc = await _api.removeNote(id);
    return;
  }

  Future updateNote(Note data, String id)async{
    await _api.updateNote(data.toJson(), id);
  }


}