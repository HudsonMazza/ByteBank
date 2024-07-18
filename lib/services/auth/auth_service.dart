import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // instância de Autenticação
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in/ Entrar
  Future<UserCredential> signInWithEmailPassword(String email, password) async{
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch(e) {
      throw Exception(e.code);
    }
  }
  // Sign up/ Cadastrar
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

      return userCredential;
    } on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }
  // Sign out/ Sair
  Future<void> signOut() async {
    return await _auth.signOut();
  }
  // Erros
}