import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp2023/auth/login.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final _email = TextEditingController();
  forgetpass() {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text);
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => Login())));
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
            "Forget Password",
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: _email,
          ),
          ElevatedButton(
              onPressed: () {
                forgetpass();
              },
              child: Text("Forget Password")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Another try? ',
                style: TextStyle(fontSize: 20),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.blue, fontSize: 22),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
