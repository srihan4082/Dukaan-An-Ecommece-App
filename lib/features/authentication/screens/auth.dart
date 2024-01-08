import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../shop/screens/home.dart'; // Replace with your home page
import 'auth_screen.dart'; // Create an authentication screen

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Loading indicator
        } else if (snapshot.hasData) {
          return HomePage(); // User is logged in, show home page
        } else {
          return AuthScreen(); // User is not logged in, show authentication screen
        }
      },
    );
  }
}
