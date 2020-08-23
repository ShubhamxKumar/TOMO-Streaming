import 'package:flutter/material.dart';
import 'package:videostreaming/widgets/MessageBubble.dart';

class ChatScreenMessages extends StatefulWidget {
  @override
  _ChatScreenMessagesState createState() => _ChatScreenMessagesState();
}

class _ChatScreenMessagesState extends State<ChatScreenMessages> {
  List messages = [
    {
      'text': 'Hey guys! What\'s the plan for tonight?',
      "me": false,
    },
    {
      'text': 'Thanks! all things went well. Just a little boring at home',
      "me": true,
    },
    {
      'text': 'Would you like to go to Dane\'s party with me?',
      "me": false,
    },
    {
      'text': 'OK sure! See you tonight!',
      "me": true,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return MessageBubble(
          isMe: messages[index]['me'],
          message: messages[index]['text'],
        );
      },
      itemCount: messages.length,
    );
  }
}
