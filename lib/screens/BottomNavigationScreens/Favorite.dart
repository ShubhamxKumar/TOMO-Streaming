import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView( 
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15), 
                decoration: BoxDecoration(
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
                  child: Text(
                    'Follow',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'fontlight', 
                      fontWeight: FontWeight.w700, 
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
