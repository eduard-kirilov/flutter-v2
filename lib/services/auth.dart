import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter1/domain/userFit.dart';

class AuthServise {
  final FirebaseAuth auth;

  AuthServise(this.auth);

  // The login of the current user
  Future<UserFit> signIn(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return UserFit.fromFirebase(user);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  // New user registration
  Future<UserFit> signUp(String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return UserFit.fromFirebase(user);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  // User logs out
  Future signOut() async {
    await auth.signOut();
  }

  // Getting information about the current user
  Stream<UserFit> get currentUser => auth
      .authStateChanges()
      .map((User user) => user != null ? UserFit.fromFirebase(user) : null);
}
