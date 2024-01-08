// auth/auth_screen.dart

import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import '../../../login.dart';
import '../../../registration.dart';

class AuthScreen extends StatelessWidget {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<void> _signInAnonymously() async {
  //   try {
  //     await _auth.signInAnonymously();
  //   } catch (e) {
  //     print('Error signing in anonymously: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage('images/icon1.png'),
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "DUKAAN",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Image.asset("images/welcome2.png"),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text("Sign In"),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    foregroundColor: Colors.white,
                    minimumSize: Size(205.0, 45.0),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text("Register"),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.lightBlueAccent,
                    backgroundColor: Colors.white,
                    minimumSize: Size(205.0, 45.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
