import 'package:flutter/material.dart';
import 'package:flutter_firestore_todo_app/core/viewmodels/CRUDModel.dart';
import 'package:flutter_firestore_todo_app/locator.dart';
import 'package:flutter_firestore_todo_app/ui/views/ListScreen.dart';
import 'package:flutter_firestore_todo_app/ui/views/Loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'Router.dart';

void main(){
  setupLocator();
  runApp(thisApp());
}

class thisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<FirebaseUser>(
      future: FirebaseAuth.instance.currentUser(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.hasData) {
          FirebaseUser user = snapshot.data;
          // ignore: missing_return
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                builder: (_) => locator<CRUDModel>(),
              )
            ],
            child: MaterialApp(
              initialRoute: '/',
              home: ListScreen(user: user),
              theme: ThemeData(
                brightness: Brightness.dark,
                primaryColor: Colors.lightBlue[800],
                accentColor: Colors.cyan[600],

                // Define the default font family.
                fontFamily: 'Montserrat',
              ),
              onGenerateRoute: Router.generateRoute,
            ),
          );
        } else {
          return MyApp();
        }
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
        home: LoginPage(),
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600],

          // Define the default font family.
          fontFamily: 'Montserrat',
        ),


    );
  }
}
