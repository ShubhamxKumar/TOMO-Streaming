import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:min_id/min_id.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  var email = '';
  var password = '';
  var name = '';
  final TextEditingController _nameController = new TextEditingController();
  var created = false;
  final _auth = FirebaseAuth.instance;
  void _saveData() {
    FocusScope.of(context).unfocus();
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      signUptheUser(name.trim(), email.trim(), password);
    }
  }

  void signUptheUser(String name, String email, String password) async {
    try {
      setState(() {
        loading = true;
      });
      var id = MinId.getId();
      UserCredential _userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await Firestore.instance
          .collection('Users')
          .document(_userCredential.user.uid)
          .setData({
        'fullname': name,
        'uide': _userCredential.user.uid,
        'profilepic':
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.yy2wPVsfeyWkRxrh6rNx7gHaHz%26pid%3DApi&f=1',
        'email': email,
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
      setState(() {
        loading = false;
        created = true;
      });
      Timer(Duration(milliseconds: 2300), () {
        Navigator.of(context).pop();
      });
    } catch (err) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(err.message),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    loading = false;
                  });
                },
                child: Text('OK'),
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xffB83AF3),
                Color(0xff6950FB),
              ],
              stops: [0.001, 1],
            ),
          ),
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).padding.top),
          width: MediaQuery.of(context).size.width,
          child: created
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.4,
                      child: Card(
                        color: Colors.transparent,
                        child: Container(
                          color: Colors.transparent,
                          child: Lottie.network(
                            'https://assets2.lottiefiles.com/private_files/lf30_v2PAPH.json',
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.width * 0.2,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(1, 1),
                                  blurRadius: 5.0,
                                  spreadRadius: 0.1)
                            ]),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.3),
                                          fontFamily: 'font',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    onSaved: (newValue) {
                                      email = newValue;
                                    },
                                    key: ValueKey('email'),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (!value.contains('@') ||
                                          !value.contains('.com')) {
                                        return 'Please enter a valid email address';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'font',
                                        fontSize: 18),
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffF5F5F5),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name',
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.3),
                                          fontFamily: 'font',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    onSaved: (newValue) {
                                      name = newValue;
                                    },
                                    controller: _nameController,
                                    key: ValueKey('name'),
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter a valid name';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'font',
                                        fontSize: 18),
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffF5F5F5),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Password',
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.3),
                                          fontFamily: 'font',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    key: ValueKey('password'),
                                    validator: (value) {
                                      if (value.isEmpty || value.length < 7) {
                                        return 'Please enter password with more that 7 charachter.';
                                      }
                                      return null;
                                    },
                                    onSaved: (newValue) {
                                      password = newValue;
                                    },
                                    obscureText: true,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'font',
                                        fontSize: 18),
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffF5F5F5),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  loading
                                      ? Lottie.network(
                                          'https://assets2.lottiefiles.com/datafiles/bEYvzB8QfV3EM9a/data.json',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          fit: BoxFit.contain,
                                        )
                                      : InkWell(
                                          onTap: () => {_saveData()},
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xff6950FB),
                                                  Color(0xffB83AF3),
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            padding: EdgeInsets.all(15),
                                            child: Center(
                                              child: Text(
                                                'CREATE',
                                                style: TextStyle(
                                                  fontFamily: 'fontbold',
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
