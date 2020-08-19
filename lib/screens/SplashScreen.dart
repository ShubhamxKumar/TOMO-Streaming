import 'dart:async';

import 'package:flutter/material.dart';
import 'package:videostreaming/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigateToHome() async {
    Timer(Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MyApp(),
        ),
      );
    });
  }

  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xff6950FB),
                        Color(0xffB83AF3),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/splash_icon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  ' TOMO ',
                  style: TextStyle(
                    fontFamily: 'fontbold',
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
                Text(
                  'LIVE',
                  style: TextStyle(
                    fontFamily: 'fontbold',
                    color: Colors.black.withOpacity(0.2),
                    fontSize: 32,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
