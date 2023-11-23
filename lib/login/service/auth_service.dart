import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final firebaseAuth = FirebaseAuth.instance;
  Future signInAnonymous() async {
    try {
      final result = await firebaseAuth.signInAnonymously();
      return result.user;
    } catch (e) {
      return null;
    }
  }

  Future<String?> signIn(String email, String password) async {
    String? res;
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      res = "success";
    } on FirebaseAuthException catch (e) {
      res = e.message;
    }
    return res;
  }
}
