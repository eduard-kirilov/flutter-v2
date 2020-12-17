import 'package:firebase_auth/firebase_auth.dart';

class UserFit {
  String id;

  UserFit.fromFirebase(User user) {
    id = user.uid;
  }
}
