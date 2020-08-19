import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(13),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Center(
                      child: Text(
                        'Messages',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'fontlight',
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.search,
                        color: Colors.white,
                        size: 20, 
                      ),
                      onPressed: () {},
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
