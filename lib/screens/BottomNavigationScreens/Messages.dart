import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:videostreaming/widgets/MessageTile.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List UsersLive = [
    {
      'name': 'John Doe',
      'latest': 'Hey! How is it going?',
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.explicit.bing.net%2Fth%3Fid%3DOIP.-l7U8CSRm-8TQ2TfM5SaeQHaKE%26pid%3DApi&f=1',
    },
    {
      'name': 'Sara Dane',
      "latest": 'Did you had fun last night?',
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.jmreEH6yJdq8upJAWyOOqAHaJY%26pid%3DApi&f=1',
    },
    {
      'name': 'Scarlett',
      'latest': 'Hey I really want to collab with you.',
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.CLhTP-UgIxS855hdQ-aMJAHaHd%26pid%3DApi&f=1',
    },
    {
      'name': 'Jane Austen',
      'latest': 'Can we go out for a dinner tonight.',
      'photo':
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.-QTqxxcZT08TlxjxaFvuhQHaE7%26pid%3DApi&f=1',
    },
  ];
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
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: SingleChildScrollView(
                  child: Column(
                    children: UsersLive.map((user) {
                      return MessageTile(
                        name: user['name'],
                        photo: user['photo'],
                        latest: user['latest'],
                      );
                    }).toList(),
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
