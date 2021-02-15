import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationViewModel with ChangeNotifier {
  final FirebaseAuth _firebaseAuth;

  AuthenticationViewModel(this._firebaseAuth);

  Stream<User> get authState => _firebaseAuth.idTokenChanges();

  bool isLogedIn() {
    if (_firebaseAuth.currentUser != null) {
     
      return true;
    } else {
      return false;
    }
  }

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
        (await _firebaseAuth.signInWithEmailAndPassword(
                email: email, password: password))
            .user;

        print("Signed in!");
      } else {
        print("Current user != null ");
      }
    } catch (e) {
      print("sign in olurken hata $e");
    }
  }

  void resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("error on resetPassword  $e");
    }
  }

  void signOut() async {
    try {
      if (isLogedIn()) {
        await _firebaseAuth.signOut();
        print("Loged out");
      } else {
        print("Sign in first");
      }
    } catch (e) {
      print("Sign out olurken hata $e");
    }
  }

  void updatePassword(
      String email, String password, String _newPassword) async {
    try {
      await _firebaseAuth.currentUser.updatePassword(_newPassword);
      print("password updated");
    } on FirebaseAuthException catch (e) {
      try {
        EmailAuthCredential credential =
            EmailAuthProvider.credential(email: email, password: password);

        await FirebaseAuth.instance.currentUser
            .reauthenticateWithCredential(credential);
        await _firebaseAuth.currentUser.updatePassword(_newPassword);
      } catch (e) {
        print("reauthenticate hatası $e");
      }
      print("error on updatePassword $e");
    }
  }

  void updateEmail(String _newEmail, String _oldEmail, String _password) async {
    try {
      await _firebaseAuth.currentUser.updateEmail(_newEmail);
      print("Email updated");
    } catch (e) {
      try {
        EmailAuthCredential credential =
            EmailAuthProvider.credential(email: _oldEmail, password: _password);

        await FirebaseAuth.instance.currentUser
            .reauthenticateWithCredential(credential);
        await _firebaseAuth.currentUser.updateEmail(_newEmail);
      } catch (e) {
        print("reauthenticate hatası $e");
      }
      print("error on updateEmail $e");
    }
  }
}
