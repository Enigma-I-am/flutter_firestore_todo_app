import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firestore_todo_app/ui/ListScreen.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  String _email, _password, _verifypassword;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
        backgroundColor: Colors.grey.shade900,
        elevation: 1.0,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(

                    // ignore: missing_return
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Please type your email";
                      }
                    },
                    onSaved: (input) => _email = input,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    // ignore: missing_return
                    validator: (input) {
                      if (input.length < 6) {
                        return "Please type your password";
                      }
                    },
                    onSaved: (input) => _password = input,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    // ignore: missing_return
                    validator: (input) {
                      if (input.length < 6 && input == _password) {
                        return "Please check your password";
                      }
                    },
                    onSaved: (input) => _verifypassword = input,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                      child: RaisedButton(
                        onPressed: signUp,
                        child: Text("Sign In"),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
//      if (_password != _verifypassword) {
//        return Scaffold.of(context).showSnackBar(SnackBar(
//          content: Text("Passwords don't match"),
//        ));
//      } else {
        try {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: _email, password: _password);

          Navigator.of(context).pop();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ListScreen()),
          );
        } catch (error) {}
//      }
    }
  }
}
