import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp2023/auth/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  logOut() {
    try {
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
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
              "Welcome to home",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  logOut();
                },
                child: Text("LogOut"))
          ],
        ),
      ),
    );
  }
}
