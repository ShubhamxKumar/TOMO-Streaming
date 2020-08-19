import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String uid;
  String username;
  String email;
  bool loading = true;
  String error;

  void toggleLoading() {
    loading = true;
    notifyListeners();
  }

  Future<void> loadUser() async {
    try {
      final user = await FirebaseAuth.instance.currentUser;
      uid = await user.uid;
      username = await user.displayName;
      email = await user.email;
      loading = false;
    } catch (err) {
      uid = null;
      email = null;
      username = null;
      loading = false;
      error = err.message;
      print(err.message);
    }
    notifyListeners();
  }

  String get getUserName {
    return username;
  }

  String get getUid {
    return uid;
  }

  String get getEmail {
    return email;
  }

  void clearUserInfo() {
    uid = null;
    email = null;
    username = null;
    loading = false;
    error = null;
  }
}
