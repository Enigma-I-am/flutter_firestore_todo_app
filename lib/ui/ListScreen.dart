import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListScreenState();
  }
}

class ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("TO-DO"),
          backgroundColor: Colors.grey.shade900,
          elevation: 0.0,
        ),
        backgroundColor: Colors.grey.shade900,
        floatingActionButton: FloatingActionButton(
          onPressed: () => debugPrint("click me!!"),
          backgroundColor: Colors.green,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[],
          ),
          color: Colors.blueGrey,
        ));
  }
}
