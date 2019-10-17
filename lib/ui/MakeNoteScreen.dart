import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakeNoteScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MakeNoteScreenState();
  }
}

class MakeNoteScreenState extends State<MakeNoteScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[IconButton(onPressed: null,icon: Icon(Icons.check,color: Colors.white,),)],
        title: Text("Add todo"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade900,
        elevation: 1.0,
      ),
      backgroundColor: Colors.grey.shade900,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: null,
                autofocus: true,
                maxLines: 2,
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
                child: TextField(
                  controller: null,
                  maxLines: 100,
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
    );
  }
}
