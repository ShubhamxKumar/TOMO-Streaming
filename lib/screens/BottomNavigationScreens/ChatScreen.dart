import 'package:flutter/material.dart';
import 'package:videostreaming/widgets/ChatScreenMessages.dart';
import 'package:videostreaming/widgets/NewMessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6950FB),
          elevation: 6,
          centerTitle: true,
          title: Text(
            'User Name',
            style: TextStyle(),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ChatScreenMessages(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
