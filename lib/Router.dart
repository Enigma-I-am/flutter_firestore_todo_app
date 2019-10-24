import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todo_app/ui/views/EditNoteScreen.dart';
import 'package:flutter_firestore_todo_app/ui/views/ListScreen.dart';
import 'package:flutter_firestore_todo_app/ui/views/Loginpage.dart';
import 'package:flutter_firestore_todo_app/ui/views/MakeNoteScreen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ListScreen());
      case '/addNote':
        return MaterialPageRoute(builder: (_) => MakeNoteScreen());
      case '/NoteDetails':
        return MaterialPageRoute(builder: (_) => EditNoteScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}






