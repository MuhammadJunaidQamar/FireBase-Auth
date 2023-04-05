import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  signUp() {
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text, password: _password.text);
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            TextField(
              controller: _email,
            ),
            TextField(
              //obscureText: true,
              controller: _password,
            ),
            ElevatedButton(
                onPressed: () {
                  signUp();
                },
                child: Text("Sign Up")),
            Row(
              children: [
                Text("Already have an account ?"),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
