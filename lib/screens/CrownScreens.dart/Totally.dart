import 'package:flutter/material.dart';

class Totally extends StatefulWidget {
  @override
  _TotallyState createState() => _TotallyState();
}

class _TotallyState extends State<Totally> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text('Daily'),
      ),
    );
  }
}
