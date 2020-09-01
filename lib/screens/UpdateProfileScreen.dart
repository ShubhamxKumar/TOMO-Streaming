import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:videostreaming/providers/UserProvider.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  var created = false;
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  var name = '';
  var bio = '';

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    void update(String name, String bio) async {
      setState(() {
        loading = true;
      });
      try {
        var res = await user.updateProfile(name, bio);
        if (res == true) {
          setState(() {
            loading = false;
            created = true;
          });
          Timer(Duration(milliseconds: 2300), () {
            Navigator.of(context).pop();
          });
        } else {
          setState(() {
            loading = false;
          });
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Update Profile failed. Please try again later.'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  )
                ],
              );
            },
          );
        }
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

    void _saveData() {
      FocusScope.of(context).unfocus();
      if (_formkey.currentState.validate()) {
        _formkey.currentState.save();
        update(name.trim(), bio.trim());
      }
    }

    var appbar = AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        'Update Profile',
        style: TextStyle(
          fontFamily: 'fontbold',
          color: Colors.black,
        ),
      ),
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: appbar,
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
              (MediaQuery.of(context).padding.top +
                  appbar.preferredSize.height),
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
                                        'User Name',
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
                                    initialValue: user.getUserName,
                                    onSaved: (newValue) {
                                      name = newValue;
                                    },
                                    key: ValueKey('name'),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value.isEmpty) {
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
                                        'Bio',
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
                                    initialValue: user.getBio,
                                    onSaved: (newValue) {
                                      bio = newValue;
                                    },
                                    key: ValueKey('bio'),
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
                                                'UPDATE',
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
