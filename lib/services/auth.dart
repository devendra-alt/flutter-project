import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:sign_up_app/private/Settings.dart';
class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  //tracking users status
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<String> signIn({String email, String password, String uName}) async {
   
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email,password: password,);
      print("sucess");
       
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<String> signUp({String email, String password, String uName}) async {
    
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
         
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print(e.message);
      return false;
    }
  }
}
