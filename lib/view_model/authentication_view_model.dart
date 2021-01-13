import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationViewModel with ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  AuthenticationViewModel(this._firebaseAuth);

  Stream<User> get authState => _firebaseAuth.idTokenChanges();

  Future<String> signUp(String email, String password) async {
    try {
      UserCredential _credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await _credential.user.sendEmailVerification();
      print("Signed up!");
      await _firebaseAuth.signOut();
    } catch (e) {
      return "sign up olurken hata $e";
    }
  }

  void signIn(String email, String password) async {
    try {
      if (_firebaseAuth.currentUser == null) {
        User loggedInUser = (await  _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password)).user;
        print("Signed in!");
      } else {
        print("currenUser != null ");
      }
    } catch (e) {
      print("sign in olurken hata $e");
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
