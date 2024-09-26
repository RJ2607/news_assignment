import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProviderState extends ChangeNotifier {
  late String _name, _email, _uid;

  String _country = 'us';

  String get country => _country;

  String get getName => _name;
  String get getEmail => _email;
  String get getUid => _uid;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> signUp(String email, String password, String name) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (auth.currentUser != null) {
        _uid = auth.currentUser!.uid;
        _email = auth.currentUser!.email!;
        auth.currentUser!.updateDisplayName(name);
        _name = name;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      if (auth.currentUser != null) {
        _uid = auth.currentUser!.uid;
        _email = auth.currentUser!.email!;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  void signOut() {
    auth.signOut();

    _uid = '';
    _email = '';
    _name = '';
  }

  void setCountry(String newCountry) {
    _country = newCountry;
    notifyListeners();
  }
}
