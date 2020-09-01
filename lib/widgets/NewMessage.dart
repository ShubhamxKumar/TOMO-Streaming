import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String _enteredMessage = '';
  var _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'New Message',
              ),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
