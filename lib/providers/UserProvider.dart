import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String uid;
  String username;
  String email;
  bool loading = true;
  String error = null;
  var rank;
  List fans;
  var views;
  List friends;
  var wallet;
  String profileurl;
  List following;

  void toggleLoading() {
    loading = true;
    notifyListeners();
  }

  Future<void> loadUser() async {
    try {
      final user = await FirebaseAuth.instance.currentUser;
      var docsnap = await Firestore.instance
          .collection('Profiles')
          .document(user.uid)
          .get();
      if (!docsnap.exists) {
        await docsnap.reference.setData({
          'fullname': user.displayName,
          'uid': user.uid,
          'profilepic': user.photoURL,
          'email': user.email,
          'rank': 0,
          'views': 0,
          'fans': [],
          'friends': [],
          'wallet': 0,
          'following': [],
        });
        rank = 0;
        views = 0;
        fans = [];
        friends = [];
        following = [];
        wallet = 0;
      } else {
        rank = await docsnap.data()['rank'];
        views = await docsnap.data()['views'];
        fans = await docsnap.data()['fans'];
        friends = await docsnap.data()['friends'];
        wallet = await docsnap.data()['wallet'];
        following = await docsnap.data()['following'];
      }
      uid = await user.uid;
      username = await user.displayName;
      email = await user.email;
      profileurl = await user.photoURL;
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

  int get getrank {
    return rank;
  }

  int get getviews {
    return views;
  }

  List get getfans {
    return fans;
  }

  List get getfriends {
    return friends;
  }

  int get getwallet {
    return wallet;
  }

  String get getphoto {
    return profileurl;
  }

  List get getfollowing {
    return following;
  }

  void clearUserInfo() {
    uid = null;
    email = null;
    username = null;
    loading = false;
    error = null;
    fans = [];
    friends = [];
    wallet = 0;
    views = 0;
    profileurl = null;
    rank = 0;
  }
}
