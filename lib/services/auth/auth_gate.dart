import 'package:byte_bank/auth/login_or_register.dart';
import 'package:byte_bank/pages/transfer_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged in / usuário está logado
          if (snapshot.hasData) {
            return const HomePage();
          }
          // User is NOT logged in / usuário não está logado
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
