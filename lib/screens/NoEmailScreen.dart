import 'package:flutter/material.dart';

class NoEmailScreen extends StatefulWidget {
  @override
  _NoEmailScreenState createState() => _NoEmailScreenState();
}

class _NoEmailScreenState extends State<NoEmailScreen> {
  final TextEditingController _emailController = new TextEditingController();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Color(0xff6950FB),
                Color(0xffB83AF3),
              ],
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(
                  20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ALERT',
                      style: TextStyle(
                        fontFamily: 'fontbold',
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'You don\'t have a email id. Please provide one for further usage.',
                      style: TextStyle(
                        fontFamily: 'font',
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    TextFormField(
                      controller: _emailController,
                      key: ValueKey('email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (!value.contains('@') || !value.contains('.com')) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            setState(() {
                              _loading = true;
                            });
                            final String email = _emailController.text;
                            if (!email.contains('@') ||
                                !email.contains('.com')) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text('Wrong email format'),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          setState(() {
                                            _loading = false;
                                          });
                                        },
                                        child: Text('OK'),
                                      )
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: _loading
                              ? CircularProgressIndicator()
                              : Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontFamily: 'fontbold',
                                    color: Colors.white,
                                  ),
                                ),
                          color: Color(0xff6950FB),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
