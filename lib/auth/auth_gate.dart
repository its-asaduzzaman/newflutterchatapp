import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newflutterchatappwithfirebase/auth/login_or_register.dart';
import 'package:newflutterchatappwithfirebase/pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //user is logged in
              return const HomePage();
            } else {
              //user is not logged in
              return const LoginOrRegister();
            }
          }),
    );
  }
}
