import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:min_id/min_id.dart';

class UserProvider extends ChangeNotifier {
  String uid;
  String username;
  String email;
  String bio;
  bool loading = true;
  String error = null;
  var id;
  var rank;
  List fans;
  var views;
  List friends;
  var wallet;
  String profileurl;
  List following;
  bool liveStatus;

  void toggleLoading() {
    loading = true;
    notifyListeners();
  }

  Future<void> loadUser() async {
    try {
      final user = await FirebaseAuth.instance.currentUser;
      var docsnap =
          await Firestore.instance.collection('Users').document(user.uid).get();
      if (!docsnap.exists) {
        id = MinId.getId();
        await docsnap.reference.setData({
          'fullname': user.displayName,
          'uide': user.uid,
          'profilepic': user.photoURL,
          'email': user.email,
          'rank': 0,
          'views': 0,
          'fans': [],
          'friends': [],
          'wallet': 0,
          'following': [],
          'ide': id,
          'bio': 'This is your sample bio.',
          'live': false,
        });
        rank = 0;
        views = 0;
        fans = [];
        friends = [];
        following = [];
        wallet = 0;
        email = user.email;
        username = user.displayName;
        profileurl = user.photoURL;
        uid = user.uid;
        liveStatus = false;
      } else {
        rank = await docsnap.data()['rank'];
        views = await docsnap.data()['views'];
        fans = await docsnap.data()['fans'];
        friends = await docsnap.data()['friends'];
        wallet = await docsnap.data()['wallet'];
        following = await docsnap.data()['following'];
        id = await docsnap.data()['ide'];
        bio = await docsnap.data()['bio'];
        email = await docsnap.data()['email'];
        username = await docsnap.data()['fullname'];
        uid = await docsnap.data()['uide'];
        profileurl = await docsnap.data()['profilepic'];
        liveStatus = await docsnap.data()['live'];
      }
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

  bool get getLoading {
    return loading;
  }

  String get getUserName {
    return username;
  }

  String get getUid {
    return uid;
  }

  String get getId {
    return id;
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

  String get getBio {
    return bio;
  }

  Future<void> updateLiveStatus(bool status) async {
    try {
      DocumentSnapshot _doc =
          await Firestore.instance.collection('Users').doc(uid).get();

      await _doc.reference.updateData({
        'live': status,
      });
      liveStatus = status;
      notifyListeners();
    } catch (err) {
      liveStatus = false;
      print(err.message);
      notifyListeners();
    }
  }

  Future<void> addFollowing(
    String tname,
    String tid,
  ) async {
    var user = {
      'name': tname,
      'id': tid,
    };
    following.add(user);
    try {
      DocumentSnapshot _doc =
          await Firestore.instance.collection('Users').doc(uid).get();
      QuerySnapshot _query = await Firestore.instance
          .collection('Users')
          .where('ide', isEqualTo: tid)
          .getDocuments();
      if (await _query.documents.length == 1) {
        await _query.documents.forEach((element) async {
          List _temp = await element.data()['fans'];
          _temp.add({
            'name': username,
            'id': id,
          });
          await element.reference.updateData({
            'fans': _temp,
          });
        });
      }
      await _doc.reference.updateData({
        'following': following,
      });
    } catch (err) {
      var user;
      following.map((element) {
        if (element['id'] == tid) {
          user = element;
        }
      }).toList();
      following.remove(user);
      print(err.message);
    }
    notifyListeners();
  }

  Future<void> deleteFollowing(
    String tname,
    String tid,
  ) async {
    var user;
    following.map((element) {
      if (element['id'] == tid) {
        print('trueeeee');
        user = element;
      }
    }).toList();
    following.remove(user);
    try {
      DocumentSnapshot _doc =
          await Firestore.instance.collection('Users').doc(uid).get();
      QuerySnapshot _query = await Firestore.instance
          .collection('Users')
          .where('ide', isEqualTo: tid)
          .getDocuments();
      if (await _query.documents.length == 1) {
        await _query.documents.forEach((element) async {
          List _temp = await element.data()['fans'];
          var user2;
          _temp.map((e) {
            if (e['id'] == id) {
              user2 = e;
            }
          }).toList();
          _temp.remove(user2);
          await element.reference.updateData({
            'fans': _temp,
          });
        });
      }
      await _doc.reference.updateData({
        'following': following,
      });
    } catch (err) {
      var user = {
        'name': tname,
        'id': tid,
      };
      following.add(user);
      print(err.message);
    }
    notifyListeners();
  }

  Future<bool> updateProfile(
    String tname,
    String tbio,
  ) async {
    try {
      DocumentSnapshot _docsnap =
          await Firestore.instance.collection('Users').doc(uid).get();
      await _docsnap.reference.updateData({
        'bio': tbio,
        'fullname': tname,
      });
      bio = tbio;
      username = tname;
      notifyListeners();
      return true;
    } catch (err) {
      print(err.message);
      return false;
    }
  }

  Future<bool> updateEmail(String temail) async {
    try {
      DocumentSnapshot _docsnap =
          await Firestore.instance.collection('Users').doc(uid).get();
      await _docsnap.reference.updateData({
        'email': temail,
      });
      email = temail;
      notifyListeners();
      return true;
    } catch (err) {
      print(err.message);
      return false;
    }
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
