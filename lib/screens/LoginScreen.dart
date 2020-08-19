import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  var email = '';
  var password = '';
  final FacebookLogin facebookLogin = new FacebookLogin();
  final _auth = FirebaseAuth.instance;
  UserCredential _userCredential;
  void submit(String email, String password) {
    FocusScope.of(context).unfocus();
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
    }
    print(email + ',' + password);
  }

  Future<void> _loginwithfacebook() async {
    try {
      setState(() {
        loading = true;
      });
      final FacebookLoginResult _result = await facebookLogin.logIn(['email']);
      final token = _result.accessToken.token;
      if (_result.status == FacebookLoginStatus.loggedIn) {
        final credential = FacebookAuthProvider.getCredential(token);
        _userCredential = await _auth.signInWithCredential(credential);
        print(_userCredential.user);
      } else {
        print('error');
      }
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          width: MediaQuery.of(context).size.width,
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
          child: loading
              ? Column(
                  children: [
                    Lottie.network(
                      'https://assets2.lottiefiles.com/datafiles/bEYvzB8QfV3EM9a/data.json',
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.1,
                      fit: BoxFit.cover,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontFamily: 'fontbold',
                                    fontSize: 35,
                                  ),
                                ),
                              ],
                            ),
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
                                  InkWell(
                                    onTap: () => {submit(email, password)},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xff6950FB),
                                            Color(0xffB83AF3),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      padding: EdgeInsets.all(15),
                                      child: Center(
                                        child: Text(
                                          'SIGN IN',
                                          style: TextStyle(
                                            fontFamily: 'fontbold',
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: () => {},
                                    child: Text(
                                      'Forgot your password?',
                                      style: TextStyle(fontFamily: 'font'),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Don\'t have a account?',
                                        style: TextStyle(
                                          fontFamily: 'font',
                                          color: Colors.black.withOpacity(
                                            0.3,
                                          ),
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () => {},
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            fontFamily: 'font',
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              onPressed: () => {_loginwithfacebook()},
                              child: FaIcon(FontAwesomeIcons.facebookF),
                              heroTag: 'facebook',
                            ),
                            FloatingActionButton(
                              onPressed: () => {},
                              child: FaIcon(
                                FontAwesomeIcons.twitter,
                              ),
                              backgroundColor: Color(0xff50C4FF),
                              heroTag: 'twitter',
                            ),
                            FloatingActionButton(
                              onPressed: () => {},
                              child: FaIcon(
                                FontAwesomeIcons.google,
                                color: Colors.white,
                              ),
                              backgroundColor: Color(0xffFC3751),
                              heroTag: 'google',
                            ),
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
