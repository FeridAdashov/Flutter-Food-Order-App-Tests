import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_restaurant_order/Screens/Models/user.dart';
import 'package:flutter_restaurant_order/Shared/constants.dart';

import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyFirebaseUser _userFromFirebaseUser(User user) {
    return user != null ? MyFirebaseUser(user.email.split('@')[0]) : null;
  }

  Stream<MyFirebaseUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      return _userFromFirebaseUser(userCredential.user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebaseUser(userCredential.user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('SIGN_OUT:  $e');
      return null;
    }
  }

  Future registerWithEmailAndPassword(
      String email, String password, String type) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      String name = email.split("@")[0];
      await DatabaseService(name: name).setUserData(password, type);

      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print('AAAAAAAAA ' + e.toString());
      return null;
    }
  }
}
