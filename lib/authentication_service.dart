import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nazeeh_beds/screens/homepage.dart';
import 'package:nazeeh_beds/screens/login_screen.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signInWithEmailAndPassword({String email, String password, BuildContext context}) async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      Navigator.pushReplacementNamed(context, HomePage.id);
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return e.message;
    }
  }

  Future<String> signOut(BuildContext context) async{
    try{
      await _firebaseAuth.signOut();
      Navigator.popAndPushNamed(context, LoginScreen.id);
      return "Signed out";
    }
    on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> createUserWithEmailAndPassword({String email, String password, BuildContext context}) async{
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      Navigator.pushReplacementNamed(context, HomePage.id);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return e.message;
    }
  }

  Future<String> deleteUser(BuildContext context) async{
    try {
      await _firebaseAuth.currentUser.delete();
      Navigator.popAndPushNamed(context, LoginScreen.id);
      return "User Deleted";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        return 'The user must reauthenticate before this operation can be executed.';
      }
    }
  }
}