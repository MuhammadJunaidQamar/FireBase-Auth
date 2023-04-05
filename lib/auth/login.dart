import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp2023/auth/forget_pass.dart';
import 'package:flutter_bootcamp2023/auth/signup.dart';
import 'package:flutter_bootcamp2023/auth/welcome.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  logIn() {
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text, password: _password.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
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
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            TextField(
              controller: _email,
            ),
            TextField(
              controller: _password,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPass()));
                    },
                    child: Text("Forget Password"))),
            ElevatedButton(
              onPressed: () {
                logIn();
              },
              child: Text("Login"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign up",
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
